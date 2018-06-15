require 'rest-client'
require 'securerandom'


def create_post(user)

  # creating dynamic content
  content = SecureRandom.hex
  #p content

  payload = {
      'title' => 'New post',
      'content' => content
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/post',
                    headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                    cookies:{},
                    payload: payload)

  assert_status_code(200, response, "Post not created")
  response_hash = JSON.parse(response)

  p response_hash['title']
  p response_hash['content']


  # Check if title is correct
  assert_equal('New post', response_hash['title'], 'Title is not same')
  # Check if content is correct
  assert_equal(content, response_hash['content'], 'Content is not same')

end