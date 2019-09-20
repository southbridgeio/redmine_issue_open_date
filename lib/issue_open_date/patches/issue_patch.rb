module IssueOpenDate
  module IssuePatch
    def self.included(base) # :nodoc:
      base.class_eval do
        unloadable

        before_save :clear_open_date

        safe_attributes :open_date

        def open_date
          super.in_time_zone(User.current.time_zone) if super
        end

        def open_date=(value)
          user = User.current
          return super unless value && user.logged? && user.time_zone
          super(value.to_datetime.change(offset: user.time_zone.formatted_offset))
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
Issue.send(:include, IssueOpenDate::IssuePatch)
