require 'rspec'
require 'rspec/core/rake_task'
require 'yaml'
require 'hash_deep_merge'
require 'fileutils'
require 'json'
require 'logger'
require 'selenium-webdriver'

require_relative 'models/deployment'
require_relative 'config/config'
require_relative 'config/config_core'

require_relative 'logging'
require_relative 'config/web_driver_manager'
require_relative 'config/test_config'

require_relative 'models/data/collection_space_data'
require_relative 'models/data/core/core_authorities/core_authority_data'
require_relative 'models/data/core/core_authorities/core_org_data'
require_relative 'models/data/core/core_objects/core_object_data'
require_relative 'models/data/core/core_procedures/core_acquisition_data'
require_relative 'models/data/core/core_procedures/core_exhibition_data'
require_relative 'models/data/core/core_procedures/core_inventory_movement_data'
require_relative 'models/data/core/core_procedures/core_use_of_collections_data'
require_relative 'models/user_role'
require_relative 'models/user'
require_relative 'models/data/core/core_tools/core_invocables_data.rb'

require_relative 'pages/page'
require_relative 'pages/collection_space_pages'
require_relative 'pages/core/core_pages'
require_relative 'pages/core/core_sidebar'
require_relative 'pages/core/core_login_page'
require_relative 'pages/core/core_search/core_search_acquisitions_form'
require_relative 'pages/core/core_search/core_search_objects_form'
require_relative 'pages/core/core_search/core_search_page'
require_relative 'pages/core/core_search/core_search_results_page'
require_relative 'pages/core/core_create_new_page'
require_relative 'pages/core/core_authorities/core_authority_page'
require_relative 'pages/core/core_authorities/core_organization_info_form'
require_relative 'pages/core/core_authorities/core_organization_page'
require_relative 'pages/core/core_objects/core_object_id_info_form'
require_relative 'pages/core/core_objects/core_object_page'
require_relative 'pages/core/core_procedures/core_acquisition_info_form'
require_relative 'pages/core/core_procedures/core_acquisition_page'
require_relative 'pages/core/core_procedures/core_exhibition_info_form'
require_relative 'pages/core/core_procedures/core_exhibition_page'
require_relative 'pages/core/core_procedures/core_inventory_movement_info_form'
require_relative 'pages/core/core_procedures/core_inventory_movement_page'
require_relative 'pages/core/core_procedures/core_use_of_collections_info_form'
require_relative 'pages/core/core_procedures/core_use_of_collections_page'
require_relative 'pages/core/core_tools/core_tools_page'
require_relative 'pages/core/core_tools/core_invocables_page'

Dir.glob("config/config_*").each { |file| require_relative file if file.include? '.rb' }

%w(bampfa botgarden cinefiles core_ucb pahma ucjeps).each do |deployment|
  Dir.glob("models/data/#{deployment}/*").each { |file| require_relative file if file.include? '.rb' }
  Dir.glob("models/data/#{deployment}/#{deployment}_authorities/*").each { |file| require_relative file if file.include? '.rb' }
  Dir.glob("models/data/#{deployment}/#{deployment}_objects/*").each { |file| require_relative file if file.include? '.rb' }
  Dir.glob("models/data/#{deployment}/#{deployment}_procedures/*").each { |file| require_relative file if file.include? '.rb' }
  Dir.glob("models/data/#{deployment}/#{deployment}_tools/*").each { |file| require_relative file if file.include? '.rb' }

  Dir.glob("pages/#{deployment}/*").each { |file| require_relative file if file.include? '.rb' }
  Dir.glob("pages/#{deployment}/#{deployment}_authorities/*form.rb").each { |file| require_relative file }
  Dir.glob("pages/#{deployment}/#{deployment}_authorities/*page.rb").each { |file| require_relative file }
  Dir.glob("pages/#{deployment}/#{deployment}_objects/*form.rb").each { |file| require_relative file }
  Dir.glob("pages/#{deployment}/#{deployment}_objects/*page.rb").each { |file| require_relative file }
  Dir.glob("pages/#{deployment}/#{deployment}_procedures/*form.rb").each { |file| require_relative file }
  Dir.glob("pages/#{deployment}/#{deployment}_procedures/*page.rb").each { |file| require_relative file }
  Dir.glob("pages/#{deployment}/#{deployment}_search/*form.rb").each { |file| require_relative file }
  Dir.glob("pages/#{deployment}/#{deployment}_search/*page.rb").each { |file| require_relative file }
  Dir.glob("pages/#{deployment}/#{deployment}_tools/*form.rb").each { |file| require_relative file }
  Dir.glob("pages/#{deployment}/#{deployment}_tools/*page.rb").each { |file| require_relative file }
end
