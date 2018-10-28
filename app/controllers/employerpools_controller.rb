class EmployerpoolsController < ApplicationController
  before_action :set_employerpool, only: [:show, :edit, :update, :destroy]

  # GET /employerpools
  # GET /employerpools.json
  def index
    @employerpools = Employerpool.all
  end

  # GET /employerpools/1
  # GET /employerpools/1.json
  def show
  end

  # GET /employerpools/new
  def new
    @employerpool = Employerpool.new
  end

  # GET /employerpools/1/edit
  def edit
  end

  # POST /employerpools
  # POST /employerpools.json
  def create
    @employerpool = Employerpool.new(employerpool_params)

    respond_to do |format|
      if @employerpool.save
        format.html { redirect_to @employerpool, notice: 'Employerpool was successfully created.' }
        format.json { render :show, status: :created, location: @employerpool }
      else
        format.html { render :new }
        format.json { render json: @employerpool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employerpools/1
  # PATCH/PUT /employerpools/1.json
  def update
    respond_to do |format|
      if @employerpool.update(employerpool_params)
        format.html { redirect_to @employerpool, notice: 'Employerpool was successfully updated.' }
        format.json { render :show, status: :ok, location: @employerpool }
      else
        format.html { render :edit }
        format.json { render json: @employerpool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employerpools/1
  # DELETE /employerpools/1.json
  def destroy
    @employerpool.destroy
    respond_to do |format|
      format.html { redirect_to employerpools_url, notice: 'Employerpool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employerpool
      @employerpool = Employerpool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employerpool_params
      params.require(:employerpool).permit(:employer, :sector, :user_id, :active)
    end
end
