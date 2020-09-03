require "docbase_report/aggregator"
require "thor"

module DocBaseReport
  class CLI < Thor
    desc "usage_report", "show usage report for your team"
    def weekly_report(target_date)
      summary = Aggregator.new.fetch_posts(target_date.ago(7.days), target_date)
      template = File.read(File.expand_path('../template/weekly_report.erb', __FILE__))
      puts ERB.new(template).result(binding)
    end

    desc "monthly_report", "show monthly report for your team"
    def monthly_report(target_month)
      summary = Aggregator.new.fetch_posts(target_date.beginning_of_month, target_date.end_of_month)
      template = File.read(File.expand_path('../template/monthly_report.erb', __FILE__))
      puts ERB.new(template).result(binding)
    end
  end
end