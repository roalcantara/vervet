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

  describe '#profile_complete?' do
    context 'when user has all required properties' do
      let(:user) { build :user }
      it 'returns true' do
        expect(user.profile_complete?).to be_truthy
      end
    end

    context 'when user does not have any required properties' do
      let(:user) { build :user, email: nil }
      it 'returns false' do
        expect(user.profile_complete?).to be_falsey
      end
    end
  end

  describe '.search' do
    let(:users) { create_list :user, 10 }
    let(:last) { users.last }

    it 'searchers by name' do
      expect(User.search(last.name)).to eq [last]
    end

    it 'searchers by username' do
      expect(User.search(last.username)).to eq [last]
    end
  end
end
