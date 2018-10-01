class Case < ApplicationRecord
  STATES = %w( initial recategorisation advised referred closed pending )

  validates :name, presence: true
  validates :nomis_id, presence: true
  validates :due_date, presence: true
  validates :status, presence: true
  validates :status, inclusion: { in: STATES }

  before_save :set_due_date

  private

  def set_due_date
    self.due_date = 10.days.from_now
  end
end
