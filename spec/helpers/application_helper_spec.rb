require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#default_title' do
    context 'when there is content for :page_title' do
      let(:some_title) { 'An awesome title!' }
      before do
        expect(helper).to receive(:content_for?).with(:page_title).and_return true
      end
      it 'does not set the default title' do
        expect(helper).to_not receive(:content_for).with(:page_title, I18n.t('page.title'))
        helper.default_title
      end
    end

    context 'when there is no content for :page_title' do
      before do
        expect(helper).to receive(:content_for?).with(:page_title).and_return false
      end
      it 'sets the default title' do
        expect(helper).to receive(:content_for).with(:page_title, I18n.t('page.title'))
        helper.default_title
      end
    end
  end
end
