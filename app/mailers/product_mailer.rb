class ProductMailer < ApplicationMailer

   def new_product
    mail(to: 'shopstockmarket@gmail.com', subject: 'Новый товар')
   end

   def update_product
     mail(to: 'shopstockmarket@gmail.com', subject: 'Товар обновлён')
   end

end
