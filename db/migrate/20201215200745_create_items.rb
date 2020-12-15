class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :list, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantidade
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
