module IssueOpenDate
  module Patches
    module IssuePatch
      def self.included(base)
        # :nodoc:
        base.class_eval do
          unloadable

          before_save :clear_open_date

          def open_date
            super.in_time_zone(User.current.time_zone) if super
          end

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
end
Issue.send(:include, IssueOpenDate::Patches::IssuePatch)
