
#install.packages("mongolite")
#devtools::install_github("jeroen/mongolite")

library(mongolite)

teste <- mongo(collection = "aula_bigdata")

teste$insert('{"firstName":"Paul",
              "lastName":"McCartney",
              "instrument":["Vocals","Bass"],
             "band":"Beatles"}')

teste$insert('{"firstName":"John",
    "lastName":"Lennon",
    "instrument":["Vocals", "Guitar"],
    "band":"Beatles"}')

teste$insert( c('{"firstName":"Ringo",
    "lastName":"Starr",
    "instrument":"Drums",
    "band":"Beatles"}'
    ,'{"firstName":"George",
    "lastName":"Harrison",
    "instrument":"Guitar",
    "band":"Beatles"}'))

teste$count()
teste$

teste$find("{}")
teste$find('{"instrument": "Guitar"}')

teste$remove('{}')

###### (Tutorial Completo: https://jeroen.github.io/mongolite/)

m <- mongo(collection = "diamonds")

# Insert test data
data(diamonds, package="ggplot2")
m$insert(diamonds)

# Check records
m$count()

# Perform a query and retrieve data
out <- m$find('{"cut" : "Premium", "price" : { "$lt" : 1000 } }')

test <- m$find(
  query = '{"cut" : "Premium", "price" : { "$lt" : 1000 } }', 
  fields = '{"cut" : true, "clarity" : true}',
  limit = 5
)

test

m$remove('{"cut" : "Premium"}')
m$count()

m$remove('{}')
m$count()
