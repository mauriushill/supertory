unless Rails.env.production?
  namespace :dev do
    desc "Drops, creates, migrates, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:sample_data"
    ]

    desc "Adds sample data for development environment"
    task sample_data: [
      :environment,
      "dev:add_users",
      "dev:add_facilities",
      "dev:add_products",
      "dev:add_folders",
      "dev:add_purchases",
      "dev:add_items",
      "dev:add_comments"
    ] do
      puts "done adding sample data"
    end
  
task add_users: :environment do
      puts "adding users..."

  names = ["bob", "alice", "sandra", "steve", "gerry", "jenny"]
  names.each do |name|
    user = User.create(
    first_name: name.capitalize,
    last_name: Faker::Name.last_name,
    email: "#{name}@example.com",
    password: "password",
    supervisor: Faker::Boolean.boolean)
  end
  puts "done"
end

task add_facilities: :environment do
  puts "adding facilities..."

  3.times do 
    facility = Facility.create(
    name: Faker::University.name,
    address: Faker::Address.full_address
    )
  end
  puts "done"
end

task add_products: :environment do
  puts "adding products..."

  5.times do
    product = Product.create(
    image_url: "some_image.url",
    name: Faker::Sport.sport,
    description: Faker::Marketing.buzzwords
    )
  end
  puts "done"
end

task add_folders: :environment do
  puts "adding folders..."

  5.times do 
    folder = Folder.create(
    name: Faker::Company.industry)
  end 
    puts "done"
  end

  task add_purchases: :environment do
    puts "adding purchases..."
  
  10.times do 
    purchase = Purchase.create(
    receipt: "an_image.url",
    user_id: User.all.sample.id
    )
  end
  puts "done"
end

task add_items: :environment do
  puts "adding items..."

  12.times do 
    item = Item.create(
    facility_id: Facility.all.sample.id,
    product_id: Product.all.sample.id,
    purchase_id: Purchase.all.sample.id,
    folder_id: Folder.all.sample.id,
    status: [0,1].sample
    )
  end
  puts "done"
end

task add_comments: :environment do
  puts "adding comments..."

  Item.all.each do |i|
  rand(5).times do |r|
    comment = Comment.create(
      item_id: i.id,
      user_id: User.all.sample.id,
      body: Faker::Quote.famous_last_words
    )
    end
  end
end
  puts "done"
  
  end
end

    
