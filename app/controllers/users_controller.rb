class UsersController < ApplicationController

  def index # If we're querying all users
    if params[:item_id] # And find a query of item_id
      item_id = Item.find(params[:item_id]) #Find me the Item of that particular ID
      users = item_id.user #Users for this item
    else # And there is no query for item_id
      user_by_id = User.find_by(id: params[:id]) #Just get me user by id
      users = user_by_id.all
    end
    render json: users, status: :ok
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end

  # def show  # If we're querying users by ID
  #   if params[:item_id] # And there is a parameter of item
  #     item_id = Item.find(params[:item_id]) #Find me that Item
  #     that_user = item_id.user #User for that item
  #   else # And there is no query for item_id
  #     user_by_id = User.find_by(id: params[:id]) #Just get me that user
  #     that_user = user_by_id.all
  #   end
  #   render json: that_user, status: :ok
  # end

end
