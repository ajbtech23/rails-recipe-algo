require "json"
require "rest-client"

response = RestClient.get "https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata"
response_parsed = JSON.parse(response)

puts(response_parsed["meals"][0]["strMeal"])
puts(response_parsed["meals"][0]["strCategory"])
puts(response_parsed["meals"][0]["strArea"])
puts(response_parsed["meals"][0]["strInstructions"])


counter = 1
while counter < 21
  ingredient = response_parsed["meals"][0]["strIngredient#{counter}"].to_s
  if (ingredient != "" && ingredient != "null")
    puts("This is ingredient #{counter} and is: #{ingredient}")
  end
  counter = counter + 1
end
