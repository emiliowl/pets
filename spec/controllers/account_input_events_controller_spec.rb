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

describe AccountInputEventsController do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # AccountInputEvent. As you add validations to AccountInputEvent, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :account_id => Factory.create(:account),
      :value      => 10
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AccountInputEventsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all account_input_events as @account_input_events" do
      account_input_event = AccountInputEvent.create! valid_attributes
      get :index, {}
      assigns(:account_input_events).should eq([account_input_event])
    end
  end

  describe "GET new" do
    it "assigns a new account_input_event as @account_input_event" do
      get :new, {}
      assigns(:account_input_event).should be_a_new(AccountInputEvent)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new AccountInputEvent" do
        expect {
          post :create, {:account_input_event => valid_attributes}
        }.to change(AccountInputEvent, :count).by(1)
      end

      it "assigns a newly created account_input_event as @account_input_event" do
        post :create, {:account_input_event => valid_attributes}
        assigns(:account_input_event).should be_a(AccountInputEvent)
        assigns(:account_input_event).should be_persisted
      end

      it "redirects to the created account_input_event" do
        post :create, {:account_input_event => valid_attributes}
        response.should redirect_to(account_input_events_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved account_input_event as @account_input_event" do
        # Trigger the behavior that occurs when invalid params are submitted
        AccountInputEvent.any_instance.stub(:save).and_return(false)
        post :create, {:account_input_event => {}}
        assigns(:account_input_event).should be_a_new(AccountInputEvent)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AccountInputEvent.any_instance.stub(:save).and_return(false)
        post :create, {:account_input_event => {}}
        response.should render_template("new")
      end
    end
  end
end