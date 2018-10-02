require 'rails_helper'

RSpec.describe "sections/index", type: :view do
  before(:each) do
    assign(:sections, [
      Section.create!(
        :serialized_text => "Serialized Text",
        :case => nil
      ),
      Section.create!(
        :serialized_text => "Serialized Text",
        :case => nil
      )
    ])
  end

  it "renders a list of sections" do
    render
    assert_select "tr>td", :text => "Serialized Text".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
