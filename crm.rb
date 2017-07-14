require 'sinatra'

require_relative 'contact'

get '/' do
  redirect to('/contacts')
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/new' do
  erb :new
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
