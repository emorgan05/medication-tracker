class UserController < ApplicationController

  #### signup
  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect to '/medicines'
    end
  end

  post '/signup' do
    user = User.new(params[:user])
    user.calendar = Calendar.new
    if user.save
      session[:id] = user.id
      redirect to '/medicines'
    else
      flash[:message] = user.errors.full_messages.to_sentence
      redirect to '/signup'
    end
  end

  #### login
  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/medicines'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect to '/medicines'
    else
      flash[:message] = "The username or password are incorrect."
      redirect to '/login'
    end
  end

  #### logout
  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/login'
    end
  end

end
