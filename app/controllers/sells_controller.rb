class SellsController < ApplicationController
  # GET /sells
  # GET /sells.json
  def index
    @sells = Sell.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sells }
    end
  end

  # GET /sells/1
  # GET /sells/1.json
  def show
    @sell = Sell.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sell }
    end
  end

  # GET /sells/new
  # GET /sells/new.json
  def new
    @sell = Sell.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sell }
    end
  end

  # POST /sells
  # POST /sells.json
  def create
    product_ids = params[:sell][:product_ids]
    user_id = params[:sell][:user_id]
    payment_options = params[:sell][:payment_options]
    
    @sell = Sell.new(:user_id => user_id, :payment_options => payment_options)
    
    #check if contains any product
    unless product_ids.nil?
      # verifica quais sao os produtos que estao contidos em product_ids
      uniq_products_ids = product_ids.uniq
      # verifica quantos sao os produtos contidos em product_ids
      uniq_products_ids.each do |product_id|
        product = Product.find(product_id)
        quantity = product_ids.count(product_id)
        # adiciona instancias de item_sold na venda, contendo os produtos e as quantidades
        item_sold = ItemSold.new(:product_id => product_id,
                                 :quantity => quantity,
                                 :value => product.sell_price)
        @sell.item_solds << item_sold
        @sell.products << product
      end
    end

    logger.info "PRODUTOS ADQUIRIDOS:"
    @sell.item_solds.each do |is|
      logger.info "--------------------------"
      logger.info "name: #{is.product.name}"
      logger.info "value: #{is.value}"
      logger.info "quantity: #{is.quantity}"
      logger.info "--------------------------"
    end

    respond_to do |format|
      if @sell.save
        format.html { redirect_to @sell, notice: 'Sell was successfully created.' }
        format.json { render json: @sell, status: :created, location: @sell }
      else
        format.html { render action: "new" }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sells/1
  # DELETE /sells/1.json
  def destroy
    @sell = Sell.find(params[:id])
    @sell.destroy

    respond_to do |format|
      format.html { redirect_to sells_url }
      format.json { head :ok }
    end
  end
end
