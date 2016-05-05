class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice
  has_many :scores

  accepts_nested_attributes_for :scores, allow_destroy: true

  validates :user, :practice, :note, presence: true
  validates :user, uniqueness: { scope: :practice }

  SCORE_LABEL = [I18n.t('score.needs_improvement'),
                 I18n.t('score.progressing'),
                 I18n.t('score.competent'),
                 I18n.t('score.mastered')].freeze
end
