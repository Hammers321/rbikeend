require 'product_decorator'

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :initialize_cart
  before_action :authenticate_admin!, only: [:new, :edit, :update, :create, :destroy]
  
  layout "products"
  # GET /products
  # GET /products.json
  def index
    @products = Product.search(params[:search])
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render layout: "application"
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new()

    @product.name = params[:product][:name] 
    
    @product.image = params[:product][:image]
    @product.size_type = params[:product][:size_type]
    @product.brand = params[:product][:brand]

    #create an instance/object of a BasicProduct
    
    myProduct = BasicProduct.new(10, @product.brand )

    #add the extra features to the new product
    if params[:product][:trailers].to_s.length > 0 then
      myProduct = TrailersDecorator.new(myProduct)
    end

   # populate the price and the description details
   @product.price = myProduct.price
   @product.description = myProduct.details

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :image, :description, :size_type, :brand)
    end
end
