# frozen_string_literal: true

class PromotionCodesController < ApplicationController
  def discount
    promo_code = PromotionCode.find_by(promo_code: params[:promotion_code][:promo_code])

    if promo_code&.usable?
      session[:register_code] = params[:promotion_code][:promo_code]
      promo_code.usable = false
      promo_code.save
      redirect_to request.referer, notice: 'プロモーションコードによる割引を適用しました'
    else
      redirect_to request.referer, alert: 'このプロモーションコードは使用できません'
    end
  end
end
