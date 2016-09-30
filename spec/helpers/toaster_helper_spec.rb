require 'rails_helper'

RSpec.describe ToasterHelper do
  describe '#toasts' do
    let(:messages) do
      [
        { message: 'A 1000 display length notice toast', type: :notice, displayLength: 1000 },
        { message: 'A success toast', type: :success },
        { message: 'A custom toast', className: 'black accent-3' }
      ]
    end

    before { helper.toasts(messages) }
    it 'renders many toasts on content_for :main_bottom_scripts' do
      messages.each do |message|
        expect(helper.content_for(:main_bottom_scripts))
          .to include message[:message]
      end
    end
  end

  describe '#toast' do
    let(:message) { 'A funny message' }

    ToasterHelper::TOAST_CLASS.each do |type, class_name|
      before { helper.toast(message, type: type) }
      it "renders a `#{type}` toast with the class `#{class_name}` on content_for :main_bottom_scripts" do
        expect(helper.content_for(:main_bottom_scripts))
          .to include message, class_name
      end
    end

    context 'when no type is given' do
      let(:message) { 'A neat notice message' }
      let(:notice_class) { ToasterHelper::TOAST_CLASS[:notice] }
      before { helper.toast(message) }

      it 'renders a `notice` toast on content_for :main_bottom_scripts' do
        expect(helper.content_for(:main_bottom_scripts))
          .to include message, notice_class
      end
    end
  end
end
