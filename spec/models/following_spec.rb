require 'rails_helper'

RSpec.describe Following do
  context 'validations' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :follower }
  end
end
