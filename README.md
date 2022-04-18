## Pokedex
###### -In Progress-  
## Description  
Pokedex website to train myself to work with a large database.  
## Actual features  
 - See all pokemons with name, pokedex number, types, image  
 - See details for a pokemon  
     - Actual infos : Name, pokedex number, types, weight, height, sprites, abilities, weaknesses, strengths, description, base exp, base stats.
 - Navigate through pokemons via the navbar with previous/next pokemon in pokedex
 - Search for a pokemon by name
     - Autocomplete when typing
 - Filter pokemons by types
### Problems 
 - When user press enter to search a pokemon it deletes the filters. So for now search with filters only works with ajax as long as the user doesn't press enter.
     - Possible solution : Pass the types params into the search form as an hidden input.

