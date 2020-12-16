class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :supermarket, null: false, foreign_key: true
      t.decimal :valor, precision: 7, scale: 2
      t.decimal :valorPromocional, precision: 7, scale: 2

      t.timestamps
    end
  end
end
