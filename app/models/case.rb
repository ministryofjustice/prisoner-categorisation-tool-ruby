class Case < ApplicationRecord
  has_many :answers
  STATES = %w( initial recategorisation advised referred closed pending )

  validates :name, presence: true
  validates :nomis_id, presence: true
  validates :due_date, presence: true
  validates :status, presence: true
  validates :status, inclusion: { in: STATES }

  before_save :set_due_date

  scope :pending, -> { where(status: "pending") }
  scope :security, -> { where(status: "referred") }
  scope :closed, -> { where(status: "closed" ) }
  scope :manager, -> { where(status: ["initial", "recategorisation", "advised"] ) }

  default_scope { order(due_date: :desc) }

  STATES.each do |state|
    define_method "#{state}?" do
      self.status == state
    end
  end

  def change_status_to(status)
    self.status = status
    self.save!
  end

  private

  def set_due_date
    self.due_date = 10.days.from_now
  end
end
