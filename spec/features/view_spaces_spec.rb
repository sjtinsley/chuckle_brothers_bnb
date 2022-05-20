feature "view spaces" do
  before(:each) { DatabaseConnection.setup.query("INSERT INTO users (id, username, email, password)
    VALUES($1, $2, $3, $4);", 
    [1, 'username', 'email', 'encrypted_pass']) }

  scenario "user can see the available spaces" do
    Space.create(
      name: 'name', 
      description: 'description', 
      price: 4, 
      user_id: 1,         
      available_from: '2022-05-20', 
      available_to: '2022-06-10')
    visit("/spaces")
    
    expect(page).to have_content('name')
   
    
  end
end