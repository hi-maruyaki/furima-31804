FactoryBot.define do
  factory :user_order do
    postcode              {"123-4567"}
    prefecture            {2}
    city                  {"豊田市"}
    address               {"トヨタ町1番地"}
    building_name         {"第一ビル"}
    tellphone             {"01234567890"}
    item_id               {2}
    user_id               {2}
    token                 {"sk_test_0bfb2e13aeabb52921e02cdb"}
  end
end
