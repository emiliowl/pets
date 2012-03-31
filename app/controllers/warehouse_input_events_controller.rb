class WarehouseInputEventsController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /warehouse_input_events
  # GET /warehouse_input_events.json
  def index
    @warehouse_input_events = WarehouseInputEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @warehouse_input_events }
    end
  end

  # GET /warehouse_input_events/new
  # GET /warehouse_input_events/new.json
  def new
    @warehouse_input_event = WarehouseInputEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @warehouse_input_event }
    end
  end

  # POST /warehouse_input_events
  # POST /warehouse_input_events.json
  def create
    @warehouse_input_event = WarehouseInputEvent.new(params[:warehouse_input_event])
    
    warehouse = Warehouse.new
    
    respond_to do |format|
      if warehouse.create_input_with_event(@warehouse_input_event) { |wie| @warehouse_input_event = wie }
        format.html { redirect_to warehouse_input_events_url, notice: 'Warehouse input event was successfully created.' }
        format.json { render json: @warehouse_input_event, status: :created, location: @warehouse_input_event }
      else
        format.html { render action: "new" }
        format.json { render json: @warehouse_input_event.errors, status: :unprocessable_entity }
      end
    end
  end
end
