class AddresspoolsController < ApplicationController
  before_action :set_addresspool, only: [:show, :edit, :update, :destroy]

  # GET /addresspools
  # GET /addresspools.json
  def index
    @addresspools = Addresspool.all
  end

  # GET /addresspools/1
  # GET /addresspools/1.json
  def show
  end

  # GET /addresspools/new
  def new
    @addresspool = Addresspool.new
  end

  # GET /addresspools/1/edit
  def edit
  end

  # POST /addresspools
  # POST /addresspools.json
  def create
    @addresspool = Addresspool.new(addresspool_params)

    respond_to do |format|
      if @addresspool.save
        format.html { redirect_to @addresspool, notice: 'Addresspool was successfully created.' }
        format.json { render :show, status: :created, location: @addresspool }
      else
        format.html { render :new }
        format.json { render json: @addresspool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresspools/1
  # PATCH/PUT /addresspools/1.json
  def update
    respond_to do |format|
      if @addresspool.update(addresspool_params)
        format.html { redirect_to @addresspool, notice: 'Addresspool was successfully updated.' }
        format.json { render :show, status: :ok, location: @addresspool }
      else
        format.html { render :edit }
        format.json { render json: @addresspool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresspools/1
  # DELETE /addresspools/1.json
  def destroy
    @addresspool.destroy
    respond_to do |format|
      format.html { redirect_to addresspools_url, notice: 'Addresspool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addresspool
      @addresspool = Addresspool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addresspool_params
      params.require(:addresspool).permit(:address, :active, :user_id)
    end
end
