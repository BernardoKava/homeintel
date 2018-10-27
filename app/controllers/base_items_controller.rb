class BaseItemsController < ApplicationController
  before_action :set_base_item, only: [:show, :edit, :update, :destroy]

  # GET /base_items
  # GET /base_items.json
  def index
    @base_items = BaseItem.all
  end

  # GET /base_items/1
  # GET /base_items/1.json
  def show
  end

  # GET /base_items/new
  def new
    @base_item = BaseItem.new
  end

  # GET /base_items/1/edit
  def edit
  end

  # POST /base_items
  # POST /base_items.json
  def create
    @base_item = BaseItem.new(base_item_params)

    respond_to do |format|
      if @base_item.save
        format.html { redirect_to @base_item, notice: 'Base item was successfully created.' }
        format.json { render :show, status: :created, location: @base_item }
      else
        format.html { render :new }
        format.json { render json: @base_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /base_items/1
  # PATCH/PUT /base_items/1.json
  def update
    respond_to do |format|
      if @base_item.update(base_item_params)
        format.html { redirect_to @base_item, notice: 'Base item was successfully updated.' }
        format.json { render :show, status: :ok, location: @base_item }
      else
        format.html { render :edit }
        format.json { render json: @base_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /base_items/1
  # DELETE /base_items/1.json
  def destroy
    @base_item.destroy
    respond_to do |format|
      format.html { redirect_to base_items_url, notice: 'Base item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_base_item
      @base_item = BaseItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def base_item_params
      params.require(:base_item).permit(:name, :description, :owner, :active, :user_id)
    end
end
