class SingleImage < Component
  store :settings, accessors: [:image, :full_width, :indent, :caption, :alt_tag], coder: JSON

  mount_uploader :image, ImageUploader

  def write_uploader(column, identifier)
    self.settings[column.to_s] = identifier
  end

  def read_uploader(column)
    self.settings[column.to_s]
  end

  def image_will_change!
    settings_will_change!
    @image_changed = true
  end

  def image_changed?
    @image_changed
  end

  def type
    'SingleImage'
  end

  def humanized_name
    'Single Image'
  end
end
