class CalendarController < ApplicationController

  get '/calendar' do
    erb :'calendars/index'
  end

end
