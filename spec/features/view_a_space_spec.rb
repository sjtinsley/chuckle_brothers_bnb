feature 'view a space' do
  scenario 'user can view a selected space' do
    space = Space.create(name: 'name', description: 'description', price: 4)
    
    visit '/spaces'

    first('.space').click

    expect(page).to have_content('name')
    expect(page).to have_content('description')
    expect(page).to have_content(4)
  end
end