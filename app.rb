require "sinatra"
require "sinatra/reloader"

get '/' do
  erb :square_new
end

get '/square/new' do
  erb :square_new
end

get("/square/results") do
  @sq_number = params.fetch("number").to_f
  @sq_result = @sq_number ** 2
  erb(:square_results)
end

get '/square_root/new' do
  erb :square_root_new
end

get '/square_root/results' do
  @sqr_number = params.fetch("user_number").to_f
  @sqr_result = Math.sqrt(@sqr_number)
  erb :square_root_results
end

get '/payment/new' do
  erb :payment_new
end

get("/payment/results") do
  r = params.fetch("user_apr").to_f / 100 / 12
  @p_apr = params.fetch("user_apr").to_f.to_fs(:percentage, { :precision => 4 } )
  @p_years = params.fetch("user_years").to_i
  n = @p_years * 12
  pv = params.fetch("user_pv").to_f
  @p_principal = pv.to_fs(:currency)
  p = (r * pv) / (1 - ((1 + r) ** (-n)))
  @p_result = p.to_fs(:currency)
  erb(:payment_results)
end

get '/random/new' do
  erb :random_new
end

get("/random/results") do
  @r_min = params.fetch("user_min").to_f
  @r_max = params.fetch("user_max").to_f
  @r_result = rand(@r_min..@r_max)
  erb(:random_results)
end  
