class BulletedList < Component
  store :settings, accessors: [:list, :indent], coder: JSON

  def type
    'BulletedList'
  end

  def humanized_name
    'BulletedList'
  end
end
