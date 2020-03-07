require 'http'
require 'json'
# require './converter_data_hash.rb' #uncomment to call local hard code when off vpn
# install_id = 1003287 #works
# install_id = 1227028 #works
install_id = 1470852
response = HTTP.get("https://aurora-ordering.tesla.com/api/v1/installations/#{install_id}/geometry")

#converter_data returns the value from the :site key needed for .json file
converter_data = response.parse[0]["site"]

# replace all `null` with `[]`
converter_data = converter_data.to_s
converter_data = converter_data.gsub("nil", "[]")
converter_data = JSON.parse converter_data.gsub('=>', ':')
final = converter_data.to_json 
# final = @converter_data.to_json #uncomment to call local hard code when off vpn from converter_data_hash.rb

file = File.open("C:/Users/rwaszak/Desktop/Dev/aurora_grab/aurora_install_id_#{install_id}.json", "w"){
  |file| file.puts final} 



#https://stackoverflow.com/questions/32388756/replacing-all-null-occurence-in-ruby-string
#https://stackoverflow.com/questions/1895295/how-can-i-replace-every-instance-of-a-pattern-in-ruby
#https://stackoverflow.com/questions/1667630/how-do-i-convert-a-string-object-into-a-hash-object
#https://stackoverflow.com/questions/24543826/removing-backslash-escape-character-from-a-string#