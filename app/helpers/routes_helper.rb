module RoutesHelper
  
  def prefix_column(route)
    route.prefix.nil? ? '(blank)' : route.prefix
  end  
  
end
