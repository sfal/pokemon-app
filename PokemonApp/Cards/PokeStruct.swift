//
//  PokeStruct.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 05/11/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import Foundation

struct Pokemon {
    var name: String
    var type1: String
    var type2: String
    var sprite: String
    var stats: [String:String]
}

struct PickedPokemon {
    let name: String
    let type1: String
    let type2: String
    let sprite: String
    var stats: [String:String]
}
