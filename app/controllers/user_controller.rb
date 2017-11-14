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

  end
end
