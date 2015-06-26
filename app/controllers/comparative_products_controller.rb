class ComparativeProductsController < ApplicationController
  before_action :set_comparative_product, only: [:show, :edit, :update, :destroy]

  # GET /comparative_products
  # GET /comparative_products.json
  def index
    @comparative_products = ComparativeProduct.all
  end

  # GET /comparative_products/1
  # GET /comparative_products/1.json
  def show
  end

  # GET /comparative_products/new
  def new
    @comparative_product = ComparativeProduct.new
  end

  # GET /comparative_products/1/edit
  def edit
  end

  # POST /comparative_products
  # POST /comparative_products.json
  def create
    @comparative_product = ComparativeProduct.new(comparative_product_params)

    respond_to do |format|
      if @comparative_product.save
        format.html { redirect_to @comparative_product, notice: 'Comparative product was successfully created.' }
        format.json { render :show, status: :created, location: @comparative_product }
      else
        format.html { render :new }
        format.json { render json: @comparative_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comparative_products/1
  # PATCH/PUT /comparative_products/1.json
  def update
    respond_to do |format|
      if @comparative_product.update(comparative_product_params)
        format.html { redirect_to @comparative_product, notice: 'Comparative product was successfully updated.' }
        format.json { render :show, status: :ok, location: @comparative_product }
      else
        format.html { render :edit }
        format.json { render json: @comparative_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comparative_products/1
  # DELETE /comparative_products/1.json
  def destroy
    @comparative_product.destroy
    respond_to do |format|
      format.html { redirect_to comparative_products_url, notice: 'Comparative product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comparative_product
      @comparative_product = ComparativeProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comparative_product_params
      params.require(:comparative_product).permit(:amount, :hours_use)
    end
end
