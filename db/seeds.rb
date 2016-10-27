# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
include Faker

category = {'Мужская' => 'https://cloclo11.datacloudmail.ru/weblink/thumb/xw1/Lnwg/NyzJaG8GF/men.jpg?x-email=den.ukr%40mail.ru',
            'Женская' => 'https://cloclo37.datacloudmail.ru/weblink/view/GoMQ/Qxh2tXEvZ?etag=502E4E617358F6ACC704CA76D51D4C3C212BC7C8&key=36ecd5b9f4a230853aeb2c4af41e631f89a1a35e',
            'Унисекс' => 'https://cloclo22.datacloudmail.ru/weblink/thumb/xw1/JXQE/MRJiroPcG/uni.jpg?x-email=den.ukr%40mail.ru',
            'Детская' => 'https://cloclo20.datacloudmail.ru/weblink/thumb/xw1/Besx/ovP5doKeM/kids.jpg?x-email=den.ukr%40mail.ru'
}

category.each do |key, value|
    Category.create(
    :name => key,
    :main_image => value
)
end
