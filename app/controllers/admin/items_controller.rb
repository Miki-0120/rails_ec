class Admin::ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
      @items = Item.all
    end
  
    def show
      @item = Item.find(params[:id])
    end
  
    def edit
      @item = Item.find(params[:id])
    end
  
    def new
      @item = Item.new
    end
  
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to admin_item_path(@item), notice: "商品を登録しました"
      else
        flash.now[:danger] = "商品登録に失敗しました"
        render :new
      end
    end
  
    def update
      set_item
      if @item.update(item_params)
        redirect_to admin_item_path(@item), notice: "商品情報を編集しました"
      else
        flash.now[:danger] = "編集に失敗しました"
        render :edit
      end  
    end
  
    def destroy
      set_item
      @item.destroy
      redirect_to admin_items_path, notice: "商品の削除が成功しました"
      rescue StandardError => e
      flash.now[:danger] = "削除に失敗しました: #{e.message}"
      render 'show'
    end
  
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "pw"
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :price, :description, :image, images: [])
  end
end