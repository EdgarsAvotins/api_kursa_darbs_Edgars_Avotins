require 'json'
module ReporterHelper
  def self.get_pass_percentage(report_hash)
    @passed = 0
    @failed = 0
    @total = 0
    report_hash.each do |scenarios|
      scenario_failed = false
      scenario = scenarios['elements'][0]
      scenario['steps'].each do |step|
        if step['result']['status'] != 'passed'
          @failed += 1
          @total += 1
          scenario_failed = true
        end
        break if scenario_failed
      end
      next if scenario_failed
      @passed += 1
      @total += 1
    end
    passed = @passed.to_f
    failed = @failed.to_f
    return (passed / (passed + failed)) * 100.00
  end

  def self.get_passed_count
    @passed
  end

  def self.get_failed_count
    @failed
  end

  def self.get_total_count
    @total
  end
end
# scenario['elements'][0]['steps'][0]['result']['status']
