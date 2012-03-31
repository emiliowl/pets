require 'spec_helper'

describe "AccountInputEvents" do
  describe "GET /account_input_events" do
    it "it must return 302 to redirect for authentication" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get account_input_events_path
      response.status.should be(302)
    end
  end
end
