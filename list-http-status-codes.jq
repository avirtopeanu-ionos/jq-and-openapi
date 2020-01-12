# 1 - Selects all properties of all responses
#--------------------------------------------
# It returns ["404", "200", "200", "x-example"]
[
  .paths[][].responses? # ? avoid getting an error if
                        # responses does not exist
  | keys? # ? avoid getting an error if . is not an
          # object and has no keys
  | .[] # [ ["404", "200"], ["200", "x-example"] ] ⤵️
      #                     ["404", "200", "200", "x-example"]
]
# 2 - Removes x- properties
#--------------------------
# It returns ["200", "404", "200"]
| map( # Applies a filter to each element
  select( # Keep elements for which what follows return true
    test("^x-") # Returns true if value match the regex parameter
    | not # Returns the opposite of a boolean value
  )
)