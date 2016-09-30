module ToasterHelper
  DEFAULT_DISPLAY_LENGHT = 2000

  TOAST_CLASS = {
    success: 'green accent-4',
    notice: 'blue accent-3',
    alert: 'orange accent-3',
    error: 'red accent-3'
  }.freeze

  def toast(message, type: :notice, displayLength: DEFAULT_DISPLAY_LENGHT, className: nil)
    toasts [{ message: message, type: type, displayLength: displayLength, className: className }]
  end

  def toasts(messages)
    toasts = []
    messages.each do |toast|
      toasts << build_toast(toast[:message],
                            type: toast[:type],
                            displayLength: toast[:displayLength] || DEFAULT_DISPLAY_LENGHT,
                            className: toast[:className])
    end
    content_for :main_bottom_scripts do
      javascript_tag toasts.join("\n").html_safe
    end if toasts.any?
  end

  private

  def build_toast(message, type: :notice, displayLength: DEFAULT_DISPLAY_LENGHT, className: nil)
    "Materialize.toast('#{message}', #{displayLength}, '#{className || TOAST_CLASS[type.to_sym]}');"
      .html_safe
  end
end
