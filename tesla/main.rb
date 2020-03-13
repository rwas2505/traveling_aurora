require 'http'
require 'json'

#input coming from user form in excel wkbk via shell function
vba_input = ARGV
job_number = vba_input[0]
first_three = job_number[0..2]
install_id = vba_input[1]
file_path = "//triton/jobs/#{first_three}/#{job_number}/Audit/aurora_install_id_#{install_id}.json"

#get aurora api data based on user input install id
response = HTTP.get("https://aurora-ordering.tesla.com/api/v1/installations/#{install_id}/geometry")

#converter_data returns the value from the :site key needed for .json file
converter_data = response.parse[0]["site"]

# replace all `null` with `[]`
converter_data = converter_data.to_s
converter_data = converter_data.gsub("nil", "[]")
converter_data = JSON.parse converter_data.gsub('=>', ':')
final = converter_data.to_json 

#save to triton with  vars works!
file = File.open(file_path, "w"){
|file| file.puts final} 









