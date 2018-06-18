require 'rest-client'
require 'securerandom'


def create_post(user, post)

  # creating dynamic content and title
  post.content = SecureRandom.hex
  post.title = SecureRandom.hex

  payload = {
      'title' => post.title,
      'content' => post.content
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/post',
                    headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                    cookies:{},
                    payload: payload)

  assert_status_code(200, response, "Post not created")
  response_hash = JSON.parse(response)

  # needs to save post id
  post.id = response_hash['id']
  p post.id
  p response_hash['title']
  p response_hash['content']

  # Check if id is correct
  assert_equal(post.id, response_hash['id'], 'Ids is not same')
  # Check if title is correct
  assert_equal(post.title, response_hash['title'], 'Title is not same')
  # Check if content is correct
  assert_equal(post.content, response_hash['content'], 'Content is not same')
end

def update_post(user, post)

  post.title = SecureRandom.hex

  # update only title
  payload = {
      'title' => post.title
  }.to_json

  response = API.put("http://195.13.194.180:8090/api/post?post_id=#{post.id}",
                     headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                     cookies:{},
                     payload: payload)

  assert_status_code(200, response, "Post is not updated")
  response_hash = JSON.parse(response)

  # Check if title is correct
  assert_equal(post.title, response_hash['title'], 'Title is not same')

  #post.title = response_hash['title']

  p response_hash['title']
  p response_hash['content']
end