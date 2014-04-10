module ApplicationHelper

  def pageTitle(title)
    base_title = "Ruby on Rails Demonstration Application"

    if title.empty?
      base_title
    else
      "#{base_title} | #{title}" # #{ } is essentially string concatenation for variables in ruby
    end
  end

end
