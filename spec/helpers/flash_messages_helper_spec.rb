require 'rails_helper'

RSpec.describe FlashMessagesHelper do
  describe '#toast_flash_messages' do
    context 'when there are flash messages' do
      before { expect(helper).to receive(:toasts) }
      it 'renders a toast for each flash message' do
        [:success, :notice, :alert, :error].each do |type|
          flash[type.to_sym] = "A `#{type}` flash message!"
        end
        helper.toast_flash_messages
      end
    end

    context 'when there is no flash messages' do
      before { expect(helper).to_not receive(:toasts) }
      it 'does not render anything' do
        helper.toast_flash_messages
      end
    end
  end
end
