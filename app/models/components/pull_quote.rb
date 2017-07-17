class PullQuote < Component
  store :settings, accessors: [:body], coder: JSON

  def type
    'PullQuote'
  end

  def humanized_name
    'Pull Quote'
  end
end
