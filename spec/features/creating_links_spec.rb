# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature 'Creating links' do
  scenario 'I can submit links' do
    visit '/'
    click_button('Add another link')
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('tags', with: 'Bootcamp')
    click_button('Hey Presto!')
    within 'ul#links' do
      expect(page).to have_content('http://www.makersacademy.com')
    end
  end
end
