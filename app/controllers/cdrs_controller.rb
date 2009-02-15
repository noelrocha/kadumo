class CdrsController < ApplicationController

  active_scaffold :cdr do |config|
    config.label = "Cdrs"
    
    config.columns = [:start_time, :src_username, :src_domain, :dst_username, :dst_domain, :duration, :sip_call_id]
    config.columns[:sip_call_id].label = "SIP Call-ID"
            
    config.list.sorting = {:start_time => 'ASC'}
    config.actions = [:list, :show, :field_search]        
  end

end
