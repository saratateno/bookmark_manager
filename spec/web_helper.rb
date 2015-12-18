def create_link_BBC
  visit "links/new"
  fill_in 'Name', with: 'BBC'
  fill_in 'url', with: 'http://bbc.co.uk'
  fill_in 'tags', with: 'bubbles'
  click_button 'Add'
end

def create_link_BBC_3_tags
  visit "links/new"
  fill_in 'Name', with: 'BBC'
  fill_in 'url', with: 'http://bbc.co.uk'
  fill_in 'tags', with: 'bubbles news media'
  click_button 'Add'
end

def add_user
  visit 'users/new'
  fill_in 'email', with: "username@email.com"
  fill_in 'password', with: "password"
  click_button 'Sign up!'
end
