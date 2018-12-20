class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.where(active: true).paginate(page: params[:page], :per_page => 5).order("created_at DESC")
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    @ref = @inventory.id
    @items = Item.where(inventory_id: @ref)


    # inventory number
    @inventory_number =  (@inventory.id + 10000 )
    @inventory.inventory_number = @inventory_number
    @inventory.save
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new

  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:department, :active, :user_id, :period_from, :period_to,:department_id,:location,
                                        items_attributes:[:id,:item,:quantity,:description, :value, :owner, :virtual,
                                                          :_destroy] ,
      comments_attributes:[:id, :commentary, :user_id, :_destroy] )
    end
end
