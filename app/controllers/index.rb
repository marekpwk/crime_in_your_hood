get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do

  erb :signup
end

get '/logout' do
  session.clear
  redirect to ('/')
end

get '/secret' do
  erb :secret
end


post '/login' do
  user = User.find_by_email(params[:email])
  user.try(:authenticate, params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/secret')
  else
    @error = "Uh oh, login unsuccessful"
    erb :login
  end
end

post '/signup' do
  @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password],:password_confirmation => params[:password_confirmation])
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect to ('/secret')
  else
    @errors = @user.errors.full_messages
    erb :signup
  end
end
