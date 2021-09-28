class ApplicationController < ActionController::Base
    def transaction(amount)
        ActiveRecord::Base.transaction do
            user_id.update!(balance: user_id.balance + amount)
            ted.update!(money: ted.balance - amount)
        end
    
        rescue ActiveRecord::RecordInvalid
            puts "Oops. We tried to do an invalid operation!"
        
    end

end

