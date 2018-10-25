# This migration comes from keppler_comanda_control (originally 20181025161918)
class CreateKepplerComandaControlTables < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_comanda_control_tables do |t|
      t.string :name
      t.integer :position
      t.datetime :deleted_at
    end
  end
end
