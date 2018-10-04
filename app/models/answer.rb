class Answer < ApplicationRecord
  belongs_to :case
  belongs_to :section

  def display_text
    JSON.parse(self.serialized_answers)
  end
end
