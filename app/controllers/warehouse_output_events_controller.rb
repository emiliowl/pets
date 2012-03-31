class WarehouseOutputEventsController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /warehouse_output_events
  # GET /warehouse_output_events.json
  def index
    @warehouse_output_events = WarehouseOutputEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @warehouse_output_events }
    end
  end

  # GET /warehouse_output_events/new
  # GET /warehouse_output_events/new.json
  def new
    @warehouse_output_event = WarehouseOutputEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @warehouse_output_event }
    end
  end

  # POST /warehouse_output_events
  # POST /warehouse_output_events.json
  def create
    @warehouse_output_event = WarehouseOutputEvent.new(params[:warehouse_output_event])

    warehouse = Warehouse.new

    respond_to do |format|
      if warehouse.create_output_with_event(@warehouse_output_event) { |woe| @warehouse_output_event = woe }
        format.html { redirect_to warehouse_output_events_url, notice: 'Warehouse output event was successfully created.' }
        format.json { render json: @warehouse_output_event, status: :created, location: @warehouse_output_event }
      else
        format.html { render action: "new" }
        format.json { render json: @warehouse_output_event.errors, status: :unprocessable_entity }
      end
    end
  end
  
end