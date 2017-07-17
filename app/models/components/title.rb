class Title < Component
  store :settings, accessors: [:title], coder: JSON

  def type
    'Title'
  end

  def humanized_name
    'Title'
  end
end
