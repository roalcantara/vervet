require 'rails_helper'

RSpec.describe Post do
  context 'validations' do
    it { is_expected.to validate_presence_of :kind }
    it { is_expected.to define_enum_for(:kind).with [:accident, :fire, :robbery] }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_length_of(:description).is_at_least(5).is_at_most(144) }
    it { is_expected.to validate_presence_of :location }
    it { is_expected.to validate_length_of(:location).is_at_least(5).is_at_most(100) }
    it { is_expected.to validate_presence_of :author }
  end
end
