class CourseDecorator < Draper::Decorator
  include AddressDecorator
  delegate_all

  def audience
    source.audience.join(', ')
  end

  def price
    source.price[/^\d/] ? h.number_to_currency(source.price) : source.price
  end

  def phone
    source.phone.phony_formatted(spaces: '-')
  end

  def start_date
    source.start_date.to_s(:long)
  end

  def end_date
    source.end_date.to_s(:long)
  end
end
