class TextSingleColumn < Component
  store :settings, accessors: [:body, :drop_cap, :indent], coder: JSON

  def type
    'TextSingleColumn'
  end

  def humanized_name
    'Text Single Column'
  end
end
