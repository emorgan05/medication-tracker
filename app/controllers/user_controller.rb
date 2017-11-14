class UserController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.new(params[:user])
    user.save
    if user.save
      session[:id] = user.id
    end

    redirect to '/medicines'
  end
end
