module Admin
  class AdminUsersController < ApplicationController
      before_action :authenticate_user!
      before_action :authorize_admin
    #before_action :set_user, only: [:edit,:update,:show]

      def show
          
          @user = current_user
      end
    
      def edit
      # @user = User.find(params[:id])
      
          @user = current_user
        
      end
    
      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to root_path, notice: 'Profile updated successfully.'
        else
          render :edit
        end
      end

      private
      def set_user
          @user= User.find(params[:id])
      end
    
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
      end
      def authorize_admin
          unless current_user.has_role?(:admin)
            redirect_to root_path, alert: "You are not authorized to access this page"
          end
        end
    end
end
  