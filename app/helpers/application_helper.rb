module ApplicationHelper
  def page_title title = ''
    base_title = "Blog App"
    (title.empty? ? base_title : "#{title} | #{base_title}")
  end
end
