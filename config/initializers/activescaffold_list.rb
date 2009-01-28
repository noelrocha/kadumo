# module ActiveScaffold::Config
#   class List < Base
# 
#     alias_method :orig_initialize, :initialize
#     def initialize(core_config)
#       @core = core_config
# 
#       # inherit from global scope
#       # full configuration path is: defaults => global table => local table
#       @per_page = self.class.per_page
#       
#       # always_show_create
#       @always_show_create = self.class.always_show_create
# 
#       # originates here
#       @sorting = ActiveScaffold::DataStructures::Sorting.new(@core.columns)
#       @core.model.primary_key.each { |primary_key|
#         @sorting.add primary_key, 'ASC'
#       }
#       
#       # inherit from global scope
#       @empty_field_text = self.class.empty_field_text
#     end
#   end
# end