module ApplicationHelper


  def authen_token

  "<input type=\"hidden\" name=\"authenticity_token\" value=\"<%= #{form_authenticity_token} %>\">".html_safe
end
end
