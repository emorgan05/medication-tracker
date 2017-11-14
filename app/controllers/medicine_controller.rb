class MedicineController < ApplicationController

  get '/medicines' do
    @user = User.find(session[:id])

    erb :'medicines/index'
  end

  get '/medicines/new' do
    erb :'medicines/new'
  end

  post '/medicines' do
    user = User.find(session[:id])
    medicine = Medicine.new(params[:medicine])
    medicine.user_id = user.id
    medicine.save

    redirect to '/medicines'
  end
end
