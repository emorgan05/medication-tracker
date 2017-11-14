class MedicineController < ApplicationController

  get '/medicines' do
    erb :'medicines/index'
  end
end
