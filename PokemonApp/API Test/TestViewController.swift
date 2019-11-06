//
//  TestViewController.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 31/10/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var myPokeName = ""
    var myFirstType = ""
    var mySecondType = ""
    var myPokeSprite = ""
    
    let randomInt = Int.random(in: 0..<807)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print("view loaded")

        getRandomPokemon(url: "") { (randomPokemon) in
            self.myPokeName = randomPokemon.name
            self.myFirstType = randomPokemon.type1
            self.mySecondType = randomPokemon.type2
            self.myPokeSprite = randomPokemon.sprite
            print("HERE'S YOUR POKEMON: \n NAME: \(self.myPokeName) \n TYPE-1: \(self.myFirstType) \n TYPE-2: \(self.mySecondType) \n SPRITE: \(self.myPokeSprite)")
        }
    }
}

//func getDetails(url: String, callback: @escaping (Pokemon) -> () ) {
//
//          var firstType = ""
//          var secondType = ""
//          var pokeSprite = ""
//
//      print("starting call")
//          let randomInt = Int.random(in: 0..<807)
//        // Set up the URL request
//      //  let todoEndpoint: String = "https://pokeapi.co/api/v2/pokemon/\(randomInt)"
//          let pokeAPI: String = "https://pokeapi.co/api/v2/pokemon/445"
//          print(pokeAPI)
//        guard let url = URL(string: pokeAPI) else {
//          print("Error: cannot create URL")
//          return
//        }
//        let urlRequest = URLRequest(url: url)
//
//        // set up the session
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//
//        // make the request
//        let task = session.dataTask(with: urlRequest) {
//          (data, response, error) in
//          // check for any errors
//          guard error == nil else {
//            print("error calling GET on /todos/1")
//            print(error!)
//            return
//          }
//          // make sure we got data
//          guard let responseData = data else {
//            print("Error: did not receive data")
//            return
//          }
//          // parse the result as JSON, since that's what the API provides
//          do {
//            guard let pokemon = try JSONSerialization.jsonObject(with: responseData, options: [])
//              as? [String: Any] else {
//                print("error trying to convert data to JSON")
//                return
//            }
//
//
//            guard let pokeName = pokemon["name"] as? String else {
//              print("Could not get Pokemon Name from JSON")
//              return
//            }
//
//              guard let types = pokemon["types"] as? AnyObject else {
//
//                print("Could not get Pokemon Type from JSON")
//                return
//              }
//              print(types)
//              for type in types as! [AnyObject] {
//                  let pokeTypes = type["type"] as? [String : String]
//                  let pokeSlot = type["slot"] as? Int
//
//
//                  switch pokeSlot {
//                  case 2:
//                      firstType = pokeTypes?["name"] ?? ""
//                  case 1:
//                      secondType = pokeTypes?["name"] ?? ""
//                  default:
//                      print("default")
//                  }
//
//              }
//
//              guard let sprites = pokemon["sprites"] else {
//                  print("Could not get Pokemon Sprite from JSON")
//                  return
//              }
//              let spritesDictionary = sprites as! NSDictionary
//              pokeSprite = (spritesDictionary["front_default"] as? String)!
//
//            let randomPokemon = Pokemon(name: pokeName, type1: firstType, type2: secondType, sprite: pokeSprite)
//            callback(randomPokemon)
//
//              } catch  {
//            print("error trying to convert data to JSON")
//            return
//          }
//        }
//
//        task.resume()
//  }

