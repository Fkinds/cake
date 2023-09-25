class Admin::ItemsController < ApplicationController
  def index
    @items = Item.search(params[:search])
  end

  def new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  private
  def item_params
    params.require(:item).permit(:image, :genre_id, :name, :price, :introduction, :is_sold)
  end
end
