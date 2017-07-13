require 'sinatra'

require_relative 'contact'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  contact_id = params[:id]
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
  erb :show_contact
else
  raise Sinatra::NotFound
end
end

after do
  ActiveRecord::Base.connection.close
end
