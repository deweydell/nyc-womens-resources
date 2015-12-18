require 'pry'
require 'open-uri'
require "JSON"

class Listing
  BOROUGHS = ["bronx", "brooklyn", "manhattan", "queens", "staten_island"]
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
