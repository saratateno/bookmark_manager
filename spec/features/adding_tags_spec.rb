feature 'Adding a tag' do
  # As a time-pressed user
  # So that I can organise my many links into different categories for ease of search
  # I would like to tag links in my bookmark manager

  scenario "I can add a tag to a new link" do
    visit "links/new"
    fill_in 'Name', with: 'BBC'
    fill_in 'url', with: 'http://bbc.co.uk'
    fill_in 'tags', with: 'News'
    click_button 'Add'

    link = Link.first
    expect(link.tags.map(&:name)).to include("News")
  end
end
