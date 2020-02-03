require_dependency "duration"

class Lesson < ApplicationRecord
  LEVELS = { 0 => "beginning", 1 => "intermediate", 2 => "advanced" }

  belongs_to :topic, touch: true

  default_scope { order(level_id: :asc) }
  scope :with_level, -> (name) { where(level_id: LEVELS.invert[name]) }

  validates :duration, presence: true
  validates :level_id, uniqueness: { scope: :topic },
                    presence: true,
                    inclusion: { in: 0..LEVELS.length,
                                 message: "must be a valid level" }

  serialize :duration, Duration

  include Publishing
  include ActivePreview::Previewing

  after_validation :decide_published

  mount_uploader :pdf, PdfUploader
  after_save :enqueue_pdf_update,
    if: ->{ published? && !saved_changes.key?(:pdf) }

  def name
    "#{topic.name}: #{level}"
  end

  def level
    LEVELS[level_id]
  end

  def to_param
    level
  end

  def enqueue_pdf_update
    UpdateLessonPdf.perform_later(id)
  end

  def decide_published
    self.published = body.try(:strip).present?
  end

  def materials
    url_helper = Rails.application.routes.url_helpers

    Material.select do |material|
      path = url_helper.material_path(material)
      suggested_materials[path]
    end
  end

  def pdf_filename
    "#{topic.name} - #{level.capitalize}.pdf"
  end
end
