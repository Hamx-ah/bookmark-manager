class UsersController < ApplicationController
    def index
    @user = User.where(id: cookies[:user_id])
        redirect_to marks_path if @user.length!=0
    end
    def new
    @user = User.new
    end
    def create
    @user = User.new(user_params)
    if @user.save
        cookies[:user_id] = {
            value: @user.id,
            expires: 2.weeks.from_now
          }
        redirect_to marks_path
    else
        render :new, status: :unprocessable_entity
    end
    end
    def login
    @user = User.where(email: params[:email], password: params[:password])
    if @user.length!=0
        cookies[:user_id] = {
            value: @user[0].id,
            expires: 2.weeks.from_now
          }
        redirect_to marks_path
    else
        flash[:error] = "Please check your email and password and try again"
        render :index, status: :unprocessable_entity
    end
    end

    def logout
    cookies[:user_id] = nil
    redirect_to users_path
    end
    private
    def user_params
    params.require(:user).permit(:name, :email, :password)
    end
end
