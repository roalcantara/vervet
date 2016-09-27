module ApplicationHelper
  def default_title
    content_for(:page_title, t('page.title')) unless content_for?(:page_title)
  end
end
