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

  attr_reader :viewer

  def initialize
    @viewer = View.new
    main_runner
  end

  def final_results
    @final_results
  end

  def main_runner
    viewer.welcome_message
    viewer.category_prompt(CATEGORY_CODES)
    user_index_choice = viewer.get_input - 1
    listing_by_category = build_listing_objects(CATEGORY_CODES[user_index_choice][1])
    viewer.borough_prompt(BOROUGHS)
    user_burough_choice = viewer.get_input
    final_results = find_listings_by_location(listing_by_category, user_burough_choice)
    viewer.display_listing(final_results)
  end

  def build_listing_objects(category_code)
    response = open("http://data.cityofnewyork.us/resource/pqg4-dm6b.json?#{category_code}=Y")
    JSON.parse(response.read).map { |listing_hash| Listing.new(listing_hash)}
  end

  def find_listings_by_location(listings_array, borough_number)
    listings_array.select { |listing| listing.borough.include?(BOROUGHS[borough_number]) }
  end
end
