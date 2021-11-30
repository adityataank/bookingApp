class AdminsController < ApplicationController 

    def home
        
    end

    def users
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user == nil 
            flash[:notice] = "User Not Found !"
        end

    end

    def destroy
        @user = User.find_by(id: params[:id])
        if @user
            @user.destroy 
            flash[:notice] = "User was successfully deleted !"
            redirect_to admin_users_path
        else 
            flash[:notice] = "User Not Found !"
        end
    end



end