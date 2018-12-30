User.send(:include,
  Module.new do
    def self.included(base)
      (1..5).each { |i| base.send(:safe_attributes, "issue_open_time(#{i}i)") }
    end

    def suggested_issue_open_time
      time =
          begin
            tomorrow = Date.tomorrow
            issue_open_time ? issue_open_time.change(year: tomorrow.year, month: tomorrow.month, day: tomorrow.day) : tomorrow.to_time
          end
      time_zone ? time.to_datetime.change(offset: time_zone.formatted_offset) : time.to_datetime
    end
  end
)
