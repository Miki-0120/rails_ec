namespace :promotion_code do
    desc 'プロモーションコードを１０個作成します'
    task :generate => :environment do
        begin
            ApplicationRecord.transaction do
                10.times do |i|
                promo_code = [ *'a'..'z', *'A'..'Z', *0..9].sample(7).join
                discount = rand(100..1000)
                Promotion_code.create(promo_code:, discount:, usable: true)
                end
            end
        end
    end
end
