require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/budget')
require_relative('../models/transaction')
require_relative('../models/tag')
require_relative('../models/merchant')
also_reload('../models/*')


get '/transactions' do
  @transactions = Transaction.all
  erb(:"transactions/index")
end

#####################################
#display all transactions by merchant
get '/transactions/merchants' do
  @transactions = Transaction.find_by_merchant(params['search'])
  erb(:"transactions/index")
end

#####################################

#####################################
#display all transactions by tags
get '/transactions/tags' do
  @transactions = Transaction.find_by_tag(params['search'])
  erb(:"transactions/index")
end

#####################################

get '/transactions/new' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  @budgets = Budget.all
  erb(:"transactions/new")
end

post '/transactions' do
  Transaction.new(params).save
  redirect to '/transactions'
end

get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  @budgets = Budget.all
  erb(:"transactions/edit")
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions/#{params[:id]}"
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params[:id])
  transaction.delete
  redirect to '/transactions'
end
