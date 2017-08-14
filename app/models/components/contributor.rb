class Contributor < Component
  store :settings, accessors: [:name, :bio, :website, :instagram_handle, :website_additional, :instagram_handle_additional], coder: JSON

  def type
    'Contributor'
  end

  def humanized_name
    'Contributor'
  end
end
