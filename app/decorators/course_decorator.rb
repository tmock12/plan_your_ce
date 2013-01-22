class CourseDecorator < Draper::Decorator
  include AddressDecorator
  delegate_all

  def audience
    source.audience.join(', ')
  end

  def price
    if source.price
      source.price[/^\d/] ? h.number_to_currency(source.price) : source.price
    end
  end

  def phone
    source.phone.phony_formatted(spaces: '-')
  end

  def formatted_start_date
    source.start_date.to_s(:long)
  end

  def formatted_end_date
    source.end_date.to_s(:long)
  end
end
