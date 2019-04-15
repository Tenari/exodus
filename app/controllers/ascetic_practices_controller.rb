class AsceticPracticesController < ApplicationController
  before_action :set_ascetic_practice, only: [:show, :edit, :update, :destroy]

  # GET /ascetic_practices
  # GET /ascetic_practices.json
  def index
    @ascetic_practices = AsceticPractice.all
  end

  # GET /ascetic_practices/1
  # GET /ascetic_practices/1.json
  def show
  end

  # GET /ascetic_practices/new
  def new
    @ascetic_practice = AsceticPractice.new
  end

  # GET /ascetic_practices/1/edit
  def edit
  end

  # POST /ascetic_practices
  # POST /ascetic_practices.json
  def create
    @ascetic_practice = AsceticPractice.new(ascetic_practice_params)

    respond_to do |format|
      if @ascetic_practice.save
        format.html { redirect_to @ascetic_practice, notice: 'Ascetic practice was successfully created.' }
        format.json { render :show, status: :created, location: @ascetic_practice }
      else
        format.html { render :new }
        format.json { render json: @ascetic_practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ascetic_practices/1
  # PATCH/PUT /ascetic_practices/1.json
  def update
    respond_to do |format|
      if @ascetic_practice.update(ascetic_practice_params)
        format.html { redirect_to @ascetic_practice, notice: 'Ascetic practice was successfully updated.' }
        format.json { render :show, status: :ok, location: @ascetic_practice }
      else
        format.html { render :edit }
        format.json { render json: @ascetic_practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ascetic_practices/1
  # DELETE /ascetic_practices/1.json
  def destroy
    @ascetic_practice.destroy
    respond_to do |format|
      format.html { redirect_to ascetic_practices_url, notice: 'Ascetic practice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ascetic_practice
      @ascetic_practice = AsceticPractice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ascetic_practice_params
      params.require(:ascetic_practice).permit(:description)
    end
end
