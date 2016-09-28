module ApplicationHelper
  def default_title
    content_for(:page_title, t('page.title')) unless content_for?(:page_title)
  end

  def app_name
    Rails.application.class.to_s.split('::').first
  end

  def main_title(title)
    content_for(:main_title, title)
  end
end
