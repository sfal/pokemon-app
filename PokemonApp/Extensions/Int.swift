//
//  Int.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 06/11/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import Foundation

extension Int: Sequence {
    public func makeIterator() -> CountableRange<Int>.Iterator {
        return (0..<self).makeIterator()
    }
}

