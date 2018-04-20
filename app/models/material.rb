class Material < ApplicationRecord
  include Publishing
  include FriendlyLocating

  has_many :uploads
  accepts_nested_attributes_for :uploads, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :name

  def first_file
    return if uploads.empty?
    uploads.first.file
  end

  def files
    uploads.map(&:file)
  end
end
