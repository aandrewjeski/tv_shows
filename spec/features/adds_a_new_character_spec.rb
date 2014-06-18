require 'rails_helper'

feature 'user adds a new character', %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics
} do

  # Acceptance Criteria:
  # * I can access a form to add a character on a TV show's page
  # * I must specify the character's name and the actor's name
  # * I can optionally provide a description
  # * If I do not provide the required information, I receive an error message
  # * If the character already exists in the database, I receive an error message

  scenario 'user adds a new TV show' do
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO' )

    attrs = {
      role: 'Tyrion Lanister',
      name: 'Peter Dinklage',
      description: 'Witty and provocative dwarf; uncle to King Tommen, first of his name.',
      television_show_id: '1'
    }

    character = Character.new(attrs)

    #show = TelevisionShow.create(title: 'Game of Thrones',
      #network: 'HBO' )

    visit "/television_shows/#{show.id}"
    fill_in 'Role', with: character.role
    fill_in 'Name', with: character.name
    fill_in 'Description', with: character.description
    click_on 'Submit'

    expect(page).to have_content 'Success'
    expect(page).to have_content character.role
    expect(page).to have_content character.name
  end

  scenario 'user cannot add a character that is already in the database' do
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO' )

    attrs = {
      role: 'Tyrion Lanister',
      name:  'Peter Dinklage',
      description: 'Witty and provocative dwarf; uncle to King Tommen, first of his name.',
      television_show_id: '1'
    }

    character = Character.create(attrs)

    visit "/television_shows/#{show.id}"
    fill_in 'Role', with: character.role
    fill_in 'Name', with: character.name
    fill_in 'Description', with: character.description
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "has already been taken"
  end

end
