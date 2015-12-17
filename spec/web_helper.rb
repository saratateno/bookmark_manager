def create_link_BBC
  visit "links/new"
  fill_in 'Name', with: 'BBC'
  fill_in 'url', with: 'http://bbc.co.uk'
  fill_in 'tags', with: 'bubbles'
  click_button 'Add'
end
