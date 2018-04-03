require 'rails_helper'

describe 'A user wants to edit an idea' do
  describe 'so they visit the ideas#show page' do
    it 'and fill in the info and clicks submit' do
      cat1 = Category.create!(name: 'Brilliant')
      idea = cat1.ideas.create!(title: 'First', body: 'Whoo an idea')
      visit idea_path(idea)

      click_link 'Edit Idea'

      fill_in 'idea[title]', with: 'Whoa'
      fill_in 'idea[body]', with: 'Yay an idea'
      click_on 'Submit'

      expect(current_path).to eq(idea_path(Idea.all.last))
      expect(page).to have_content('Whoa')
      expect(page).to have_content('Yay an idea')
      expect(page).to_not have_content(idea.title)
      expect(page).to_not have_content(idea.body)
    end
  end

  describe 'so they visit the ideas#index' do
    it 'fills in the info and clicks submit' do
      cat1 = Category.create!(name: 'Brilliant')
      idea1 = cat1.ideas.create!(title: 'Uno', body: 'What an idea')
      cat1.ideas.create!(title: 'Dos', body: 'Titanic')
      cat1.ideas.create!(title: 'Tres', body: 'bob thunder')

      visit ideas_path

      within(".idea-#{idea1.id}") do
        find('.edit').click
      end

      fill_in 'idea[title]', with: 'Whoa'
      fill_in 'idea[body]', with: 'Yay an idea'
      click_on 'Submit'

      expect(current_path).to eq(idea_path(idea1))
      expect(page).to have_content('Whoa')
      expect(page).to have_content('Yay an idea')
      expect(page).to_not have_content(idea1.title)
      expect(page).to_not have_content(idea1.body)
    end
  end
end
