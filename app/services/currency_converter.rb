class CurrencyConverter < Struct.new(:currency, :amount, :new_currency)

  def convert
    converted_regex =~ response
    $1.to_f
  end

  def response
    request.body
  end

  def converted_regex
    Regexp.new("(\\d+\\.{0,1}\\d*)\\s+#{new_currency}")
  end

  def request
    host = "http://www.google.com/finance/converter?"
    conn = Faraday.new(host)
    conn.params = params
    conn.get
  end

  def params
    {}.tap do |h|
      h['a'] = amount
      h['from'] = currency
      h['to'] = new_currency
    end
  end
end
