# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
include Faker
#Category.delete_all
#CategorySlideImage.delete_all
category = {'Мужская' => 'https://cloclo11.datacloudmail.ru/weblink/thumb/xw1/Lnwg/NyzJaG8GF/men.jpg?x-email=den.ukr%40mail.ru',
            'Женская' => 'https://cloclo26.datacloudmail.ru/weblink/thumb/xw1/6r8X/ME5BVw96s/w2.jpg?x-email=den.ukr%40mail.ru',
            'Унисекс' => 'https://cloclo22.datacloudmail.ru/weblink/thumb/xw1/JXQE/MRJiroPcG/uni.jpg?x-email=den.ukr%40mail.ru',
            'Детская' => 'https://cloclo20.datacloudmail.ru/weblink/thumb/xw1/Besx/ovP5doKeM/kids.jpg?x-email=den.ukr%40mail.ru'
}

category_slide = {'Мужская' => [
                                'https://cloclo14.datacloudmail.ru/weblink/thumb/xw1/9BQt/8aqgfPckt/03.jpg?x-email=den.ukr%40mail.ru',
                                'https://cloclo19.datacloudmail.ru/weblink/thumb/xw1/H6BL/ZGDeZd9dm/04.jpg?x-email=den.ukr%40mail.ru',
                                'https://cloclo20.datacloudmail.ru/weblink/thumb/xw1/AcVn/Jtua8xCap/05.jpg?x-email=den.ukr%40mail.ru'
                                ],
                  'Женская' => [
                                'https://cloclo28.datacloudmail.ru/weblink/thumb/xw1/F1uP/U5jH9K1DF/56.jpg?x-email=den.ukr%40mail.ru',
                                'https://cloclo40.datacloudmail.ru/weblink/thumb/xw1/5fSm/BtAEAqSTK/77.jpg?x-email=den.ukr%40mail.ru',
                                'https://cloclo9.datacloudmail.ru/weblink/thumb/xw1/6vuu/ztfBjTekB/88.jpg?x-email=den.ukr%40mail.ru'
                                ],
                  'Унисекс' => [
                                'https://cloclo11.datacloudmail.ru/weblink/thumb/xw1/JJSt/CaBSn6yBF/44.jpg?x-email=den.ukr%40mail.ru',
                                'https://cloclo14.datacloudmail.ru/weblink/thumb/xw1/7vpK/1RE4QyyBk/55.jpg?x-email=den.ukr%40mail.ru',
                                'https://cloclo27.datacloudmail.ru/weblink/thumb/xw1/8fZg/e37RdBotD/66.jpg?x-email=den.ukr%40mail.ru'
                                ],
                  'Детская' => [
                                'https://cloclo40.datacloudmail.ru/weblink/thumb/xw1/D18J/YYFPV5jra/11.jpg?x-email=den.ukr%40mail.ru',
                                'https://cloclo19.datacloudmail.ru/weblink/thumb/xw1/JVNr/AufnjAgSX/22.jpg?x-email=den.ukr%40mail.ru',
                                'https://cloclo2.datacloudmail.ru/weblink/thumb/xw1/2DQE/DTVWA82s1/33.jpg?x-email=den.ukr%40mail.ru'
                  ]
}

category.each do |key, value|
    Category.create(
    :name => key,
    :main_image => value
)
end

category = Category.where(:name => category_slide.keys)

category.each do |category|
  category_slide[category.name].each do |slide|
    category.category_slide_images.create(:image => slide)
   end
end
