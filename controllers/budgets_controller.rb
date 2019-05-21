require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/budget')
require_relative('../models/transaction')
require_relative('../models/tag')
require_relative('../models/merchant')


get '/budgets' do
  @budget = Budget.all.first
  Budget.all.length == 1 ? erb(:"budgets/index") : redirect("/")
end

get '/budgets/new' do
  @budgets = Budget.all
  erb(:"budgets/new")
end

post '/budgets' do
  Budget.new(params).save
  redirect to '/budgets'
end

get '/budgets/:id' do
  @budget = Budget.find(params[:id])
  erb(:"budgets/show")
end


post '/budgets/:id/delete' do
  budget = Budget.find(params[:id])
  budget.delete
  redirect to '/'
end
