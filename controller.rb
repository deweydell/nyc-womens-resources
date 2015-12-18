require_relative 'listing'
require_relative 'View_class'

class Controller
  CATEGORY_CODES = [["Aging", "aging"],
  ["Anti-Discrimination/HR", "anti_discrimination_human_rights"],
  ["Arts", "anti_discrimination_human_rights"],
  ["Business", "business"],
  ["Childcare and parent", "child_care_parent_information"],
  ["Community Service/Volunteer", "community_service_volunteerism"],
  ["Counseling", "counseling_support_groups"],
  ["Disability", " disabilities"],
  ["Domestic Violence", "domestic_violence"],
  ["education", "education"],
  ["Employment", "employment_job_training"],
  ["Health", "health"],
  ["Homelessness", "homelessness"],
  ["Housing", "housing"],
  ["Immigration", "immigration"],
  ["Legal Services", "legal_services"],
  ["LGBT", "lesbian_gay_bisexual_and_or_transgender"],
  ["Personal Finance", "personal_finance_financial_education"],
  ["Professional Association", "professional_association"],
  ["Veterans", "veterans_military_families"],
  ["Victim Services", "victim_services"],
  ["Women's Groups", "women_s_groups"],
  ["Youth Services", "youth_services"]]

  BOROUGHS = ["bronx", "brooklyn", "manhattan", "queens", "staten_island"]

  attr_accessor :category_index
  attr_reader :viewer

  def initialize
    @viewer = View.new
    @category_index = 0
    main_runner
  end

  def main_runner
    viewer.welcome_message
    user_index_choice = self.get_category_from_user
    # do something with that number
    puts "THE NUMBER THAT THE USER CHOSE WAS: #{user_index_choice}"
  end


  def get_category_from_user
    viewer.search_prompt(CATEGORY_CODES) - 1
  end

  def build_listing_objects(category_code)
    response = open("http://data.cityofnewyork.us/resource/pqg4-dm6b.json?#{category_code}=Y")
    JSON.parse(response.read).map { |listing_hash| Listing.new(listing_hash)}
  end

  def find_listings_by_location(listings_array, borough_number)
    listings_array.select { |listing| listing.borough.include?(BOROUGHS[borough_number]) }
  end
end
