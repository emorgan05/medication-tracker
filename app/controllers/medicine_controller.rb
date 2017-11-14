class MedicineController < ApplicationController

  #### show all medicines for the user
  get '/medicines' do
    @user = User.find(session[:id])

    erb :'medicines/index'
  end

  #### user can create a new med
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

  #### user can retrieve details for one medicine
  get '/medicine/:id' do
    @medicine = Medicine.find(params[:id])
    erb :'medicines/show'
  end

end
