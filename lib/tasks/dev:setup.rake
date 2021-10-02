namespace :dev do
    desc "Sets the development enviroment"
    task setup: :environment do
        if Rails.env.development?
            %x(rails db:drop)
            %x(rails db:create)
            %x(rails db:migrate)
        else
        puts "You are not in development enviroment!"
        end
    end
end
