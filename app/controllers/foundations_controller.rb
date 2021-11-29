class FoundationsController < ApplicationController
  before_action :set_foundation, only: %i[ show edit update destroy ]

  # GET /foundations or /foundations.json
  def index
    @foundations = Foundation.all
  end

  # GET /foundations/1 or /foundations/1.json
  def show
  end

  # GET /foundations/new
  def new
    @foundation = Foundation.new
  end

  # GET /foundations/1/edit
  def edit
  end

  # POST /foundations or /foundations.json
  def create
    @foundation = Foundation.new(foundation_params)

    respond_to do |format|
      if @foundation.save
        format.html { redirect_to @foundation, notice: "Foundation was successfully created." }
        format.json { render :show, status: :created, location: @foundation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foundation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foundations/1 or /foundations/1.json
  def update
    respond_to do |format|
      if @foundation.update(foundation_params)
        format.html { redirect_to @foundation, notice: "Foundation was successfully updated." }
        format.json { render :show, status: :ok, location: @foundation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foundation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foundations/1 or /foundations/1.json
  def destroy
    @foundation.destroy
    respond_to do |format|
      format.html { redirect_to foundations_url, notice: "Foundation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foundation
      @foundation = Foundation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def foundation_params
      params.require(:foundation).permit(:name, :lib_id, :books_count, :journals_count, :newspapers_count, :collections_count, :dissertations_count, :reports_count)
    end
end
