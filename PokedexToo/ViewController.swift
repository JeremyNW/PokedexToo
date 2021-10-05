//
//  ViewController.swift
//  PokedexToo
//
//  Created by Jeremy Warren on 10/3/21.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var pokeImageOutlet: UIImageView!
    @IBOutlet weak var pokeLabelOutlet: UILabel!
    @IBOutlet weak var pokeIdOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchBar.delegate = self
    }
    
}


extension ViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text?.lowercased() else {return}
        PokemonManager.fetchPokemon(withName: searchTerm) { pokemon in
            PokemonManager.fetchSprite(for: pokemon) { sprite in
                DispatchQueue.main.async {
                    self.pokeImageOutlet.image = sprite
                    self.pokeIdOutlet.text = "\(pokemon.num)"
                    self.pokeLabelOutlet.text = pokemon.name
                }
            }
        }
    }
}



