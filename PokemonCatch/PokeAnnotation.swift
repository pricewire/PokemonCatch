//
//  PokeAnnotation.swift
//  PokemonCatch
//
//  Created by Mark Langlois on 12/9/16.
//  Copyright © 2016 Mark Langlois. All rights reserved.
//

import UIKit
import MapKit

class PokeAnnotation : NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    init(coord: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coord
        self.pokemon = pokemon
        
    }
}

