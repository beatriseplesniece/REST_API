require 'rest-client'

def check_profile_info(user)
  response = API.get( 'http://195.13.194.180:8090/api/profile',
                                         headers: { 'Authorization' => user.auth_token },
                                         cookies:{})
  # Check if 200 OK is received
  assert_status_code(200, response, "Profile check")

  response_hash = JSON.parse(response)

  # Check if id is correct
  assert_equal(user.id, response_hash['id'], 'Ids dont match!')
  # Check if email is correct
  assert_equal(user.email, response_hash['email'], 'email is not correct')
  # Check if firstName is correct
  assert_equal(user.firstName, response_hash['firstName'], 'FirstName is not correct')
end
