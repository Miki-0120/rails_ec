# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    before_action :basic_authenticate

    def index
      @items = Item.all
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
        redirect_to admin_items_path, notice: '商品を作成しました'
      else
        flash[:alert] = '商品作成に失敗しました'
        render :new
      end
    end

    def update
      set_item
      if @item.update(item_params)
        redirect_to admin_items_path, notice: '商品情報を編集しました'
      else
        flash[:alert] = '編集に失敗しました'
        render :edit
      end
    end

    def destroy
      set_item
      @item.destroy
      redirect_to admin_items_path, notice: '商品の削除が成功しました'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :price, :description, :item_image, images: [])
    end

    def basic_authenticate
      # return if Rails.env.development?

      authenticate_or_request_with_http_basic do |username, password|
        username == 'admin' && password == 'pw'
      end
    end
  end
end
