require 'spec_helper'

describe "AccountOutputEvents" do
  describe "GET /account_output_events" do
    it "it must return 302 to redirect for authentication" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get account_output_events_path
      response.status.should be(302)
    end
  end
end
