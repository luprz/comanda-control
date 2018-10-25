require_dependency "keppler_frontend/application_controller"

module KepplerFrontend
  class App::FrontendController < App::AppController
    # End callbacks area (don't delete)
    include FrontsHelper
    include KepplerComandaControl::ApplicationHelper
    layout 'layouts/keppler_frontend/app/layouts/application'
    # begin show_table
    def show_table
      @table = find_table({id: params[:id]})
    end
    # end show_table
    # begin home
    def home
      # Insert ruby code...
    end
    # end home
    # begin index
    def index
      # Insert ruby code...
      redirect_to home_path if current_user
    end
    # end index

    # begin keppler
    def keppler
    end
    # end keppler

    private
    # begin callback user_authenticate
    def user_authenticate
      redirect_to '/' unless user_signed_in?
    end
    # end callback user_authenticate
  end
end
