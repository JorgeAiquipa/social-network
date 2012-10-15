class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
