class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name         # 名前
      t.integer :mode_id     # モードの選択
      t.string :custome_url  # ログインに変わるパスフレーズ
      t.deciaml :total_dist  # 総走行距離
      t.deciaml :total_cal   # 総消費カロリー

      t.timestamps
    end
  end
end
