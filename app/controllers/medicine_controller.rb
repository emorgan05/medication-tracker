class MedicineController < ApplicationController

  get '/medicines' do
    erb :index
  end
end
