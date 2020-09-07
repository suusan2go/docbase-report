require "docbase_report/aggregator"
require "active_support/core_ext/date/calculations"
require "active_support/core_ext/string/conversions"
require "thor"
require "erb"

module DocBaseReport
  class CLI < Thor
    desc "usage_report", "show usage report for your team"
    def weekly_report(target_date)
      summary = Aggregator.new.fetch_posts(target_date.ago(7.days), target_date)
      template = File.read(File.expand_path('../../template/weekly_report.erb', __FILE__))
      puts ERB.new(template).result(binding)
    end

    desc "monthly_report", "show monthly report for your team"
    def monthly_report(target_date_arg)
      target_date = target_date_arg.to_date
      summary = Aggregator.new.fetch_posts(
          target_date.beginning_of_month.to_s,
          target_date.end_of_month.to_s
      )
      template = File.read(File.expand_path('../../template/monthly_report.md.erb', __FILE__))
      puts ERB.new(template).result(binding)
    end
  end
end