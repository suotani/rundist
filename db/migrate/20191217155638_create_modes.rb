class CreateModes < ActiveRecord::Migration[5.2]
  def change
    create_table :modes do |t|
      t.string :name

      t.timestamps
    end
  end
end
