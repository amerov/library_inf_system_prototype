class LibsController < ApplicationController
  before_action :set_lib, only: %i[ show edit update destroy ]

  # GET /libs or /libs.json
  def index
    @libs = Lib.all
  end

  # GET /libs/1 or /libs/1.json
  def show
  end

  # GET /libs/new
  def new
    @lib = Lib.new
  end

  # GET /libs/1/edit
  def edit
  end

  # POST /libs or /libs.json
  def create
    @lib = Lib.new(lib_params)

    respond_to do |format|
      if @lib.save
        format.html { redirect_to @lib, notice: "Lib was successfully created." }
        format.json { render :show, status: :created, location: @lib }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lib.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libs/1 or /libs/1.json
  def update
    respond_to do |format|
      if @lib.update(lib_params)
        format.html { redirect_to @lib, notice: "Lib was successfully updated." }
        format.json { render :show, status: :ok, location: @lib }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lib.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libs/1 or /libs/1.json
  def destroy
    @lib.destroy
    respond_to do |format|
      format.html { redirect_to libs_url, notice: "Lib was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lib
      @lib = Lib.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lib_params
      params.require(:lib).permit(:name, :address, :city)
    end
end
