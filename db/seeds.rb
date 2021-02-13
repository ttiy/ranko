# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    password: 'password',
    tel: '000-0000-0000',
    last_name: "太郎#{n + 1}",
    first_name: "テスト",
    last_name_kana: "タロウ#{n + 1}",
    first_name_kana: "テスト",
  )
end

Article.create!(
  user_id: 1,
  body: '今日は散歩をした。今まで気になってたけど行ってなかったカフェに行ってみた。パニーニが美味しかった。',
  emotion: '美味しいものって素晴らしい',
)
Article.create!(
  user_id: 2,
  body: 'タンデムツーリングに行った。山岡家くさすぎて笑った。やっぱ海沿いが一番気持ちいいね',
  emotion: '疲れた',
)
Article.create!(
  user_id: 3,
  body: '近くの銭湯に行った。毎週日曜の朝湯はいつ行ってもいい',
  emotion: '銭湯は文化',
)
Article.create!(
  user_id: 4,
  body: 'いわきまでひょんなことからきてしまった。温泉はいいなあ',
  emotion: '最高',
)
Article.create!(
  user_id: 5,
  body: 'あんこう鍋めちゃくちゃうまかった',
  emotion: 'あん肝がたまらん',
)