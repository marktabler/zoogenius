class SubspeciesController < ApplicationController
  before_action :set_subspecies, only: [:show, :edit, :update, :destroy]

  # GET /species
  # GET /species.json
  def index
    @subspecies = Subspecies.all
  end

  # GET /species/1
  # GET /species/1.json
  def show
  end

  # GET /species/new
  def new
    @subspecies = Subspecies.new
  end

  # GET /species/1/edit
  def edit
  end

  # POST /species
  # POST /species.json
  def create
    @subspecies = Subspecies.new(species_params)

    respond_to do |format|
      if @subspecies.save
        format.html { redirect_to @subspecies, notice: 'SubSpecies was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subspecies }
      else
        format.html { render action: 'new' }
        format.json { render json: @subspecies.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /species/1
  # PATCH/PUT /species/1.json
  def update
    respond_to do |format|
      if @subspecies.update(species_params)
        format.html { redirect_to @subspecies, notice: 'SubSpecies was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subspecies.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /species/1
  # DELETE /species/1.json
  def destroy
    @subspecies.destroy
    respond_to do |format|
      format.html { redirect_to species_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subspecies
      @subspecies = Subspecies.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subspecies_params
      params.require(:subspecies).permit(:name, :taxonomy_id)
    end
end
