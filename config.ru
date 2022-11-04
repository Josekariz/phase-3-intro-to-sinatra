require 'sinatra'

class App < Sinatra::Base
 # Add this line to set the Content-Type header for all responses
 set :default_content_type, 'application/json'

 get '/dicejson' do
   dice_roll = rand(1..6)
   { roll: dice_roll }.to_json
 end

  get '/hello' do
    '<h2>Hello <em>from the other side</em>!</h2>'
  end
  get '/dice' do
    dice= rand(1..6)
    "<h2>damn this is the #{dice} roll!</h2>"
  end


#this is not dynamic
  # get '/add/1/2' do
  #   sum = 1 + 2
  #   { result: sum }.to_json
  # end


  get '/add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i
    sum = num1 + num2
    {result: sum}.to_json
  end


end

run App
