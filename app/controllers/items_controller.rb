# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  # GET /tasks or /tasks.json
  def index
    @items = Item.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @item = Item.find(params[:id])
    @related_items = Item.where.not(id: @item.id).order(created_at: :desc).limit(4)
  end

  # GET /tasks/new
  
  # GET /tasks/1/edit
  
  # POST /tasks or /tasks.json
  
  # PATCH/PUT /tasks/1 or /tasks/1.json

  # DELETE /tasks/1 or /tasks/1.json
 
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :price, :description, :image, images: [])
  end
end
