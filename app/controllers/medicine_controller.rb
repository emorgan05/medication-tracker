class MedicineController < ApplicationController

  #### show all medicines for the user
  get '/medicines' do
    if logged_in?
      erb :'medicines/index'
    else
      flash[:message] = "Please login to see your medicines, or signup for a new account."
      redirect to '/'
    end
  end

  #### user can create a new med
  get '/medicines/new' do
    if logged_in?
      erb :'medicines/new'
    else
      flash[:message] = "Please login to add a medicine, or signup for a new account."
      redirect to '/'
    end
  end

  post '/medicines' do
    if logged_in?
      medicine = Medicine.new(params[:medicine])
      medicine.user_id = current_user.id
      if medicine.save
        medicine.refill_date = medicine.calculate_refill_date
        medicine.save # I need the second call to save so that the refill_date just calculated is saved to the db
        redirect to '/medicines'
      else
        flash[:message] = medicine.errors.full_messages.to_sentence
        redirect to '/medicines/new'
      end
    else
      flash[:message] = "Please login to add a medicine, or signup for a new account."
      redirect to '/'
    end
  end

  #### user can retrieve details for one medicine
  get '/medicines/:id' do
    if logged_in?
      @medicine = Medicine.find(params[:id])
      if current_user.id == @medicine.user_id
        erb :'medicines/show'
      else
        flash[:message] = "You can only view your medicines. Please select from the list below."
        redirect to '/medicines'
      end
    else
      flash[:message] = "Please login to edit a medicine, or signup for a new account."
      redirect to '/'
    end
  end

  #### user can edit a medicine
  get '/medicines/:id/edit' do
    if logged_in?
      @medicine = Medicine.find(params[:id])
      if current_user.id == @medicine.user_id
        erb :'medicines/edit'
      else
        flash[:message] = "You can only edit your medicines. Please select from the list below."
        redirect to '/medicines'
      end
    else
      flash[:message] = "Please login to edit a medicine, or signup for a new account."
      redirect to '/'
    end
  end

  patch '/medicines/:id' do
    if logged_in?
      @medicine = Medicine.find(params[:id])
      if current_user.id == @medicine.user_id
        @medicine.update(params[:medicine])
        if params[:refilled] == "Y"
          @medicine.refill_date = ""
          @medicine.refill_date = @medicine.calculate_refill_date
        end
        if @medicine.save
          redirect to "medicines/#{@medicine.id}"
        else
          flash[:message] = @medicine.errors.full_messages.to_sentence
          redirect to "medicines/#{params[:id]}/edit"
        end
      else
        flash[:message] = "You can only edit your medicines. Please select from the list below."
        redirect to '/medicines'
      end
    else
      flash[:message] = "Please login to edit a medicine, or signup for a new account."
      redirect to '/'
    end
  end

  #### user can delete a medicine
  delete '/medicines/:id/delete' do
    if logged_in?
      @medicine = Medicine.find(params[:id])
      if current_user.id == @medicine.user_id
        @medicine.destroy
        redirect to '/medicines'
      else
        flash[:message] = "You can only delete your medicines. Please select from the list below."
        redirect to '/medicines'
      end
    else
      flash[:message] = "Please login to delete a medicine, or signup for a new account."
      redirect to '/'
    end
  end

end
