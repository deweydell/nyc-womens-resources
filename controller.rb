require_relative 'View_class'
require_relative 'listing'

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



def build_listing_objects(category_code)
  response = open("http://data.cityofnewyork.us/resource/pqg4-dm6b.json?#{category_code}=Y")
  JSON.parse(response.read).map { |listing_hash| Listing.new(listing_hash)}
end

def find_listings_by_location(listings_array, borough_number)
  listings_array.select { |listing| listing.borough.include?(BOROUGHS[borough_number]) }
end
