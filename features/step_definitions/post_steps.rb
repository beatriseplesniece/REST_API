Then(/^I can create post$/) do
  @post = Post.new('title', 'content')
  puts @user.auth_token
  create_post(@user, @post)
end

Then(/^I can update post$/) do
  puts @user.auth_token
  puts @post.id
  puts @post.title
  update_post(@user, @post)
end

