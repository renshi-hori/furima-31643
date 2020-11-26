FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
    name                  { 'テスト' }
    category_id              { '1' }
    sales_status_id          { '1' }
    info                  { 'aaaaa' }
    shipping_free_status_id  { '2' }
    prefecture_id           { '2' }
    scheduled_delivert_id   { '1 '}
    price                 { '1000' }

  end
end
