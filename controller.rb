require_relative 'View_class'

CATEGORY_CODES = [["Aging", "aging"],
["Anti-Discrimination/HR", "anti_discrimination_human_rights"],
["Arts", "anti_discrimination_human_rights"],
["Business", "business"],
["Childcare and parent", "child_care_parent_information"],
[["Community Service/Volunteer", "community_service_volunteerism"],],
["Counseling", "counseling_support_groups"],
["Disability", " disabilities"],
["Domestic Violence", "domestic_violence"],
["education", "education"],
["Employment", "employment_job_training"],
["Health", "health"]
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

# CATEGORY_CODES[user_input.to_i][1]

# build_query()

def build_query(category_code)
  response = open("http://data.cityofnewyork.us/resource/pqg4-dm6b.json?#{category_code}=Y")
  JSON.parse(response.read)
end
#this method will return the array of hash data in the specific category
