class AccountOutputEventsController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /account_output_events
  # GET /account_output_events.json
  def index
    @account_output_events = AccountOutputEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_output_events }
    end
  end

  # GET /account_output_events/new
  # GET /account_output_events/new.json
  def new
    @account_output_event = AccountOutputEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_output_event }
    end
  end

  # POST /account_output_events
  # POST /account_output_events.json
  def create
    @account_output_event = AccountOutputEvent.new(params[:account_output_event])

    respond_to do |format|
      begin 
        @account_output_event.save!
        format.html { redirect_to account_output_events_url, notice: 'Account output event was successfully created.' }
        format.json { render json: @account_output_event, status: :created, location: @account_output_event }
      rescue ArgumentError => err
        @account_output_event.errors[:account_id] << err.message if err.message.downcase.include?"account"
        @account_output_event.errors[:value] << err.message if err.message.downcase.include?"number" or err.message.downcase.include?"funds"
        format.html { render action: "new" }
        format.json { render json: @account_input_event.errors, status: :unprocessable_entity }
      rescue ActiveRecord::RecordInvalid => err
        @account_output_event.errors[:account_id] << err.message if err.message.downcase.include?"account"
        @account_output_event.errors[:value] << err.message if err.message.downcase.include?"value"
        format.html { render action: "new" }
        format.json { render json: @account_output_event.errors, status: :unprocessable_entity }
      rescue Exception => ex
        format.html { redirect_to new_account_output_event_url, alert: "Funcionalidade temporariamente indisponivel: #{err.message}" }
      end
    end
  end
end