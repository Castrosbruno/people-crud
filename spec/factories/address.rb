FactoryBot.define do
  factory :address do
    street { "Rua" }
    city { "Criciúma" }
    state { "SC" }
    postal_code { 88_802_300 }
    country { "Brasil" }
  end
end
