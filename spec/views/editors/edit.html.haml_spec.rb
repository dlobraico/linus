require 'spec_helper'

describe "editors/edit" do
  before(:each) do
    @editor = assign(:editor, stub_model(Editor,
      :first_name => "MyString",
      :last_name => "MyString",
      :username => "MyString"
    ))
  end

  it "renders the edit editor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => editors_path(@editor), :method => "post" do
      assert_select "input#editor_first_name", :name => "editor[first_name]"
      assert_select "input#editor_last_name", :name => "editor[last_name]"
      assert_select "input#editor_username", :name => "editor[username]"
    end
  end
end
