class UserController < ApplicationController

  #### signup
  get '/signup' do
    if !logged_in?(session)
      erb :'users/signup'
    else
      redirect to '/medicines'
    end
  end

  post '/signup' do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      redirect to '/login'
    elsif user
      flash[:message] = "That username already exists. Please choose a different username."
      redirect to '/signup'
    elsif params[:user][:username] != "" && params[:user][:email] != "" && params[:user][:password] != ""
      user = User.new(params[:user])
      user.calendar = Calendar.new
      user.save
      if user.save
        session[:id] = user.id
      end
      redirect to '/medicines'
    else
      flash[:message] = "All fields are required."
      redirect to '/signup'
    end
  end

  #### login
  get '/login' do
    if !logged_in?(session)
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
    if logged_in?(session)
      session.clear
      redirect to '/login'
    else
      redirect to '/login'
    end
  end

end
