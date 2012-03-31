require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AccountOutputEventsController do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # AccountOutputEvent. As you add validations to AccountOutputEvent, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :account_id => Factory.create(:account).id,
      :value      => 9.99
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AccountOutputEventsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all account_output_events as @account_output_events" do
      account_output_event = AccountOutputEvent.create! valid_attributes
      get :index, {}
      assigns(:account_output_events).should eq([account_output_event])
    end
  end

  describe "GET new" do
    it "assigns a new account_output_event as @account_output_event" do
      get :new, {}
      assigns(:account_output_event).should be_a_new(AccountOutputEvent)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AccountOutputEvent" do
        expect {
          post :create, {:account_output_event => valid_attributes}
        }.to change(AccountOutputEvent, :count).by(1)
      end

      it "assigns a newly created account_output_event as @account_output_event" do
        post :create, {:account_output_event => valid_attributes}
        assigns(:account_output_event).should be_a(AccountOutputEvent)
        assigns(:account_output_event).should be_persisted
      end

      it "redirects to the created account_output_event" do
        post :create, {:account_output_event => valid_attributes}
        response.should redirect_to(account_output_events_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved account_output_event as @account_output_event" do
        # Trigger the behavior that occurs when invalid params are submitted
        AccountOutputEvent.any_instance.stub(:save).and_return(false)
        post :create, {:account_output_event => {}}
        assigns(:account_output_event).should be_a_new(AccountOutputEvent)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AccountOutputEvent.any_instance.stub(:save).and_return(false)
        post :create, {:account_output_event => {}}
        response.should render_template("new")
      end
    end
  end

end