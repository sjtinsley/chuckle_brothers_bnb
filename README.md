# Chuckle Brothers BnB

## Contributors
-------

- [Farzan Imanzadeh](https://github.com/Farzan-I)
- [George Dainton](https://github.com/GeorgeDainton)
- [Luke Storey](https://github.com/lukestorey95)
- [Simon Tinsley](https://github.com/sjtinsley)

## Project Description
-------
First engineering group project during Week 5 of the Makers hybrid course, we were tasked with developing an [AirBnB]() clone, known as Chuckle Hotel BnB (name our own choice). Within a team of 4 developers we developed this version that we're proud to present.

## Demo
-------
### Home page
![home](public/images/home_page.png)

### Log in page
![log_in](public/images/log_in_page.png)

### Signed in/Spaces page
![signed_in/spaces](public/images/signed_in.png)

### Space 1 information page
![space1_info](public/images/space1_info.png)

### Requested a booking page
![thank_you_message](public/images/thanks_message.png)

### Host page
![host_page](public/images/host_page.png)

### Create space page
![create_space](public/images/create_space.png)

### Approve/Reject request page
![approve_reject](public/images/approve_reject.png)

### Accepting request page
![accepting_request](public/images/accepting_request.png)

### Rejecting request page
![rejecting_request](public/images/rejecting_request.png)

### Rejecting request page
![rejecting_request](public/images/rejecting_request.png)

### Log out success flash message on home page
![log_out_success](public/images/log_out_success.png)

### Error flash message on home page
![error_message](public/images/error_message.png)

## Technologies Used
------

- [Ruby](https://ruby-lang.org/en/) web framework.
- [Sinatra](https://sinatrarb.com/) creating web applications using Ruby.
- [PostgreSQL](https://www.postgresql.org/) to store our data.
- [Capybara](https://teamcapybara.github.io/capybara/) to test our framework.
- [Rubocop](https://rubocop.org/) for linting.
- [Rspec](https://rspec.info/) for testing our backend code.
- [CSS](https://www.w3.org/Style/CSS/Overview.en.html) for styling of the webpages.
- [Balsamiq](https://balsamiq.cloud/) for wireframing.
- [Trello](https://trello.com/en) for assigning tickets within the team.

## How to run locally
-------
### Set-up Project
1. Run `bundle`
2. Set-up database using `psql` in command line
3. Create database `chuckle_hotel` using `CREATE DATABASE`
4. Create spaces table using the instructions in the db/migrations folder
5. Repeat steps 3 and 4 for `chuckle_hotel_test` database

### Set-up Website
1. Type `rerun rackup` in project directory within command line to start the server
2. Open a browser window and type `localhost:9292` to access the home page

## Card wall
--------
We used a [Trello](https://trello.com/b/uYu4xPta/project-board) board to keep track of the features we want to implement. We organised tickets amongst the team and moved the tickets accordingly to demonstrate at what stage that feature's at (To do/In progress/In review etc.).

## Wireframes
-------
### Home page concept
![Wireframe 1](public/images/wire_log_in.png)
### View a space concept
![Wireframe 2](public/images/wire_view_spaces.png)
### Add a space concept
![Wireframe 3](public/images/wire_add_space.png)
### Add space details concept
![Wireframe 4](public/images/wire_update_avail.png)
### Host can accept/reject concept
![Wireframe 5](public/images/wire_acc_rej.png)
### User can request to book a space concept
![Wireframe 6](public/images/wire_book_space.png)
### Host can update space availability concept
![Wireframe 6](public/images/wire_host_space_avail.png)
### User can only book available dates concept
![Wireframe 6](public/images/wire_book_only_avail_dates.png)

## Team approach
---------
* Standups every morning at 10:00am
* Retro at 5:30pm every evening
* Pair programming throughout the entire project (driver/navigator roles)
* Regular check-ins with team members to make sure nobody was left behind
* Trello board for distributing work and staying on track

## User Stories
-------
### Login/out
```
As a user
So that I can interact with the website
I want to be able to log in
```
```
As a user
So that I can prevent anyone else from using my account
I want to be able to log out
```
```
As a host
So that I can list my space
I want to be able to create an account
```
```
As a guest
So that I can book a space
I want to be able to create an account
```

### Space functionality
```
As a host
So that I can allow my spaces to be booked
I want to be able to set a range of available dates
```
```
As a host
So that I can decide whether to allow users to book my space
I want to be able to approve or deny a booking request
```
```
As a host
So that I can list my space on the website
I want to fill in the details of my space and submit
```
```
As a guest,
So that I can stay the night in a space
I want to be able to send a booking request
```
```
As a user
So that I can decide whether to hire a space
I want to be able to see the details of the space
```
```
As a user
So that I can choose whether to hire a space
I want to be able to view the available spaces
```
```
As a user
So that I can list my own spaces
I want to be able to create a space from my own account
```

### User privacy
```
As a user
So that I can keep my password private
I want it to be hashed when it's stored with ChuckleH
```

## MVP
------
* User can sign up, log in and log out
* User can view an available space
* User can view an available space's details
* User can list a space
* User can request to hire a space

## Edge cases
-------
* Sign up with invalid input
* Sign in with invalid input
* Try to access spaces page when logged out

## Future improvements
--------
* User cannot sign up with an already used email
* Spaces can have a picture uploaded to them to show what a user can book
* User can only book available dates (user story below)
```
As a user
So I can only book available properties
I want to see an error message if the date I select is unavailable
```
* Host can update space availability (user story below)
```
As a host
So that I can change availability of my spaces
I want to be able to update availability after a space has been created
```
