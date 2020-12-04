FactoryBot.define do
  factory :order_address do
    postal_code      { '123-4567' }
    prefecture_id       { 1 }
    city             { '町田市' }
    addresses        { '8-9' }
    building         { 'tesuto' }
    phone_number     { '09099999999' }
    token            { 'tok_4f612c8e1089f52009d0980d151c' }
    
  end
end