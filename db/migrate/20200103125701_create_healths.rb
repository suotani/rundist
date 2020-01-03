class CreateHealths < ActiveRecord::Migration[5.2]
  def change
    create_table :healths do |t|
      t.integer :user_id
      t.decimal :weight      # 体重
      t.decimal :metabolism  # 基礎代謝
      t.decimal :muscle      # 筋肉量

      t.timestamps
    end
  end
end
