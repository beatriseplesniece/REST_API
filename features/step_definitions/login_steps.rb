Given(/^I have logged in as a regular user$/)do
  @user = User.new('bplesniece@mmail.com','parole123')
  login_positive(@user)
end

Given(/^I try to log in using an invalid password$/) do
  @user = User.new('bplesniece@mmail.com','parole12')
  login_wrong_password(@user)
end

Given(/^I check if I am not logged in$/) do
 check_if_user_not_logged_in(@user)
end