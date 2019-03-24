module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def authors
    Author.all.alphabet
  end

  def publishers
    Publisher.all.alphabet
  end

  def categories
    Category.all.alphabet
  end
end
