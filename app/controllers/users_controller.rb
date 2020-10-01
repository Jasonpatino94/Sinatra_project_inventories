class UsersController < ApplicationController

  # GET: /users
  get "/users/signin" do
    erb :"/users/signin.html"
  end

  post "/users/signin" do
    
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/inventories"

    else
      erb :"/users/signin.html"
    end

  end

  # GET: /users/new
  get "/users/signup" do
    erb :"/users/signup.html"
  end

  post "/users/signup" do

    @user = User.new(params)

    if @user.save  
      redirect "/users/signin"
    else
      erb :"/users/signup.html"
    end
     
  end

  # DELETE: /users/5/delete
  delete "/users/signout" do
    session.clear
    redirect "/users/signin" 
  end
end
