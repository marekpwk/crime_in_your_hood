get '/' do
  @records = User.first(100)
  erb :index
end
