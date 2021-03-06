require 'rails_helper'

RSpec.describe "sections/show", type: :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      :serialized_text => "Serialized Text",
      :case => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Serialized Text/)
    expect(rendered).to match(//)
  end
end
