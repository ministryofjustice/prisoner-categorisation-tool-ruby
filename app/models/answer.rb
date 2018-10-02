class Answer < ApplicationRecord
  belongs_to :case
  belongs_to :section
end
