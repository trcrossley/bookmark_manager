require 'byebug'

feature 'Add tags' do
  scenario 'Adds a single tag to a link' do
    visit '/'
    click_button('Add another link')
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('tags', with: 'Bootcamp')
    click_button('Hey Presto!')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Bootcamp')
  end

  # As a time-pressed user
  # So that I can organise my links into different categories for ease of search
  # I would like to add tags to the links in my bookmark manager

  scenario 'Adds multiple tags to a new link' do
    visit '/links/new'
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('tags', with: 'Bootcamp school London')
    click_button('Hey Presto!')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Bootcamp', 'school', 'London')
  end

  # scenario 'Adds a tag to a link in the bookmark manager' do
  #   visit '/links'
  #   click_button('Add a tag')
  #   fill_in('tags', with: 'SUPERtag' )
  #   click_button('Hey Presto!')
  #   expect(link.tags.map(&:name)).to include('SUPERtag')
  # end
end
