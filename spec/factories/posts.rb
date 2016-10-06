require 'ffaker'

FactoryGirl.define do
  factory :post do
    kind { [:accident, :fire, :robbery].sample }
    description FFaker::Lorem.sentence[0..139]
    location FFaker::Address.street_address
    author
  end
end
