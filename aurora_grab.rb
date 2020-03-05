converter_data = "This will be the json data"

file = File.open("/Users/ryan/Desktop/aurora_grab/testing.json", "w"){
  |file| file.puts converter_data}


####TODO

#1. Figure out how to make ruby script that
  #a. accepts install_id var
  #b. interpolates install_id var into aurora api url GET request
  #c. parses aurora api JSON data and saves the correct k,v pairs to var converter_data
  #d. create a new .json file in ruby
    #d.1 write the converter_data to the new .json file 
    #d.2 save the .json file to the jobs Audit folder
#2. Create UI for designer to input the installation ID. This should result in the script from #1 above creating, writing, and saving the .json to the correct folder for the designer 
  