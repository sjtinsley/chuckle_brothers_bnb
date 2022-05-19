feature 'view a space' do
  before(:each) { DatabaseConnection.setup.query("INSERT INTO users (id, username, email, password)
    VALUES($1, $2, $3, $4);", 
    [1, 'username', 'email', 'encrypted_pass']) }

  scenario 'user can view a selected space' do
    space = Space.create(
      name: 'name', 
      description: 'description', 
      price: 4, 
      user_id: 1,
      available_from: '2022-05-20', 
      available_to: '2022-06-10'
    )
    
    visit '/spaces'

    first('.space').click

    expect(page).to have_content('name')
    expect(page).to have_content('description')
    expect(page).to have_content(4)
  end
end