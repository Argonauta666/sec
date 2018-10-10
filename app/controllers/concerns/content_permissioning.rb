module ContentPermissioning
  extend ActiveSupport::Concern

  def protect_unpublished!(resource)
    return if current_admin_user
    raise ActiveRecord::RecordNotFound if resource.unpublished?
  end

  def protect_previews!
    return if current_admin_user
    raise ActiveRecord::RecordNotFound
  end
end
