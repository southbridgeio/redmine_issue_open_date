User.send(:include,
  Module.new do
    def self.included(base)
      (1..5).each { |i| base.send(:safe_attributes, "issue_open_time(#{i}i)") }
    end
  end
)

User.send(:prepend,
  Module.new do
    def issue_open_time
      time =
        begin
          tomorrow = Date.tomorrow
          super ? super.change(year: tomorrow.year, month: tomorrow.month, day: tomorrow.day) : tomorrow.to_time
        end
      time.in_time_zone(time_zone)
    end
  end
)
