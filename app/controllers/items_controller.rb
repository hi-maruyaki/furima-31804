class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  before_action :authenticate_user!, only: :edit
  def edit  
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id 
      redirect_to root_path
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end


  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
      if @item.save
        redirect_to item_path(@item.id)
      else
        render :edit
      end
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :carriage_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
