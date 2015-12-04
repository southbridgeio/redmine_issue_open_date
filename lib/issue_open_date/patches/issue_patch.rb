module IssueOpenDate
  module IssuePatch
    def self.included(base) # :nodoc:
      base.class_eval do
        unloadable

        safe_attributes 'open_date',
                        if: lambda { |issue, user| user.allowed_to?(:edit_issues, issue.project) }

      end
    end

  end
end
Issue.send(:include, IssueOpenDate::IssuePatch)
