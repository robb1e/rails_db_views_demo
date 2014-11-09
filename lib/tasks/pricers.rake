namespace :pricer do
  task :memory => :environment do
    Pricers::Memory.new.run
  end

  task :joins => :environment do
    Pricers::Join.new.run
  end

  task :views => :environment do
    Pricers::View.new.run
  end
end
