require_relative 'controller'
require 'pry'

test_controller = Controller.new


puts


#take the selected category number, take the element from the array @ 1,
#pass that element to build_query method


response = open("http://data.cityofnewyork.us/resource/pqg4-dm6b.json?youth_services=Y")
