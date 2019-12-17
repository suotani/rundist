class CreateCheckPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :check_points do |t|
      t.string :mode_id
      t.string :start_point
      t.string :end_point
      t.decimal :dist

      t.timestamps
    end
  end
end
