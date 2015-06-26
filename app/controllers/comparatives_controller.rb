class ComparativesController < ApplicationController
  before_action :set_comparative, only: [:show, :edit, :update, :destroy]

  # GET /comparatives
  # GET /comparatives.json
  def index
    @comparatives = Comparative.all
  end

  # GET /comparatives/1
  # GET /comparatives/1.json
  def show
  end

  # GET /comparatives/new
  def new
    @comparative = Comparative.new
  end

  # GET /comparatives/1/edit
  def edit
  end

  # POST /comparatives
  # POST /comparatives.json
  def create
    @comparative = Comparative.new(comparative_params)

    respond_to do |format|
      if @comparative.save
        format.html { redirect_to @comparative, notice: 'Comparative was successfully created.' }
        format.json { render :show, status: :created, location: @comparative }
      else
        format.html { render :new }
        format.json { render json: @comparative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comparatives/1
  # PATCH/PUT /comparatives/1.json
  def update
    respond_to do |format|
      if @comparative.update(comparative_params)
        format.html { redirect_to @comparative, notice: 'Comparative was successfully updated.' }
        format.json { render :show, status: :ok, location: @comparative }
      else
        format.html { render :edit }
        format.json { render json: @comparative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comparatives/1
  # DELETE /comparatives/1.json
  def destroy
    @comparative.destroy
    respond_to do |format|
      format.html { redirect_to comparatives_url, notice: 'Comparative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comparative
      @comparative = Comparative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comparative_params
      params.require(:comparative).permit(:current_cost, :integra_cost, :installation_cost, :amortization_term)
    end
end
