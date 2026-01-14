FileUtils.mkdir_p(Rails.root.join('log/issue_open_date')) unless Dir.exist?(Rails.root.join('log/issue_open_date'))

require 'redmine'

register_after_redmine_initialize_proc =
  if Redmine::VERSION::MAJOR >= 5
    Rails.application.config.public_method(:after_initialize)
  else
    reloader = defined?(ActiveSupport::Reloader) ? ActiveSupport::Reloader : ActionDispatch::Reloader
    reloader.public_method(:to_prepare)
  end

register_after_redmine_initialize_proc.call do
  require_relative 'lib/issue_open_date/hook_listener'
  require_relative 'lib/issue_open_date/patches/issue_patch'
  require_relative 'lib/issue_open_date/patches/user_patch'
end

workers_path = File.dirname(__FILE__) + "/app/workers"
ActiveSupport::Dependencies.autoload_paths += [workers_path]
Rails.application.config.eager_load_paths += [workers_path]

Redmine::Plugin.register :redmine_issue_open_date do
  name 'Redmine Issue Open Date plugin'
  url 'https://github.com/southbridgeio/redmine_issue_open_date'
  description 'This is a plugin for Redmine which open freezed issues with specified oped date'
  version '0.3.3'
  author 'Southbridge'
  author_url 'https://southbridge.io'
  settings(default: {
    'freezed_statuses' => [],
    'open_status' => []
                    },
           partial: 'settings/issue_open_date')

end
