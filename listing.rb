class Listing
  BOROUGHS = ["brooklyn", "queens", "staten_island", "manhattan", "bronx"]
  attr_reader :name, :borough, :address, :phone, :url, :description

  def initialize(args = {})
    @name = args.fetch(:organizationname, "")
    @borough = parse_args_for_boroughs(args)
    @address = args.fetch(:location_1, "")
    @phone = args.fetch(:phone, "")
    @url = args.fetch(:url, "")
    @description = args.fetch(:description, "")
  end

  def parse_args_for_boroughs(args)
    args.select { |col, val| BOROUGHS.include?(col) && val == "Y" }.map { |col, val| col }
  end
end
