require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    subject { build :user }
    it { is_expected.to validate_presence_of :provider }
    it { is_expected.to validate_presence_of :uid }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    context 'when updating' do
      subject { create :user }
      it { is_expected.to validate_presence_of :username }
      it { is_expected.to_not allow_value('wrong user name').for :username }
      it { is_expected.to validate_presence_of :email }
      it { is_expected.to_not allow_value('wrong @email').for :email }
    end
  end
end
