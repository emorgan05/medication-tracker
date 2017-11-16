class MedicineController < ApplicationController

  #### show all medicines for the user
  get '/medicines' do
    if logged_in?(session) && current_user(session)
      @user = User.find(session[:id])
      erb :'medicines/index'
    else
      flash[:message] = "Please login to see your medicines, or signup for a new account."
      redirect to '/'
    end
  end

  #### user can create a new med
  get '/medicines/new' do
    if logged_in?(session) && current_user(session)
      erb :'medicines/new'
    else
      flash[:message] = "Please login to add a medicine, or signup for a new account."
      redirect to '/'
    end
  end

  post '/medicines' do
    if params[:medicine][:name] != "" && params[:medicine][:dose_number] != "" && params[:medicine][:number_in_bottle] != ""
      user = User.find(session[:id])
      medicine = Medicine.new(params[:medicine])
      medicine.user_id = user.id
      medicine.refill_date = medicine.calculate_refill_date
      medicine.save
      redirect to '/medicines'
    else
      flash[:message] = "Medicine name, how many pills, and how many in the bottle are required fields."
      redirect to '/medicines/new'
    end
  end

  #### user can retrieve details for one medicine
  get '/medicines/:id' do
    @medicine = Medicine.find(params[:id])
    if logged_in?(session) && current_user(session).id == @medicine.user_id
      erb :'medicines/show'
    else
      flash[:message] = "You can only view your medicines. Please select from the list below."
      redirect to '/medicines'
    end
  end

  #### user can edit a medicine
  get '/medicines/:id/edit' do
    @medicine = Medicine.find(params[:id])
    if logged_in?(session) && current_user(session).id == @medicine.user_id
      erb :'medicines/edit'
    else
      flash[:message] = "You can only edit your medicines. Please select from the list below."
      redirect to '/medicines'
    end
  end

  patch '/medicines/:id' do
    if params[:medicine][:name] != "" && params[:medicine][:dose_number] != "" && params[:medicine][:number_in_bottle] != ""
      @medicine = Medicine.find(params[:id])
      @medicine.update(params[:medicine])
      @medicine.refill_date = ""
      @medicine.refill_date = @medicine.calculate_refill_date
      @medicine.save
      redirect to "medicines/#{@medicine.id}"
    else
      flash[:message] = "Medicine name, how many pills, and how many in the bottle are required fields."
      redirect to "medicines/#{params[:id]}/edit"
    end
  end

  #### user can delete a medicine
  post '/medicines/:id/delete' do
    @medicine = Medicine.find(params[:id])
    if logged_in?(session) && current_user(session).id == @medicine.user_id
      @medicine.destroy
      redirect to '/medicines'
    else
      flash[:message] = "You can only delete your medicines. Please select from the list below."
      redirect to '/medicines'
    end
  end

end
