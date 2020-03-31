class ApplicationController < ActionController::Base
  include Pundit
  rescure_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  private
    def user_not_authorized
      flash[:alert] = "Access denied."
      redirect_to (request.reffer || root_path)
    end
end
