class ReplenishmentsController < ApplicationController
  before_action :set_replenishment, only: %i[ show edit update destroy ]

  # GET /replenishments or /replenishments.json
  def index
    @replenishments = Replenishment.all
  end

  # GET /replenishments/1 or /replenishments/1.json
  def show
  end

  # GET /replenishments/new
  def new
    @replenishment = Replenishment.new
  end

  # GET /replenishments/1/edit
  def edit
  end

  # POST /replenishments or /replenishments.json
  def create
    @replenishment = Replenishment.new(replenishment_params)

    respond_to do |format|
      if @replenishment.save
        format.html { redirect_to @replenishment, notice: "Replenishment was successfully created." }
        format.json { render :show, status: :created, location: @replenishment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @replenishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replenishments/1 or /replenishments/1.json
  def update
    respond_to do |format|
      if @replenishment.update(replenishment_params)
        format.html { redirect_to @replenishment, notice: "Replenishment was successfully updated." }
        format.json { render :show, status: :ok, location: @replenishment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @replenishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replenishments/1 or /replenishments/1.json
  def destroy
    @replenishment.destroy
    respond_to do |format|
      format.html { redirect_to replenishments_url, notice: "Replenishment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_replenishment
      @replenishment = Replenishment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def replenishment_params
      params.require(:replenishment).permit(:foundation_id, :employee_id, :name, :type_id, :publisher, :items_count)
    end
end
