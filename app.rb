require "sinatra"
require "sinatra/reloader"

get '/' do
  erb :square_new
end

get '/square/new' do
  erb :square_new
end

get '/square/results' do
  number = params[:number].to_i
  @result = number * number
  erb :square_results
end

get '/square_root/new' do
  erb :square_root_new
end

get '/square_root/results' do
  number = params[:number].to_f
  @result = Math.sqrt(number)
  erb :square_root_results
end

get '/payment/new' do
  erb :payment_new
end

get '/payment/results' do
  apr = params[:user_apr].to_f / 100
  r = apr / 12 # monthly interest rate
  n = params[:user_years].to_i * 12 # total number of months
  pv = params[:user_pv].to_f

  @payment = (r * pv) / (1 - (1 + r)**-n)
  erb :payment_results
end

get '/random/new' do
  erb :random_new
end

get '/random/results' do
  min = params[:user_min].to_f
  max = params[:user_max].to_f
  @random_number = rand(min..max)
  erb :random_results
end
