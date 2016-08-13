module ApplicationHelper
  def page_title title = ''
    base_title = "Blog App"
    (title.empty? ? base_title : "#{title} | #{base_title}")
  end

  # notice it needs to be called after the general authenticate_user! method.
  def authenticate_admin!
    unless current_user.admin?
      flash[:danger] = "Sorry, you don't have premissions for this action."
      redirect_to root_path
    else
      true
    end
  end
end
