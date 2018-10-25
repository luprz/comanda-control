class CreateKepplerComandaControlEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_comanda_control_employees do |t|
      t.string :photo
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.integer :position
      t.datetime :deleted_at
    end
  end
end
