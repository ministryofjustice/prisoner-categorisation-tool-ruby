class User < ApplicationRecord
  ROLES = %w( offender_manager supervisor security_department regional_intelligence_unit )

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

 validates :role, presence: true
 validates :role, inclusion: ROLES
end
