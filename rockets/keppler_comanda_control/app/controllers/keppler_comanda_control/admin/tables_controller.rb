# frozen_string_literal: true

require_dependency "keppler_comanda_control/application_controller"
module KepplerComandaControl
  module Admin
    # TablesController
    class TablesController < ::Admin::AdminController
      layout 'keppler_comanda_control/admin/layouts/application'
      before_action :set_table, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /keppler_comanda_controls
      def index
        respond_to_formats(@tables)
        redirect_to_index(@objects)
      end

      # GET /keppler_comanda_controls/1
      def show; end

      # GET /keppler_comanda_controls/new
      def new
        @table = Table.new
      end

      # GET /keppler_comanda_controls/1/edit
      def edit; end

      # POST /keppler_comanda_controls
      def create
        @table = Table.new(table_params)

        if @table.save
          redirect(@table, params)
        else
          render :new
        end
      end

      # PATCH/PUT /keppler_comanda_controls/1
      def update
        if Table.update(table_params)
          redirect(@table, params)
        else
          render :edit
        end
      end

      def clone
        @table = Table.clone_record params[:table_id]
        @table.save
        redirect_to_index(@objects)
      end

      # DELETE /keppler_comanda_controls/1
      def destroy
        @table.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Table.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Table.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Table.sorter(params[:row])
      end

      private

      def index_variables
        @q = Table.ransack(params[:q])
        @tables = @q.result(distinct: true)
        @objects = @tables.page(@current_page).order(position: :desc)
        @total = @tables.size
        @attributes = Table.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_table
        @table = Table.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def table_params
        params.require(:table).permit(
          :name
        )
      end
    end
  end
end