def timer(&block)
  started = Time.now
  block.call
  finished = Time.now
  puts "#{finished - started}"
end

namespace :pricer do
  task :memory => :environment do
    timer { Pricers::Memory.new.run }
  end

  task :joins => :environment do
    timer { Pricers::Join.new.run }
  end

  task :views => :environment do
    timer { Pricers::View.new.run }
  end
end
