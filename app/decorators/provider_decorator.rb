class ProviderDecorator < Draper::Decorator
  delegate_all

  def phone
    source.phone.phony_formatted(spaces: '-')
  end
end
