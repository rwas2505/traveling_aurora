require 'http'
require 'json'
# require './converter_data_hash.rb' #uncomment to call local hard code when off vpn

#input coming from user form in excel wkbk via shell function
vba_input = ARGV
job_number = vba_input[0]
first_three = job_number[0..2]
install_id = vba_input[1]
file_path = "//triton/jobs/#{first_three}/#{job_number}/Audit/sample.txt"

#get aurora api data based on user input install id
response = HTTP.get("https://aurora-ordering.tesla.com/api/v1/installations/#{install_id}/geometry")

#converter_data returns the value from the :site key needed for .json file
converter_data = response.parse[0]["site"]

# replace all `null` with `[]`
converter_data = converter_data.to_s
converter_data = converter_data.gsub("nil", "[]")
converter_data = JSON.parse converter_data.gsub('=>', ':')
final = converter_data.to_json 

#save locally 
# file = File.open("C:/Users/rwaszak/Desktop/Dev/aurora_grab/generated_jsons/aurora_install_id_#{install_id}.json", "w"){
# |file| file.puts final} 

#save locally with variable works
# sample_text = "jb: #{job_number}, first three: #{first_three}, install id: #{install_id}"
# local_path = "C:/Users/rwaszak/Desktop/Dev/aurora_grab/generated_jsons/sample.txt"
# file = File.open(local_path, "w"){
# |file| file.puts sample_text} 


#save to triton with no vars works!
# sample_text = "test2"
# file = File.open("//triton/jobs/#{first_three}/#{job_number}/Audit/sample.txt", "w"){
# |file| file.puts sample_text} 


#save to triton with  vars works!
# sample_text = "test2"
# file_path = "//triton/jobs/#{first_three}/#{job_number}/Audit/sample.txt"
file = File.open(file_path, "w"){
|file| file.puts sample_text} 













