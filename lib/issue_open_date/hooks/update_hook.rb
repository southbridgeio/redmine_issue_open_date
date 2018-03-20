module RedmineIssueOpenDate
  module Hooks
    class UpdateHook < Redmine::Hook::ViewListener
      def controller_issues_edit_before_save(context = {})
        context[:issue].assign_attributes(context[:params].slice(:open_date))
      end
    end
  end
end
