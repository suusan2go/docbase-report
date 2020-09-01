require "docbase_report"
require "thor"

module DocBaseReport
  class CLI < Thor
    desc "usage_report", "show usage report for your team"
    def weekly_report(target_date)
      puts "not implemented"
    end

    desc "monthly_report", "show monthly report for your team"
    def monthly_report(target_month)
      puts "not implemented"
    end
  end
end