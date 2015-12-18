class View
  attr_accessor :category_to_search

  def welcome_message
    print "Welcome to NYC Women's Resource Finder"
  end

  def search_prompt
    print "What Category would you like to search? \n"
      CATEGORY_CODES.each do |category_array|
          print "#{category_array[0]} \n"
      end
    category_to_search = gets.chomp
  end

end
