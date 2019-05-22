//
//  CardViewController.swift
//  DeckOfOneCard_ObjC
//
//  Created by Dustin Koch on 5/21/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    //MARK: - Actions
    @IBAction func drawCardButtonTapped(_ sender: UIButton) {
        fetchAndUpdateView()
    }
    
    //MARK: - Helper function
    
    func fetchAndUpdateView(){
        let controller = DHKCardController()
        controller.fetchCard { (card) in
            guard let card = card else { return }
            DispatchQueue.main.async {
                self.fetchAndSetImage(card: card)
                self.suitLabel.text = card.suit
            }
        }
    }
    
    func fetchAndSetImage(card: DHKCard){
        let controller = DHKCardController()
        controller.fetchImage(from: card) { (image) in
            DispatchQueue.main.async {
                self.cardImageView.image = image
            }
        }
    }
    
    
}//END OF CLASS
