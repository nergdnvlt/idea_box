require 'rails_helper'

describe 'A user navigates the site' do
  describe 'they visit the idea#show page' do
    it 'and want to create a new idea' do
      idea1 = Idea.create!(title: 'Uno', body: 'What an idea')

      visit idea_path(idea1)

      click_link 'New Idea'

      fill_in 'idea[title]', with: 'Whoa'
      fill_in 'idea[body]', with: 'Yay an idea'
      click_on 'Submit'

      expect(current_path).to eq(idea_path(Idea.all.last))
      expect(page).to have_content('Whoa')
      expect(page).to have_content('Yay an idea')
    end
  end

  # describe 'they visit the ideas#index page' do
  #   it 'and want to link to an existing idea' do
  #     idea1 = Idea.create!(title: 'Uno', body: 'What an idea')
  #     idea2 = Idea.create!(title: 'Dos', body: 'Titanic')
  #     idea3 = Idea.create!(title: 'Tres', body: 'bob thunder')
  #
  #     visit idea_path(idea1)
  #
  #     click_link 'Delete'
  #
  #     expect(current_path).to eq(ideas_path)
  #     expect(page).to_not have_content(idea1.title)
  #     expect(page).to_not have_content(idea1.body)
  #     expect(page).to have_content(idea2.title)
  #     expect(page).to have_content(idea2.body)
  #     expect(page).to have_content(idea3.title)
  #     expect(page).to have_content(idea3.body)
  #   end
  # end
end