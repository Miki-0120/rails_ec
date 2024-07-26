# frozen_string_literal: true

namespace :promotion_code do
  desc 'プロモーションコードを１０個作成します'
  task generate: :environment do
    ApplicationRecord.transaction do
      10.times do |i|
        code = [*'a'..'z', *'A'..'Z', *0..9].sample(7).join
        promotion_code = rand(100..1000)
        PromotionCode.create(code:, promotion_code:, usable: true)
      end
    end
  end
end
