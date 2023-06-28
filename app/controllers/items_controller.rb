class ItemsController < ApplicationController
  wrap_parameters format: []

  def index
    if params[:user_id]
      user_id = User.find(params[:user_id]) #Find me that User
      items = user_id.items #Items for this user
    else
      items = Item.all #Print for me all items
    end
   
    render json: items, include: :user
  end

  def show
    item_by_id = Item.find_by(id: params[:id])
    render json: item_by_id, status: :ok
  end

  # def show
  #   if params[:user_id]
  #     user_id = User.find(params[:user_id]) #Find me that User
  #     items = user_id.items #Items for this user
  #   else 
  #     item_by_id = Item.find_by(id: params[:id])
  #     items = item_by_id.all
  #   end
  #   render json: items, status: :ok
  # end

  # POST
  def create
    items = Item.create(item_params)
    render json: items, status: :created
  end

  private
  def item_params
    params.permit(:name, :description, :price, :user_id)
  end
end
