class TrustedsController < ApplicationController

  active_scaffold :trusted do |config|
    config.label = "Trusted Requests"
    config.columns = [:src_ip, :proto, :from_pattern, :tag]
    config.columns[:src_ip].label = "Source IP"

    config.columns[:proto].label = "Protocol"
    config.columns[:proto].form_ui = :select
    config.columns[:proto].options = {'Any' => 'any', 'UDP' => 'udp', 'TCP' => 'tcp', 
                                      'TLS' => 'tls', 'SCTP' => 'sctp', 'None' => 'none'}
    
    list.sorting = {:src_ip => 'ASC'}
  end
  
end
