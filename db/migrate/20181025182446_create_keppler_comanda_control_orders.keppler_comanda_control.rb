# This migration comes from keppler_comanda_control (originally 20181025182441)
class CreateKepplerComandaControlOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_comanda_control_orders do |t|
      t.integer :employee_id
      t.integer :table_id
      t.integer :position
      t.datetime :deleted_at
    end
  end
end
