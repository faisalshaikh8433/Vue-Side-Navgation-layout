class Api::V1::DashboardController < ApplicationController
  
  def item_count
    items = Item.all
    render json: items.as_json(except: [:created_at, :updated_at]), status: :ok
  end

  def files
    render file: File.join(Rails.root, 'restricter.liquid')
  end

end