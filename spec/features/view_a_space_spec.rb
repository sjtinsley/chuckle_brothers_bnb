xfeature 'view a space' do
  scenario 'user can view a selected space' do
    space = Space.create(name: 'name', description: 'description', price: 4)
    visit("/spaces/#{space.id}")

    expect(page).to have_content('name')
    expect(page).to have_content('description')
    expect(page).to have_content(4)
  end
end