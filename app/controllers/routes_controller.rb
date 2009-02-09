class RoutesController < ApplicationController

  active_scaffold :routes do |config|
    config.label = "LCR Routes"
    config.columns = [:prefix, :from_uri, :grp_id, :priority]
    config.list.columns = [:prefix, :from_uri, :grp_id, :priority]
    
    config.columns[:grp_id].label = "Group ID"
  end

end
