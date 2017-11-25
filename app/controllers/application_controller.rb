require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    use Rack::Flash, sweep: :true
  end

  get "/" do
    if !logged_in?(session)
      erb :welcome
    else
      redirect to '/medicines'
    end
  end

  helpers do
    def current_user(session)
      @current_user ||= User.find(session[:id]) if session[:id]
    end

    def logged_in?(session)
      !!session[:id]
    end
  end
end
