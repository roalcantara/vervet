require 'rails_helper'

RSpec.describe UserMailer do
  describe 'new_follower' do
    let(:followed) { create :user }
    let(:follower) { create :user }
    let(:mail) { described_class.new_follower(followed, follower).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq I18n.t('user_mailer.new_follower.subject')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([followed.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['noreply@vervet.com'])
    end

    it "assigns followed's name" do
      expect(mail.body.encoded).to match(followed.name)
    end

    it "assigns follower's nickname" do
      expect(mail.body.encoded).to match(follower.nickname)
    end

    it 'assigns @url' do
      expect(mail.body.encoded).to match user_path(followed)
    end
  end
end
