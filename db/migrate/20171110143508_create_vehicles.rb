class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.belongs_to :user, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
