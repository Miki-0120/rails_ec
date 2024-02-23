# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Item.create!(
  name: 'サンスベリア',
  price: 800,
  description: '乾燥に強く育てやすい植物です。雨は苦手なので室内の窓辺で育てると綺麗に育ちます。',
  item_image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/item_images/image01.jpg')), filename: 'image01.jpg'
  )
)

Item.create!(
  name: '朝霧草',
  price: 300,
  description: '日本原産の植物で雪の結晶のような銀色の葉が特徴です。屋外の日当たりで育てます。冬は葉が枯れて冬眠することがあります。',
  item_image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/item_images/image02.jpg')), filename: 'image02.jpg'
  )
)

Item.create!(
  name: '幸福の木',
  price: 200,
  description: '玄関に飾ると良いことがあるという言い伝えがある植物です。本名はドラセナといいます。カーテン越しの柔らかな光で育てます。',
  item_image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/item_images/image03.jpg')), filename: 'image03.jpg'
  )
)

Item.create!(
  name: 'ゴムの木（緑・ピンク葉）',
  price: 1000,
  description: 'インド原産の植物でフィカス・ジンともよばれます。葉の色が特に美しくなるように品種改良された個体です。',
  item_image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/item_images/image04.jpg')), filename: 'image04.jpg'
  )
)

Item.create!(
  name: '苔ボトル（L）',
  price: 6000,
  description: 'どの方向から見ても綺麗に見えるよう５種類の苔を植え付けました。蓋付きなので水が蒸発しにくく水やりは１ヶ月に１回で済みます。',
  item_image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/item_images/image05.jpg')), filename: 'image05.jpg'
  )
)

Item.create!(
  name: '苔ボトル（M）',
  price: 5000,
  description: '岩山の景色をイメージして作りました。背が低い容器で程よい大きさなので机や棚に飾りやすいです',
  item_image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/item_images/image06.jpg')), filename: 'image06.jpg'
  )
)

Item.create!(
  name: '苔ボトル（S）',
  price: 3000,
  description: '清流の景色を小さな瓶に閉じ込めました。手のひらサイズのため、ちょっとした贈り物にもおすすめです。',
  item_image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/item_images/image07.jpg')), filename: 'image07.jpg'
  )
)

Item.create!(
  name: 'まりも',
  price: 700,
  description: '阿寒湖産のまりもを養殖したものです。水が汚れたら水道水で水換えします。水深2~5mの湖に生息するため弱い光を好みます。',
  item_image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/item_images/image08.jpg')), filename: 'image08.jpg'
  )
)
