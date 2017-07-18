class Contributor < Component
  store :settings, accessors: [:name, :bio, :website, :instagram_handle], coder: JSON

  def type
    'Contributor'
  end

  def humanized_name
    'Contributor'
  end
end
