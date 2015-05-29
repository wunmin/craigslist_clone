get '/' do
  # Look in app/views/index.erb
  @categories = Category.order(:name)
  # erb :index
  # @categories = Category.all
  erb :index
end


get '/categories/:id' do
  @category = Category.find(params[:id])
  @posts = Post.where(category_id: @category.id).all
  erb :categories
end

get "/categories/:id/posts/:post_id" do
  @category = Category.find(params[:id])
  @post = Post.find(params[:post_id])
  erb :posts
end

get "/posts/new" do
  @category = Category.order(:name)
  erb :new_post
end

post "/posts" do
  cat = Category.where(name: params[:post_category])[0]
  @post = Post.create(title: params[:post_title], price: params[:post_price], email: params[:post_email], category_id: cat.id, description: params[:post_description])
  redirect to "/categories/#{cat.id}/posts/#{@post.id}"
end

get "/categories/:id/posts/:post_id/edit" do
  @categories = Category.all
  @post = Post.find(params[:post_id])
  @post_cat = Category.where(id: @post.category_id)[0]
  erb :edit_post
end

put "/categories/:category_id/posts/:post_id" do
  post = Post.find(params[:post_id])
  post.update_attributes(params["post"])
  redirect to "/categories/#{post.category.id}/posts/#{post.id}"
end

get "/posts/:id" do
end

delete "/post/:id" do
  post = Post.find(params[:post_id])
  post.destroy
end