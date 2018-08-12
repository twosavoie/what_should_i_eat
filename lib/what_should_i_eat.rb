require "what_should_i_eat/version"
require 'net/http'
require 'json'
require 'what_should_i_eat/printing'

module WhatShouldIEat
  def WhatShouldIEat.fresh
    result = Net::HTTP.get('www.edamam.com', '/search?type=Feeds')
    recipes = JSON.parse(result) #Parse the returned text as JSON and save it into a variable (?)
    recipe_name = recipes.first['items'].first['label'] #Pick out a recipe from the variable
    recipe_url = recipes.first['items'].first['url']
    #might be fun to have a random access of the Hash

    Printing.print recipe_name, recipe_url
    #puts "Why not have #{recipe_name}? Find it here: #{recipe_url}!" #Print that recipe to the screen (moved ot /print)
  end
end

#SK code retype if using
#require 'net/http'
#require 'json'

#module WhatShouldIEat (main diff between my code is object, needed for exe?)
#  def WhatShouldIEat.fresh  (is .fresh already method? I think it is invented)
#    result = Net::HTTP.get('www.edamam.com', '/search?type=Feeds')
#    recipes = JSON.parse(result)
#    name = recipes.first['items'].first['label']
#    url = recipes.first['items'].first['url']
#    puts name
#    puts url
#  end
#end
