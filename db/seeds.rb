# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mode.destroy_all
CheckPoint.destroy_all
m1 = Mode.create(name: "イージーモード", content: "短距離のランニング等に適しています。目安は1日1~5km程度")
m2 = Mode.create(name: "ハードモード", content: "長距離のランニングやサイクリングに向いています。目安は1日5以上km")

CheckPoint.create(mode_id: m1.id, start_point: "新大宮駅-近鉄奈良駅", dist: 1.5)
CheckPoint.create(mode_id: m2.id, start_point: "新大宮駅-近鉄奈良駅", dist: 13.3)