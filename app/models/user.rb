class User < ApplicationRecord
  ROLES = %w( offender_manager supervisor security_department regional_intelligence_unit )

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :role, presence: true
  validates :role, inclusion: ROLES
end
