class Api::V1::DashboardController < ApplicationController
  
  def item_count
    items = Item.all
    render json: items.as_json(except: [:created_at, :updated_at]), status: :ok
  end

end