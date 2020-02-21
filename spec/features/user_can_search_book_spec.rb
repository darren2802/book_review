require 'rails_helper'

describe 'As a user I can enter a book title in the search form' do
  describe 'I can see various information about the book' do
    it 'shows the title, author, genres and any reviews for the book' do
      visit root_path
      expect(current_path).to eq(root_path)

      fill_in :title, with: 'Normal People'
      click_button 'Find Book'

      expect(current_path).to eq(search_path)

      within '.book-details' do
        expect(page).to have_content('Title: Normal People')
        within '#book-authors' do
          expect(page).to have_content('Author(s):')
          expect(page).to have_content('Sally Rooney')
        end
        within '#book-genres' do
          expect(page).to have_content('Genre(s):')
          expect(page).to have_content('No genres found for this book')
        end
      end

      within '.book-reviews' do
        expect(page).to have_content('Reviews:')
        expect(page).to have_content('Rooney’s second novel tracks two gifted but troubled teenagers across four years of friendship and occasional romance.')
        expect(page).to have_content("Like “Conversations With Friends,” “Normal People” also traces a young romance in Ireland.")
      end
    end
  end
end


# As a user
# When I visit "/"
# And I input "the man who saw everything" into the form
# (Note: Use the existing search form)
# And I click "Find Book"
# Then I should be on page "/search"
# Then I should see the book's info
# For that book I should see
# - Title
# - Author
# - Genres
# (Note: genres is referred to as "subjects" in the book search response)
# I should also see:
# - This book has 2 reviews from the New York Times
#   (Note: reviews are the "summary" in the book review response)
# - Review 1: ""The Man Who Saw Everything,"" which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at "authoritarian old men.""
# Review Publication Date: 2019-10-09
# - Review 2: "Deborah Levy's latest novel, "The Man Who Saw Everything," experiments with time travel, history and the endless complications of love."
# Review Publication Date: 2019-10-15
