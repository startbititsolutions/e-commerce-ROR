# app/controllers/admin/admin_controller.rb
module Admin
    class AdminController < ApplicationController
      layout 'admin'
      before_action :authenticate_user!
      before_action :check_admin_role

      def index
        render layout: 'admin'
      end
      private

      def check_admin_role
        redirect_to root_path unless current_user.has_role?(:admin)
      end
    end
  end
  