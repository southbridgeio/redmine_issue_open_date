FileUtils.mkdir_p(Rails.root.join('log/issue_open_date')) unless Dir.exist?(Rails.root.join('log/issue_open_date'))

require 'redmine'
require_dependency File.dirname(__FILE__) + '/lib/issue_open_date/hook_listener'
require_dependency File.dirname(__FILE__) + '/lib/issue_open_date/patches/issue_patch'
require_dependency File.dirname(__FILE__) + '/lib/issue_open_date/patches/user_patch'

workers_path = File.dirname(__FILE__) + "/app/workers"
ActiveSupport::Dependencies.autoload_paths += [workers_path]
Rails.application.config.eager_load_paths += [workers_path]

Redmine::Plugin.register :redmine_issue_open_date do
  name 'Redmine Issue Open Date plugin'
  url 'https://github.com/southbridgeio/redmine_issue_open_date'
  description 'This is a plugin for Redmine which open freezed issues with specified oped date'
  version '0.3.0'
  author 'Southbridge'
  author_url 'https://southbridge.io'
  settings(default: {
    'freezed_statuses' => [],
    'open_status' => []
                    },
           partial: 'settings/issue_open_date')

end
