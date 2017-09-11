class Button < Component
  store :settings, accessors: [:text, :link], coder: JSON

  def type
    'Button'
  end

  def humanized_name
    'Button'
  end
end
