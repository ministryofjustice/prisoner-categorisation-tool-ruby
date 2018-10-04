class Answer < ApplicationRecord
  belongs_to :case
  belongs_to :section

  default_scope { order(section_id: :asc) }

  def display_text
    JSON.parse(self.serialized_answers)
  end
end
