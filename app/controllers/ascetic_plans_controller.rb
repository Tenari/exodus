class AsceticPlansController < ApplicationController
  before_action :set_ascetic_plan, only: [:show, :edit, :update, :destroy]

  # GET /ascetic_plans
  # GET /ascetic_plans.json
  def index
    @ascetic_plans = AsceticPlan.all
  end

  # GET /ascetic_plans/1
  # GET /ascetic_plans/1.json
  def show
  end

  # GET /ascetic_plans/new
  def new
    @ascetic_plan = AsceticPlan.new
  end

  # GET /ascetic_plans/1/edit
  def edit
  end

  # POST /ascetic_plans
  # POST /ascetic_plans.json
  def create
    @ascetic_plan = AsceticPlan.new(ascetic_plan_params)

    respond_to do |format|
      if @ascetic_plan.save
        format.html { redirect_to @ascetic_plan, notice: 'Ascetic plan was successfully created.' }
        format.json { render :show, status: :created, location: @ascetic_plan }
      else
        format.html { render :new }
        format.json { render json: @ascetic_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ascetic_plans/1
  # PATCH/PUT /ascetic_plans/1.json
  def update
    respond_to do |format|
      if @ascetic_plan.update(ascetic_plan_params)
        format.html { redirect_to @ascetic_plan, notice: 'Ascetic plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @ascetic_plan }
      else
        format.html { render :edit }
        format.json { render json: @ascetic_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ascetic_plans/1
  # DELETE /ascetic_plans/1.json
  def destroy
    @ascetic_plan.destroy
    respond_to do |format|
      format.html { redirect_to ascetic_plans_url, notice: 'Ascetic plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ascetic_plan
      @ascetic_plan = AsceticPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ascetic_plan_params
      params.require(:ascetic_plan).permit(:ascetic_practice_id, :date)
    end
end
