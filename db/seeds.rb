
# 100.times do
#   @post = Post.create(
#     :title => Faker::Commerce.product_name,
#     :email => Faker::Internet.email,
#     :price => Faker::Commerce.price,
#     :description => Faker::Lorem.paragraph
#     )
# end


10.times do
  @category = Category.create(
    :name => Faker::Commerce.department(1),
    )
end

category_id_array = []
Category.all.each do |category|
  category_id_array << category.id
end

100.times do
  @post = Post.create(
    :title => Faker::Commerce.product_name,
    :email => Faker::Internet.email,
    :price => Faker::Commerce.price,
    :description => Faker::Lorem.paragraph,
    :category_id => category_id_array.sample
    )
end

