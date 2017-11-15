class MedicineController < ApplicationController

  #### show all medicines for the user
  get '/medicines' do
    if logged_in?(session) && current_user(session)
      @user = User.find(session[:id])
      erb :'medicines/index'
    else
      redirect to '/'
    end
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
  get '/medicines/:id' do
    @medicine = Medicine.find(params[:id])
    erb :'medicines/show'
  end


  #### user can edit a medicine
  get '/medicines/:id/edit' do
    @medicine = Medicine.find(params[:id])
    erb :'medicines/edit'
  end

  patch '/medicines/:id' do
    @medicine = Medicine.find(params[:id])
    @medicine.update(params[:medicine])

    redirect to "medicines/#{@medicine.id}"
  end

  #### user can delete a medicine
  post '/medicines/:id/delete' do
    @medicine = Medicine.find(params[:id])
    @medicine.delete
    redirect to '/medicines'
  end

end
