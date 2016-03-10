module IssueOpenDate
  module IssuePatch
    def self.included(base) # :nodoc:
      base.class_eval do
        unloadable

        safe_attributes 'open_date',
                        if: lambda { |issue, user| user.allowed_to?(:edit_issues, issue.project) }


        before_save :clear_open_date

        private

        def clear_open_date
          if self.open_date.present? and !self.closed?
            self.open_date = nil
          end
        end

      end
    end

  end
end
Issue.send(:include, IssueOpenDate::IssuePatch)
