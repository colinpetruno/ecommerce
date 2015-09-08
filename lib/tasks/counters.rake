namespace :counters do
  namespace :categories do
    desc "Refresh Categories Counter Cache"
    task :refresh => :environment do
      Category.find_each do |category|
        Category.reset_counters(category.id, :products)
      end
    end
  end
end
