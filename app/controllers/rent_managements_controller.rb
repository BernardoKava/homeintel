class RentManagementsController < ApplicationController
  before_action :set_rent_management, only: [:show, :edit, :update, :destroy]

  # GET /rent_managements
  # GET /rent_managements.json
  def index
    @rent_managements = RentManagement.all.paginate(page: params[:page], :per_page => 10).order("created_at DESC")
  end

  # GET /rent_managements/1
  # GET /rent_managements/1.json
  def show
  end

  # GET /rent_managements/new
  def new
    @rent_management = RentManagement.new
  end

  # GET /rent_managements/1/edit
  def edit
  end

  # POST /rent_managements
  # POST /rent_managements.json
  def create
    @rent_management = RentManagement.new(rent_management_params)

    respond_to do |format|
      if @rent_management.save
        format.html { redirect_to @rent_management, notice: 'Rent management was successfully created.' }
        format.json { render :show, status: :created, location: @rent_management }
      else
        format.html { render :new }
        format.json { render json: @rent_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rent_managements/1
  # PATCH/PUT /rent_managements/1.json
  def update
    respond_to do |format|
      if @rent_management.update(rent_management_params)
        format.html { redirect_to @rent_management, notice: 'Rent management was successfully updated.' }
        format.json { render :show, status: :ok, location: @rent_management }
      else
        format.html { render :edit }
        format.json { render json: @rent_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rent_managements/1
  # DELETE /rent_managements/1.json
  def destroy
    @rent_management.destroy
    respond_to do |format|
      format.html { redirect_to rent_managements_url, notice: 'Rent management was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent_management
      @rent_management = RentManagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rent_management_params
      params.require(:rent_management).permit(:year, :month, :amount, :date_collected, :details, :collected_by, :user_id)
    end
end
