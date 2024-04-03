desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  if Rails.env.development?
    User.destroy_all
    Facility.destroy_all
    Product.destroy_all
    Folder.destroy_all
    Purchase.destroy_all
    Item.destroy_all
    Comment.destroy_all
  end

  p "Creating sample data."
  
  names = ["bob", "alice", "sandra", "steve", "gerry", "jenny"]
  names.each do |name|
    user = User.new
    user.first_name = name.capitalize
    user.last_name = Faker::Name.last_name
    user.email = "#{name}@example.com"
    user.password = "password"
    user.supervisor = Faker::Boolean.boolean
    user.save
  end

  3.times do 
    facility = Facility.new
    facility.name = Faker::University.name
    facility.address = Faker::Address.full_address
    facility.save
  end

  5.times do
    product = Product.new
    product.image_url = "some_image.url"
    product.name = Faker::Sport.sport
    product.description = Faker::Marketing.buzzwords
    product.save
  end

  5.times do 
    folder = Folder.new
    folder.name = Faker::Company.industry
    folder.save
  end 

  10.times do 
    purchase = Purchase.new
    purchase.receipt = "an_image.url"
    purchase.user_id = User.pluck(:id).sample
    purchase.save
  end

  12.times do 
    item = Item.new
    item.facility_id = Facility.pluck(:id).sample
    item.product_id = Product.pluck(:id).sample
    item.purchase_id = Purchase.pluck(:id).sample
    item.folder_id = Folder.pluck(:id).sample
    item.status = Faker::Boolean.boolean
    item.save
  end

  10.times do 
    comment = Comment.new
    comment.body = Faker::Quote.famous_last_words
    comment.user_id = User.pluck(:id).sample
    comment.item_id = Item.pluck(:id).sample
    comment.save
  end
  p "Added #{User.count} users to the database."
  p "Added #{Facility.count} facilities to the database."
  p "Added #{Product.count} products to the database."
  p "Added #{Folder.count} folders to the database."
  p "Added #{Purchase.count} purchases to the database."
  p "Added #{Item.count} items to the database."
  p "Added #{Comment.count} comments to the database."
end
