require 'pry'
require 'open-uri'
require "JSON"

class Listing
  BOROUGHS = ["brooklyn", "queens", "staten_island", "manhattan", "bronx"]
  attr_reader :name, :borough, :address, :phone, :url, :description

  def initialize(args = {})
    @name = args.fetch("organizationname", " ")
    @borough = parse_args_for_boroughs(args)
    @phone = args.fetch("phone", " ")
    @url = args.fetch("url", " ")
    @description = args.fetch("description", " ")
  end

  def parse_args_for_boroughs(args)
    args.select { |col, val| BOROUGHS.include?(col) && val == "Y" }.map { |col, val| col }
  end
end

listings = open('http://data.cityofnewyork.us/resource/pqg4-dm6b.json?Aging=Y')
aging_listings = JSON.parse(listings.read)

p query = Listing.new(aging_listings.first)
