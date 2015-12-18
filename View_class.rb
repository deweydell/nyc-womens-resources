class View

  def welcome_message
    print "Welcome to NYC Women's Resource Finder \n"
  end

  def category_prompt(categories)
    print "What Category number would you like to search? \n"
      categories.each_with_index do |category_array, index|
          print "#{index += 1}: #{category_array[0]} \n"
      end
  end

  def borough_prompt(boroughs)
    print "What borough number would you like to search in? \n"
    boroughs.each_with_index do |burough, index|
      print "#{index + 1}: #{burough} \n"
    end
  end

  def get_input
    gets.chomp.to_i
  end

  def display_listing(filtered_listings)
    filtered_listings[0..4].each do |listing_object|
      print "#{listing_object.name} \n"
      print "#{listing_object.description} \n \n"
    end
  end
end
