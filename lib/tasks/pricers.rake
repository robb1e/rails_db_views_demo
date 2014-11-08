namespace :pricer do
  task :memory => :environment do
    Pricers::Memory.new.run
  end
end
