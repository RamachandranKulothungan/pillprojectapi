class SessionsController < ApplicationController
  before_action :validate_user!, except: [:create]
  def new
  end

  def user 
    user = User.find(@current_user_id)
    render json: user.as_json(only: [:email, :id])
          .merge("token": user.generate_jwt)
  end

 #PUT "session/update_password"
  def update_password
     user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:password] != params[:new_password]
        user.password_digest = BCrypt::Password.create(params[:new_password])
        user.save 
        # redirect_to root_url, notice: "Logged in!"
        render json: user.as_json(only: [:email,:id])
                        .merge("token": user.generate_jwt)
      else
        render json: { errors: "New password same as old password"}, status: :ok  
      end

    else
      # flash.now[:alert] = "Email or password is invalid"
      # render "new"
      render json: { errors: "Invalid Password"}, status: :ok
    end
  end

  def create
   user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      #session[:user_id] = user.id
      #redirect_to root_url, notice: "Logged in!"
      render json: user.as_json(only: [:email, :id])
                      .merge("token": user.generate_jwt)

    else
      #flash.now[:alert] = "Email or password is invalid"
      #render "new"
      render json: { errors: "Email or Password is invalid"},
                    status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
