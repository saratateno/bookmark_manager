def add_link(title: 'Makers Academy', url: 'www.makers.com', tags: 'Bootcamp')
  visit '/links/new'
  fill_in('Title', with: title)
  fill_in('url', with: url)
  fill_in('Tags', with: tags)
  click_button 'Submit'
end
