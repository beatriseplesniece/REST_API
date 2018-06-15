Then(/^I can create post$/) do
  puts @user.auth_token
  create_post(@user)
end