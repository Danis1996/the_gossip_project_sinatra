require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
  end

  get '/gossips/:id' do
    page = params[:id].to_i 
    erb :show, locals: {gossips: Gossip.find(page), page: page + 1 }
  end

end


