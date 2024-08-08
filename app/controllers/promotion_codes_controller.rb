# frozen_string_literal: true

class PromotionCodesController < ApplicationController
  def discount
    code = PromotionCode.find_by(code: params[:promotion_code][:code])

    if code&.usable?
      session[:register_code] = params[:promotion_code][:code]
      code.usable = false
      code.save
      redirect_to request.referer, notice: 'プロモーションコードによる割引を適用しました'
    else
      redirect_to request.referer, alert: 'このプロモーションコードは使用できません'
    end
  end
end
