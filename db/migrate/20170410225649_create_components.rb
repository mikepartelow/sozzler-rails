class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.string :quantity, null: true
      t.integer :index, null: false

      t.references :recipe, null: false
      t.references :ingredient, null: false
      t.references :unit, null: false

      t.timestamps
    end
  end
end
