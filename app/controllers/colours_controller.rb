class ColoursController < ApplicationController
  before_action :set_colour, only: %i[ show edit update destroy ]

  # GET /colours or /colours.json
  def index
    @colours = Colour.all
  end

  # GET /colours/1 or /colours/1.json
  def show
  end

  # GET /colours/new
  def new
    @colour = Colour.new
  end

  # GET /colours/1/edit
  def edit
  end

  # POST /colours or /colours.json
  def create
    @colour = Colour.new(colour_params)

    respond_to do |format|
      if @colour.save
        format.html { redirect_to colour_url(@colour), notice: "Colour was successfully created." }
        format.json { render :show, status: :created, location: @colour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @colour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colours/1 or /colours/1.json
  def update
    respond_to do |format|
      if @colour.update(colour_params)
        format.html { redirect_to colour_url(@colour), notice: "Colour was successfully updated." }
        format.json { render :show, status: :ok, location: @colour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @colour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colours/1 or /colours/1.json
  def destroy
    @colour.destroy!

    respond_to do |format|
      format.html { redirect_to colours_url, notice: "Colour was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colour
      @colour = Colour.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def colour_params
      params.require(:colour).permit(:name)
    end
end
