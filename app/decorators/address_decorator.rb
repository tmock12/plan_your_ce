module AddressDecorator

  def formatted_address
    "".tap { |a|
      a << street_1 if street_1
      a << street_2 if street_2
      a << city_state_zip
    }.html_safe
  end

  def street_1
    if source.address.street_1.present?
      h.content_tag(:dd) { source.address.street_1 }
    end
  end

  def street_2
    if source.address.street_2.present?
      h.content_tag(:dd) { source.address.street_2 }
    end
  end

  def city_state_zip
    h.content_tag(:dd) do
      "#{source.address.city}, #{source.address.state} #{source.address.zip_code}"
    end
  end
end
