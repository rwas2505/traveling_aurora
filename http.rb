require 'http'

response = HTTP.get("https://aurora-ordering.tesla.com/api/v1/installations/913758/geometry")


#converter_data returns the value from the :site key needed for the JSON.
# converter_data = response.parse[0]["site"]

# replace all `null` with `[]`


p converter_data_roofs = response.parse[0]["site"]["roofs"]
# converter_data_obstructions = response.parse[0]["site"]["obstructions"]



# p converter_data_roofs
# p converter_data_obstructions

# converter_data_obstructions.each{|hash|
#     hash.each{|k,v|
#         if v == nil
#             p v
#             v = "update"
#             p hash
#         end
#     }
# }


#the below code will delete the k,v pair if the value is nil. Need to check to see if deleting the k,v will still work in imagaery converter.
# p converter_data_obstructions.each{|hash|
#     hash.delete_if{|k,v|
#         v == nil
#     }
# }

# p converter_data_obstructions.each{|hash|
#     hash.delete_if{|k,v|
#         v == nil
#     }
# }




# converter_data.each{|k,v| 
#   p v
# }
























#doesn't work 


# data_string = converter_data.to_s

# data_string.gsub("null", "TRY THIS")

# p data_string





#https://stackoverflow.com/questions/32388756/replacing-all-null-occurence-in-ruby-string
#https://stackoverflow.com/questions/1895295/how-can-i-replace-every-instance-of-a-pattern-in-ruby