class Upload < ApplicationRecord
  mount_uploader :file, MaterialsUploader
  belongs_to :material, touch: true

  default_scope { order(position: :asc) }

  validates :file, presence: true
  before_validation :name_after_file, if: ->(m){ m.name.blank? }

  def name_after_file
    if file.present?
      self.name = File.basename(file.path)
    end
  end
end
