class View
  attr_accessor :category_to_search

  require 'pry'

  def welcome_message
    print "Welcome to NYC Women's Resource Finder"
  end

  def search_prompt(categories)
    print "What Category number would you like to search? \n"
    counter = 1
      categories.each do |category_array|
          print "#{counter}: #{category_array[0]} \n"
          counter += 1
      end
    category_to_search = gets.chomp.to_i
    if !category_to_search.is_a?(Integer)
      raise ArgumentError.new("Please select a number \n")
      search_prompt
    end
  end

  def convert_to_index(category_to_search) #move to controller
    category_to_search -= 1
  end
end

