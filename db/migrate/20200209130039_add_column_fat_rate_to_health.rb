class AddColumnFatRateToHealth < ActiveRecord::Migration[5.2]
  def change
    add_column :healths, :fat_rate, :decimal #体脂肪率
  end
end
