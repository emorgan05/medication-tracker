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
    if logged_in?(session) && current_user(session)
      erb :'medicines/new'
    else
      redirect to '/'
    end
  end

  post '/medicines' do
    if params[:medicine][:name] != "" && params[:medicine][:dose_number] != "" && params[:medicine][:number_in_bottle] != ""
      user = User.find(session[:id])
      medicine = Medicine.new(params[:medicine])
      medicine.user_id = user.id
      medicine.save
      redirect to '/medicines'
    else
      redirect to '/medicines/new'
    end
  end

  #### user can retrieve details for one medicine
  get '/medicines/:id' do
    if logged_in?(session) && current_user(session)
      @medicine = Medicine.find(params[:id])
      erb :'medicines/show'
    else
      redirect to '/'
    end
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
