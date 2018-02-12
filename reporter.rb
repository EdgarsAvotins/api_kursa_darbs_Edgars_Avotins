require 'json'
require_relative 'features/support/api'
require_relative 'reporter_helper'
build_number = ARGV[0]

report = File.read('report.json')
report_hash = JSON.parse(report)
pass_percentage = ReporterHelper.get_pass_percentage(report_hash)
pass_percentage = "%.2f" % pass_percentage
passed_tests = ReporterHelper.get_passed_count
failed_tests = ReporterHelper.get_failed_count
total_tests = ReporterHelper.get_total_count

job_url = "http://jenkinsautomation.tdlbox.com/job/Kursa_darbs_Edgars_Avotins/job/Kursa_darba_Jenkins_Job_Edgars_Avotins/" + build_number.to_s + "/cucumber-html-reports/overview-features.html"
thumbnail = { 'url' => 'https://static3.fjcdn.com/comments/Blank+_1d84b9477b83b3ef2f5cc2e5d6829d9a.png' }

fields = []
fields.push({'name' => 'Build number', 'value' => "#{build_number}"})
fields.push({'name' => 'Build number', 'value' => "#{job_url}"})
fields.push({'name' => 'Passed scenario count', 'value' => passed_tests.to_s})
fields.push({'name' => 'Failed scenario count', 'value' => failed_tests.to_s})
fields.push({'name' => 'Total scenario count', 'value' => total_tests.to_s})
fields.push({'name' => 'Pass ratio', 'value' => "#{pass_percentage}%"})


embed = []
embed.push({ 'color' => 2210844,
             'fields' => fields,
             'thumbnail' => thumbnail })

payload = { 'content' => 'Edgars Avotins', 'embeds' => embed }.to_json
url = "https://discordapp.com/api/webhooks/393067525451022336/uz2WgUi_8-6oS9zy2Pu_3l_-CtQvabdSlgflF_ojyxTxWgxO_8Vdj0qBDMNixDj6wlT1"

@api = Api.new
@api.post(url, headers: {'Content-Type'=> 'application/json'}, payload: payload)
