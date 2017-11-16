class CalendarController < ApplicationController

  get '/calendar' do
    calendar = Calendar.find_by(user_id: session[:id])
    dates = calendar.medicines.collect do |medicine|
      medicine.refill_date
    end
    @dates = dates.sort
    erb :'calendars/index'
  end

end
