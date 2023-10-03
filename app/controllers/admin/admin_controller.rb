# app/controllers/admin/admin_controller.rb
module Admin
    class AdminController < ApplicationController
      layout 'admin'
      before_action :authenticate_user!
      before_action :check_admin_role
      before_action :set_locale

      def index
        render layout: 'admin'
      end
      private

      def check_admin_role
        redirect_to root_path unless current_user.has_role?(:admin)
      end


      def default_url_options
        {locale: I18n.locale}
      end
    
      def extract_locale
        parsed_locale = params[:locale]
        I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
          parsed_locale.to_sym :
          nil
      end
    end
  end
  