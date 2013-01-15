class FormBuilder < ActionView::Helpers::FormBuilder

  def label(method, text = nil, options = {}, &block)
    text = (text || method.to_s.humanize.titleize)
    super(method, text.html_safe, options, &block)
  end
end
