require 'spec_helper'

describe "editors/new" do
  before(:each) do
    assign(:editor, stub_model(Editor,
      :first_name => "MyString",
      :last_name => "MyString",
      :username => "MyString"
    ).as_new_record)
  end

  it "renders new editor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => editors_path, :method => "post" do
      assert_select "input#editor_first_name", :name => "editor[first_name]"
      assert_select "input#editor_last_name", :name => "editor[last_name]"
      assert_select "input#editor_username", :name => "editor[username]"
    end
  end
end
