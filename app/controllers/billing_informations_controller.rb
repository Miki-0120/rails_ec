class BillingInformationsController < ApplicationController
    
    def new
      @billing_information = BillingInformation.new
    end

    def show
      @billing_informations = set_cart.billing_informations
      @billing_information = billing_information.find(params[:id])

    end

    def create #テーブル内にcartと個人情報データを登録。データを保存してcart(もしくはcart_item)は削除する。フラッシュメッセージ表示。
      @billing_information = BillingInformation.new(billing_information_params)  
      billing_information[:cart_id] = set_cart.id
        ActiveRecord::Base.transaction do
        @billing_informations.save!
        @cart.destroy
        redirect_to root_path, notice: '購入ありがとうございます'
    end
  end

private

    def billing_information_params
      params.require(:billing_information).permit(:first_name :last_name :user_name :email :address :address_2 :country :state :zip :name_on_card :credit_card_number :expiration :cvv :cart_id)
    end
end
