require 'spec_helper'

describe "writers/new" do
  before(:each) do
    assign(:writer, stub_model(Writer,
      :first_name => "MyString",
      :last_name => "MyString"
    ).as_new_record)
  end

  it "renders new writer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => writers_path, :method => "post" do
      assert_select "input#writer_first_name", :name => "writer[first_name]"
      assert_select "input#writer_last_name", :name => "writer[last_name]"
    end
  end
end
