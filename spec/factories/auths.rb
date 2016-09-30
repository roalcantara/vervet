require 'ffaker'

FactoryGirl.define do
  factory :auth0, class: OmniAuth::AuthHash do
    provider { [:twitter, :facebook].sample }
    uid FFaker::Guid.guid
    info do
      { name: FFaker::Name.name,
        email: FFaker::Internet.email,
        image: FFaker::Avatar.image,
        username: FFaker::Internet.user_name }
    end
  end
end
