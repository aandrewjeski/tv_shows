require 'rails_helper'

feature 'user views a list of characters', %Q{
  As a site visitor
  I want to view a list of people's favorite TV characters
  So I can find wonky characters to watch
} do

#Acceptance Criteria:
#* I can see a list of all the characters
#* The character's name and the TV show it is associated with are listed

  scenario 'user views a list of characters' do
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO', years: '2011 -', synopsis: 'A battle for the iron throne.')

    character = Character.create(role: 'Tyrion Lanister', name: 'Peter Dinklage',
      description: 'Witty and provocative dwarf; uncle to King Tommen, first of his name.', television_show_id: show.id)

    visit '/characters'
    expect(page).to have_content character.role
    expect(page).to have_content show.title

  end
end


# tvshow = TelevisionShow.create(title: "Game of thrones")
# C1 = Charater.create(role: "blacdjfsaljk", actor: "dsfjdj", tevlevision_show_id: tvshow.id)


# visits '/characters'

# expect(page).to have_content
