class MedicineController < ApplicationController

  get '/medicines' do
    @user = User.find(session[:id])

    erb :'medicines/index'
  end

  get '/medicines/new' do
    erb :'medicines/new'
  end
end
