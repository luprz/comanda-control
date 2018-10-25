# frozen_string_literal: true

require_dependency "keppler_comanda_control/application_controller"
module KepplerComandaControl
  module Admin
    # EmployeesController
    class EmployeesController < ::Admin::AdminController
      layout 'keppler_comanda_control/admin/layouts/application'
      before_action :set_employee, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /keppler_comanda_controls
      def index
        respond_to_formats(@employees)
        redirect_to_index(@objects)
      end

      # GET /keppler_comanda_controls/1
      def show; end

      # GET /keppler_comanda_controls/new
      def new
        @employee = Employee.new
      end

      # GET /keppler_comanda_controls/1/edit
      def edit; end

      # POST /keppler_comanda_controls
      def create
        @employee = Employee.new(employee_params)

        if @employee.save
          redirect(@employee, params)
        else
          render :new
        end
      end

      # PATCH/PUT /keppler_comanda_controls/1
      def update
        if Employee.update(employee_params)
          redirect(@employee, params)
        else
          render :edit
        end
      end

      def clone
        @employee = Employee.clone_record params[:employee_id]
        @employee.save
        redirect_to_index(@objects)
      end

      # DELETE /keppler_comanda_controls/1
      def destroy
        @employee.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Employee.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Employee.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Employee.sorter(params[:row])
      end

      private

      def index_variables
        @q = Employee.ransack(params[:q])
        @employees = @q.result(distinct: true)
        @objects = @employees.page(@current_page).order(position: :desc)
        @total = @employees.size
        @attributes = Employee.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_employee
        @employee = Employee.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def employee_params
        params.require(:employee).permit(
          :photo, :firstname, :lastname, :phone, :email
        )
      end
    end
  end
end