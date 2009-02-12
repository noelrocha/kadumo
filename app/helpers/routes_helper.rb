module RoutesHelper
  
  def prefix_column(route)
    route.prefix.nil? || route.prefix.strip == "" ? '(blank)' : route.prefix
  end  
  
end
