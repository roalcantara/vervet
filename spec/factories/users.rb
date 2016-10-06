require 'ffaker'

FactoryGirl.define do
  factory :user, aliases: [:author, :follower] do
    provider { [:twitter, :facebook].sample }
    sequence :uid do |n|
      "#{FFaker::Guid.guid}_#{n}"
    end
    sequence :name do |n|
      "#{FFaker::Name.name}_#{n}"
    end
    sequence :username do |n|
      "#{FFaker::Internet.user_name[0..16]}_#{n}"
    end
    sequence :email do |n|
      "#{n}_#{FFaker::Internet.email[0..87]}"
    end
    bio FFaker::Lorem.sentence[0..139]
    avatar FFaker::Avatar.image
  end
end
