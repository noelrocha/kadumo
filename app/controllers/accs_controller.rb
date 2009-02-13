class AccsController < ApplicationController

  active_scaffold :acc do |config|
    config.label = "Accounting"
    
    config.columns = [:time, :method, :src_user, :src_domain, :dst_user, :dst_domain, :callid, :sip_code]
    config.columns[:callid].label = "SIP Call-ID"
    config.columns[:sip_code].label = "SIP Reply Code"    
            
    config.list.sorting = {:time => 'ASC'}
    config.actions = [:list, :show, :search]            
  end

end
