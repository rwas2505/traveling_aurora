# Hey Brian,

# I am working on my Ruby script and as a reminder, all I have to do for the ruby portion is get data from an api, parse the data, and replace all values that == nil or null with an empty array `[]`. I then need to save this file as a .json.

# I verified the deliverable by manually copying the raw JSON data from the get request that I receive in chrome and pasting it into VS code. I then use cmd+D to replace all `nil` with `[]`. I then save the file as a .json and load it into our imagery converter and everything works fine.

# I am running into a snag when trying to accomplish this with a Ruby script because the GET request returns the json data with k,v pairs using hash rockets instead of colons. I have attached 3 files here and git rep. The converter_data_correct.json is the working file that I manually replaced `nil` with `[]`after copying the data directly from chrome and this file works with the imagery converter. 

#nils.rb is what converter_data returns in my code below. 

#converter_data_rocket.json is the result of replacing the nils with [] on converter_data. This is what I need but without the rockets!!

# I have been trying to figure out a way to replace `=>` with `:` but am having a lot of trouble. 

#So far

require 'http'
require 'json'

response = HTTP.get("https://aurora-ordering.tesla.com/api/v1/installations/913758/geometry")
converter_data = response.parse[0]["site"]

#In order to replace `nil` with `[]`, I converterd converter_data to a string

data_string = converter_data.to_s

#I then used gsub to replace all instances of `nil` with `[]`

updated = data_string.gsub("nil", "[]")

#To convert the string back to a hash/JSON data, I did some research and used the following 

updated = JSON.parse updated.gsub('=>', ':')

#This returns the exact collection of k,v pairs that I need, however it has hash rockets instead of colons. The returned data is saved to converter_data_rocket.json below and in the repo.

# I tried converting this to a string, then replacing `=>` with `:` and then converting back to JSON again but it resulted in hash rockets yet again:

updated = updated.to_s
updated = updated.gsub("=>", ":") #this does replace => with : , but I need to convert back out of a string
updated = JSON.parse updated.gsub('=>', ':') #converts from strin gto hash, but reverts to hash rockets again 
p updated

# I cannot figure out how to get my parsed data to look like the data in converter_data_correct.json for the life of me and also have not had luck online. I've included some relevant searches below for reference.


#https://stackoverflow.com/questions/32388756/replacing-all-null-occurence-in-ruby-string
#https://stackoverflow.com/questions/1895295/how-can-i-replace-every-instance-of-a-pattern-in-ruby
#https://stackoverflow.com/questions/1667630/how-do-i-convert-a-string-object-into-a-hash-object
#https://stackoverflow.com/questions/24543826/removing-backslash-escape-character-from-a-string#



