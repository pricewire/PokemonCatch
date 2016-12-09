//
//  CoreDataHelp.swift
//  PokemonCatch
//
//  Created by Mark Langlois on 12/9/16.
//  Copyright © 2016 Mark Langlois. All rights reserved.
//

import UIKit
import CoreData

func addAllPokemon() {
    
        createPokemon(name: "Mew", imageName: "mew")
        createPokemon(name: "Meowth", imageName: "meowth")
        createPokemon(name: "Caterpie", imageName: "caterpie")
        createPokemon(name: "Charmander", imageName: "charmander")
        createPokemon(name: "Eevee", imageName: "eevee")
        createPokemon(name: "Heart", imageName: "heart")
        createPokemon(name: "Insignia", imageName: "insignia")
        createPokemon(name: "Pidgey", imageName: "pidgey")
        createPokemon(name: "Rattata", imageName: "rattata")
        createPokemon(name: "Stardust", imageName: "stardust")
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
}

func createPokemon(name :String, imageName: String) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let pokemon = Pokemon(context: context)
    pokemon.name = name
    pokemon.imageName = imageName
}

func getAllPokemon() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
    let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        
        if pokemons.count == 0 {
        addAllPokemon()
        return getAllPokemon()
        }
        return pokemons
        } catch {}
    
    return[]
}

func getAllCaughtPokemons() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    fetchRequest.predicate = NSPredicate(format: "caught == %@", true as CVarArg)
    
    do {
    let pokemons = try context.fetch(fetchRequest) 
        return pokemons
    } catch {}
    
    return []
    
    
}

func getAllUncaughtPokemons() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
fetchRequest.predicate = NSPredicate(format: "caught == %@", false as CVarArg)

do {
    let pokemons = try context.fetch(fetchRequest)
    return pokemons
} catch {}

return []


}
