//
//  CardsTableTableViewController.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 30/10/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import UIKit

class CardsTableTableViewController: UITableViewController {
    
    var myPokeName = ""
    var myFirstType = ""
    var mySecondType = ""
    var myPokeSprite = ""
    
    let cardsColors = [UIColor.init(named: "MainColor"), UIColor.init(named: "CardColor"), UIColor.init(named: "CardColorAlternative")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.init(named: "BackgroundColor")
        
        getDetails(url: "") { (randomPokemon) in
            self.myPokeName = randomPokemon.name
            self.myFirstType = randomPokemon.type1
            self.mySecondType = randomPokemon.type2
            self.myPokeSprite = randomPokemon.sprite
            print("HERE'S YOUR POKEMON: \n NAME: \(self.myPokeName) \n TYPE-1: \(self.myFirstType) \n TYPE-2: \(self.mySecondType) \n SPRITE: \(self.myPokeSprite)")
        }
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.init(named: "BackgroundColor")
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // this will turn on `masksToBounds` just before showing the cell
        cell.contentView.layer.masksToBounds = true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CardsTableViewCell
        cell.backgroundColor = .clear
        // add corner radius on contentView
        cell.contentView.backgroundColor = self.cardsColors[indexPath.section % self.cardsColors.count]
        cell.contentView.layer.cornerRadius = 25
        
        let myarray = ["tizio", "caio", "sempronio"]
        
        cell.pokemonName.text = myarray[indexPath.section]
        
  
        
        return cell
    }

}

class CardsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonSprite: UIImageView!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var pokemonType2: UILabel!
}
