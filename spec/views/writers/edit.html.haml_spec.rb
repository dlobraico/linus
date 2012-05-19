require 'spec_helper'

describe "writers/edit" do
  before(:each) do
    @writer = assign(:writer, stub_model(Writer,
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit writer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => writers_path(@writer), :method => "post" do
      assert_select "input#writer_first_name", :name => "writer[first_name]"
      assert_select "input#writer_last_name", :name => "writer[last_name]"
    end
  end
end
