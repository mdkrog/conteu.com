class MultiImage < Component
  store :settings, accessors: [:image1, :image2, :caption1, :caption2], coder: JSON

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader

  def write_uploader(column, identifier)
    self.settings[column.to_s] = identifier
  end

  def read_uploader(column)
    self.settings[column.to_s]
  end

  def image1_will_change!
    settings_will_change!
    @image_changed = true
  end

  def image1_changed?
    @image_changed
  end

  def image2_will_change!
    settings_will_change!
    @image_changed = true
  end

  def image2_changed?
    @image_changed
  end

  def type
    'MultiImage'
  end

  def humanized_name
    'Multi Image'
  end
end
