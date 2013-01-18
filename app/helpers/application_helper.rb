module ApplicationHelper
  def dtag(label, value=nil)
    if value.present?
      "<dt>#{label}</dt><dd>#{value}</dd>".html_safe
    end
  end
end
