class Section < ApplicationRecord

  def display_text
    JSON.parse(self.serialized_text)
  end
end
