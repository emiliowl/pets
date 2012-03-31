class AccountInputEventsController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /account_input_events
  # GET /account_input_events.json
  def index
    @account_input_events = AccountInputEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_input_events }
    end
  end

  # GET /account_input_events/new
  # GET /account_input_events/new.json
  def new
    @account_input_event = AccountInputEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_input_event }
    end
  end

  # POST /account_input_events
  # POST /account_input_events.json
  def create
    @account_input_event = AccountInputEvent.new(params[:account_input_event])

    respond_to do |format|
      begin 
        @account_input_event.save!
        format.html { redirect_to account_input_events_url, notice: 'Account input event was successfully created.' }
        format.json { render json: @account_input_event, status: :created, location: @account_input_event }
      rescue ArgumentError => err
        @account_input_event.errors[:account_id] << err.message if err.message.downcase.include?"account"
        @account_input_event.errors[:value] << err.message if err.message.downcase.include?"number"
        format.html { render action: "new" }
        format.json { render json: @account_input_event.errors, status: :unprocessable_entity }
      rescue ActiveRecord::RecordInvalid => err
        @account_input_event.errors[:account_id] << err.message if err.message.downcase.include?"account"
        @account_input_event.errors[:value] << err.message if err.message.downcase.include?"value"
        format.html { render action: "new" }
        format.json { render json: @account_input_event.errors, status: :unprocessable_entity }
      rescue Exception => ex
        format.html { redirect_to new_account_input_event_url, alert: "Funcionalidade temporariamente indisponivel: #{err.message}" }
      end
    end
  end
end