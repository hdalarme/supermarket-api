class CreateSupermarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :supermarkets do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :district
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
