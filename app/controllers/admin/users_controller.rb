class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to admin_user_path(@user)
        else
            render :new, status: :unprocessable_entity
        end
    end
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to admin_user_path(@user)
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to admin_users_path, status: :see_other
    end

    private
    def user_params
        params.require(:user).permit(:id, :department_id, :name, :ruby, :sex, :tel, :mobile, :mail, :zip, :address1, :address2, :address3, :address4, :address5, :birthday, skill_ids: [])
    end
end