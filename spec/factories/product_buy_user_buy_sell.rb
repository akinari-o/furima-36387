FactoryBot.define do
  factory :product_buy_user_buy_sell do
      
      token             {"tok_abcdefghijk00000000000000000"}
      postal_code       {"111-1111"}
      prefecture_id     {2}
      municipalities    {"名古屋市緑区"}
      address           {"青山1-1-1"}
      telephone_number  {"09011111111"}
      user_id           {1}
      item_id           {2}
  end
end