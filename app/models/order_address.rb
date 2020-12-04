class OrderAddress
  include ActiveModel::Model
   attr_accessor :user_id,:item_id,:postal_code,:prefecture_id,:city,:addresses,:building,:phone_number,:token
  
   with_options presence: true do
    
    validates :prefecture_id,numericality: { other_than: 0 }
    validates :city
    validates :addresses
    validates :phone_number, length: { maximum: 11, message: 'Too long' }
    validates :token
   
  end
  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフンを使用してください' } do
    validates :postal_code
  end

  


  def save

    order = Order.create(item_id: item_id,user_id: user_id)
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,addresses: addresses,building: building,phone_number: phone_number, order_id: order.id)
  end
end