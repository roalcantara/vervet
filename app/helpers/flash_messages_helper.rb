module FlashMessagesHelper
  def toast_flash_messages
    flash_messages = []
    flash.each do |type, message|
      flash_messages << { message: message, type: type } if message
    end
    toasts flash_messages if flash_messages.any?
  end
end
