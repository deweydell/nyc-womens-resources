class Listing
  def initialize(args = {})
    @borough = parse_args_for_boroughs(args)
  end

  def parse_args_for_boroughs(args)
    boroughs = ["brooklyn", "queens", "staten_island", "manhattan", "bronx"]
    args.select { |col, val| boroughs.include?(col) && val == "Y"  }.map { |col, val| col }
  end
end
