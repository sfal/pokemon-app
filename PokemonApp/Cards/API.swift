//
//  API.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 05/11/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import Foundation

func getRandomPokemon(url: String, callback: @escaping (Pokemon) -> () ) {

        var firstType = ""
        var secondType = ""
        var pokeSprite = ""
    
        var pokeStats = ["HP": "", "Attack": "", "Defense": "", "Special-Attack": "", "Special-Defense": "", "Speed": ""]
      

    print("starting call")
        let randomInt = Int.random(in: 0..<807)
      // Set up the URL request
//        let pokeAPI: String = "https://pokeapi.co/api/v2/pokemon/445"
        let pokeAPI: String = "https://pokeapi.co/api/v2/pokemon/\(randomInt)"

        print(pokeAPI)
      guard let url = URL(string: pokeAPI) else {
        print("Error: cannot create URL")
        return
      }
      let urlRequest = URLRequest(url: url)

      // set up the session
      let config = URLSessionConfiguration.default
      let session = URLSession(configuration: config)

      // make the request
      let task = session.dataTask(with: urlRequest) {
        (data, response, error) in
        // check for any errors
        guard error == nil else {
          print("error calling GET on /todos/1")
          print(error!)
          return
        }
        // make sure we got data
        guard let responseData = data else {
          print("Error: did not receive data")
          return
        }
        // parse the result as JSON, since that's what the API provides
        do {
            // get pokemon
          guard let pokemon = try JSONSerialization.jsonObject(with: responseData, options: [])
            as? [String: Any] else {
              print("error trying to convert data to JSON")
              return
          }

            // get pokemon name
          guard let pokeName = pokemon["name"] as? String else {
            print("Could not get Pokemon Name from JSON")
            return
          }

            // get pokemon types
            guard let types = pokemon["types"] as? AnyObject else {

              print("Could not get Pokemon Type from JSON")
              return
            }
            for type in types as! [AnyObject] {
                let pokeTypes = type["type"] as? [String : String]
                let pokeSlot = type["slot"] as? Int


                switch pokeSlot {
                case 2:
                    secondType = pokeTypes?["name"] ?? ""
                case 1:
                    firstType = pokeTypes?["name"] ?? ""
                default:
                    print("default")
                }

            }
            
            // get pokemon sprite
            guard let sprites = pokemon["sprites"] else {
                print("Could not get Pokemon Sprite from JSON")
                return
            }
            let spritesDictionary = sprites as! NSDictionary
            pokeSprite = (spritesDictionary["front_default"] as? String)!
            
            // get pokemon stats
            guard let stats = pokemon["stats"] as? [NSDictionary] else {
                print("Could not get Pokemon Stats from JSON")
                return
            }

            for stat in stats as! [AnyObject] {
                let statsInfo = stat["stat"] as? [String : String]
                let statsName = statsInfo?["name"]
                var statsValue = stat["base_stat"]
                
                // convert NSNumber to String in order to add the value to the array
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .none
                let valueAsString = numberFormatter.string(from: statsValue as! NSNumber)
             

                switch statsName {
                case "hp":
                    pokeStats.updateValue(valueAsString!, forKey: "HP")
                case "attack":
                    pokeStats.updateValue(valueAsString!, forKey: "Attack")
                case "defense":
                    pokeStats.updateValue(valueAsString!, forKey: "Defense")
                case "special-attack":
                    pokeStats.updateValue(valueAsString!, forKey: "Special-Attack")
                case "special-defense":
                    pokeStats.updateValue(valueAsString!, forKey: "Special-Defense")
                case "speed":
                    pokeStats.updateValue(valueAsString!, forKey: "Speed")
                default:
                    print("default")
                }

            }
            
            let randomPokemon = Pokemon(name: pokeName, type1: firstType, type2: secondType, sprite: pokeSprite, stats: pokeStats)
            callback(randomPokemon)

            } catch  {
          print("error trying to convert data to JSON")
          return
        }
      }

      task.resume()
}
