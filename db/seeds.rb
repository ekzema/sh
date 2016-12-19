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
                                'https://cloclo21.datacloudmail.ru/weblink/thumb/xw1/KUCP/D4yPo3CYd/333.jpg?x-email=den.ukr%40mail.ru'
                  ]
}

twocategory_name = ['Зима', 'Весна', 'Лето', 'Осень']

threecategory_name = {
                'Мужская' => {
                              'Зима' => ['Дублёнки', 'Шапки', 'Свитора', 'Перчатки'],
                              'Весна' => ['Ветровки', 'Куртки', 'Кофты', 'Джинсы'],
                              'Лето' => ['Футболки', 'Кепки', 'Шорты', 'Бриджы'],
                              'Осень' => ['Ветровки', 'Куртки', 'Кофты', 'Джинсы']
                              },
                'Женская' => {
                              'Зима' => ['Шубы', 'Пуховики', 'Шапки', 'Дублёнки'],
                              'Весна' => ['Джинсы', 'Юбки', 'Куртки', 'Кофты'],
                              'Лето' => ['Юбки', 'Купальники', 'Футболки', 'Кепки'],
                              'Осень' => ['Штаны', 'Куртки', 'Кофты', 'Ветровки']
                            },
                'Унисекс' => {
                             'Зима' => ['Шубы', 'Куртки', 'Перчатки', 'Кофты'],
                             'Весна' => ['Джинсы', 'Ветровки', 'Штаны', 'Шапки'],
                             'Лето' => ['Футболки', 'Майки', 'Шорты', 'Кепки'],
                             'Осень' => ['Куртки', 'Ветровки', 'Шапки', 'Штаны']
                            },
                'Детская' => {
                             'Зима' => ['Куртки', 'Перчатки', 'Шапки', 'Шарфы'],
                             'Весна' => ['Ветровки', 'Джинсы', 'Штаны', 'Шапки'],
                             'Лето' => ['Футболки', 'Кепки', 'Шорты', 'Майки'],
                             'Осень' => ['Куртки', 'Шапки', 'Кофты', 'Штаны']
                            }
                }


seller_name = {
               'Настя' => 'Иванова', 'Андрей' => 'Пупкин', 'Инга' => 'Куреленко', 'Сергей' => 'Плющь', 'Аня' => 'Имченко', 'Костя' => 'Копушенко', 'Юля' => 'Жабова', 'Валентин' => 'Полянченко', 'Оля' => 'Хлюпова', 'Вячеслав' => 'Полудубов',
               'Света' => 'Петрова', 'Иван' => 'Иванов', 'Катя' => 'Светлова', 'Дима' => 'Огурцов', 'Яна' => 'Смешнова', 'Александр' => 'Хрустовой', 'Вика' => 'Лисичекно', 'Олег' => 'Загорный', 'Ева' => 'Белоусова', 'Жора' => 'Твёрдохлеб'
               }

seller_img = [
              'https://cloclo19.datacloudmail.ru/weblink/thumb/xw1/KGs9/QLE7acyRM/1.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo37.datacloudmail.ru/weblink/thumb/xw1/JzzH/fDosuCueU/11%20(1).jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo37.datacloudmail.ru/weblink/thumb/xw1/8DWo/3Gej2eLNR/2.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo3.datacloudmail.ru/weblink/thumb/xw1/NEAh/WiC5GpKgi/09e39a2d968e4902d3443107cb33023f.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo19.datacloudmail.ru/weblink/thumb/xw1/5Jth/u2RQR4Uqp/3.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo22.datacloudmail.ru/weblink/thumb/xw1/2iXG/5NRFdQeyo/13.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo3.datacloudmail.ru/weblink/thumb/xw1/Mwb4/9TAtMHefb/4.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo39.datacloudmail.ru/weblink/thumb/xw1/Ext2/5yuZsjNdk/14.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo37.datacloudmail.ru/weblink/thumb/xw1/MTs3/6u2fD7ggw/6.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo27.datacloudmail.ru/weblink/thumb/xw1/LRnX/owSgkGd2L/15.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo22.datacloudmail.ru/weblink/thumb/xw1/G5Cz/ozNPLFbzL/7.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo20.datacloudmail.ru/weblink/thumb/xw1/FJsL/i6j5dAK9u/16.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo26.datacloudmail.ru/weblink/thumb/xw1/DRvF/Z1m5ZfmXd/8.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo19.datacloudmail.ru/weblink/thumb/xw1/BZzK/Bv8DH7uvh/17.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo11.datacloudmail.ru/weblink/thumb/xw1/Bnt6/XeAd81CxG/9.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo19.datacloudmail.ru/weblink/thumb/xw1/JmjF/LurdQmpVm/18.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo19.datacloudmail.ru/weblink/thumb/xw1/5Emv/86DKToYvr/5.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo22.datacloudmail.ru/weblink/thumb/xw1/EtvH/pEFgfbRvG/19.jpg?x-email=den.ukr%40mail.ru',
              'https://cloclo21.datacloudmail.ru/weblink/thumb/xw1/Doxs/iV8ZV1WTd/22%20(1).jpeg?x-email=den.ukr%40mail.ru',
              'https://cloclo20.datacloudmail.ru/weblink/thumb/xw1/DYq2/n4gAfgBYT/20.jpg?x-email=den.ukr%40mail.ru'
              ]

i = 0
seller_name.each do |key, value|
  Seller.create(:name => key,
                :surname => value,
                :date_of_birth => Time.now,
                :city => Address.city,
                :promo_code => rand(10000..1000000),
                :avatar => seller_img[i],
                :email => Internet.safe_email,
                :password => Internet.password(5)
  )
  i+=1
end

category.each do |key, value|
    Category.create(
    :name => key,
    :main_image => value,
    :description => Lorem.paragraph(1)
)
end

category = Category.where(:name => category_slide.keys)

category.each do |category|
  category_slide[category.name].each do |slide|
    category.category_slide_images.create(:image => slide)
   end
end

categories = Category.all

categories.each do |category|
  twocategory_name.each do |twocat|
    category.twocategories.create(:name => twocat, :description => Lorem.paragraph(1))
  end
end

category = Category.all

category.each do |cat|
  cat.twocategories.each do |two|
    threecategory_name[cat.name][two.name].each do |three|
    two.threecategories.create(:name => three, :description => Lorem.paragraph(1))
  end
  end
end

