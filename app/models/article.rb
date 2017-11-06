class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  before_validation :nillify_empty_slug, prepend: true

  include Publishing
  include Featuring

  acts_as_taggable

  include PgSearch
  multisearchable against: %i(name body tag_list), if: :published?

  belongs_to :article_section, optional: true

  def nillify_empty_slug
    self.slug = nil if slug.blank?
  end
end
