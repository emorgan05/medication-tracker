class UserController < ApplicationController

  #### signup
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

  #### login
  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect to '/medicines'
    else
      redirect to '/login'
    end
  end
end
