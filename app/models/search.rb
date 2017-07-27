class Search < ApplicationRecord

	def search_books
		@books ||= find_books
    end

    private

    def find_books
    	books = Book.order(:name)
		books = books.where(["name LIKE ?", "%#{keywords}%"]) if keywords.present?
	    books = books.where(category_id: category_id) if category_id.present?
	    books = books.where(["isbn LIKE ?", isbn]) if isbn.present?

	    return books
	end
end
