require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/budget')
require_relative('../models/transaction')
require_relative('../models/tag')
require_relative('../models/merchant')
also_reload('../models/*')


get '/merchants' do
  @merchants = Merchant.all
  erb(:"merchants/index")
end

get '/merchants/new' do
  @merchants = Merchant.all
  erb(:"merchants/new")
end

post '/merchants' do
  Merchant.new(params).save
  redirect to '/merchants'
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/edit")
end

post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update
  redirect to "/merchants/#{params[:id]}"
end

post '/merchants/:id/delete' do
  merchants = Merchant.find(params[:id])
  merchants.delete
  redirect to '/merchants'
end
