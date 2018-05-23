class Contribution < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true
  has_many :requirements, dependent: :destroy
  has_many :skills, through: :requirements
  has_many :interests

  validates :project, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: ["open", "booked", "closed"] }
  # validates :user, presence: true, unless: status == "open"
end
