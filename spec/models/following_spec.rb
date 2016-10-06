require 'rails_helper'

RSpec.describe Following do
  context 'validations' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :follower }
  end

  describe '#notify' do
    let(:following) { build :following }

    it 'notifies the user about the new follower' do
      expect { following.save! }
        .to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
