# frozen_string_literal: true

class ItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  # GET /tasks or /tasks.json
  def index
    @items = Item.all
    @line_item = LineItem.new
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @item = Item.find(params[:id])
    @related_items = Item.where.not(id: @item.id).order(created_at: :desc).limit(4)
  end
end
