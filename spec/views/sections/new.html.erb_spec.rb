require 'rails_helper'

RSpec.describe "sections/new", type: :view do
  before(:each) do
    assign(:section, Section.new(
      :serialized_text => "MyString",
      :case => nil
    ))
  end

  it "renders new section form" do
    render

    assert_select "form[action=?][method=?]", sections_path, "post" do

      assert_select "input[name=?]", "section[serialized_text]"

      assert_select "input[name=?]", "section[case_id]"
    end
  end
end
