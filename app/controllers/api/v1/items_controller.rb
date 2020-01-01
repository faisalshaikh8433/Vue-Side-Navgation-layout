class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :edit, :destroy]

  def index
    items = Item.all
    render json: items.as_json(except: [:created_at, :updated_at]), status: :ok
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item.as_json(except: [:created_at, :updated_at]), status: :ok
    else
      render json: {errors: @item.errors}, status: :unprocessable_entity
    end
  end

  def edit
    render json: @item.as_json(except: [:created_at, :updated_at]), status: :ok
  end

  def update
    if @item.update(item_params)
      render json: @item.as_json(except: [:created_at, :updated_at]), status: :ok
    else
      render json: {errors: @item.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    render json: {success: true}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :active)
    end
end
