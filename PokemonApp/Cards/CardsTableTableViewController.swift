//
//  CardsTableTableViewController.swift
//  PokemonApp
//
//  Created by Serena Falchieri on 30/10/2019.
//  Copyright © 2019 Serena Falchieri. All rights reserved.
//

import UIKit

class CardsTableTableViewController: UITableViewController {
    
    let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    var pickedPokemons : [PickedPokemon] = []
    var namesArray = [String]()
    var type1Array = [String]()
    var type2Array = [String]()
    var spritesArray = [String]()
    
    let cardsColors = [UIColor.init(named: "MainColor"), UIColor.init(named: "CardColor"), UIColor.init(named: "CardColorAlternative")]
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadingWheel()
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.init(named: "BackgroundColor")
        
        getData()
        
  
    }
    
    func getData() {
        // use dispatch groups to fire an asynchronous callback when all requests are finished
        let myGroup = DispatchGroup()
        
        for _ in 3 {
            activityIndicator.startAnimating()
            myGroup.enter()
            
            getRandomPokemon(url: "") { (randomPokemon) in
                
                self.pickedPokemons.append(PickedPokemon(name: randomPokemon.name, type1: randomPokemon.type1, type2: randomPokemon.type2, sprite: randomPokemon.sprite))
                
                myGroup.leave()
                
            }
            
        }
        myGroup.notify(queue: .main) {
            print("Finished all requests")
            
            // stuff to do after for loop is done
//            print("POKEMON: \(self.pickedPokemons)")
            for x in self.pickedPokemons {
                self.namesArray.append(x.name)
//                print(self.namesArray)
                self.type1Array.append(x.type1)
                self.type2Array.append(x.type2)
                self.spritesArray.append(x.sprite)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                  self.activityIndicator.stopAnimating()
                  self.tableView.reloadData()
            }
            
            print("data loaded")
        }
    }
    
    func setupLoadingWheel() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.black
        let horizontalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        view.addConstraint(horizontalConstraint)
        let verticalConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        view.addConstraint(verticalConstraint)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
        // returning this to make sure that the tableview only loads after data is fetched
        return namesArray.count
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
        

    
        cell.pokemonName.text = namesArray[indexPath.section]
        cell.pokemonType1.text = type1Array[indexPath.section]
        cell.pokemonType2.text = type2Array[indexPath.section]
//        cell.pokemonSprite.image = UIImage(named: spritesArray[0])
        

        
        print(spritesArray)
        return cell
    }

}

class CardsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonSprite: UIImageView!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var pokemonType2: UILabel!
}


