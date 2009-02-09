class GatewaysController < ApplicationController
  active_scaffold :gateways do |config|
    config.label = "LCR Gateways"
    config.columns = [:gw_name, :ip_addr, :port, :grp_id, :uri_scheme, :transport, :strip, :tag, :flags]
    config.list.columns = [:gw_name, :ip_address, :port, :grp_id]
    
    config.columns[:gw_name].label = "Name"
    config.columns[:ip_addr].label = "Ip Address"
    config.columns[:grp_id].label = "Group ID"
    
    config.columns[:uri_scheme].form_ui = :select
    config.columns[:uri_scheme].options = {'SIP' => 1, 'SIPs' => 2}

    config.columns[:transport].form_ui = :select
    config.columns[:transport].options = {'UDP' => 1, 'TCP' => 2, 'TLS' => 3}
  end
end
