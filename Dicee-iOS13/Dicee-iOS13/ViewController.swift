//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController { 

    @IBOutlet weak var diceImageViewOne: UIImageView!
    
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    var leftDiceIndex = 0
    
    var rightDiceIndex = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // diceImageViewOne.image = #imageLiteral(resourceName: "DiceSix")
        // diceImageViewOne.alpha = 0.5
        // diceImageViewTwo.image = #imageLiteral(resourceName: "DiceTwo")
    }

    @IBAction func rollButtonPressed(_ sender: Any) {
        // print("Jabaja funky night.")
        
        // diceImageViewOne.image = #imageLiteral(resourceName: "DiceFour")
        // diceImageViewTwo.image = #imageLiteral(resourceName: "DiceFour")
        
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        diceImageViewOne.image = diceArray[Int.random(in: 0...5)]
        
        diceImageViewTwo.image = diceArray.randomElement()
        
        if leftDiceIndex < 5 {
            leftDiceIndex += 1
        }
        
        if rightDiceIndex > 0 {
            rightDiceIndex -= 1
        }
    }
    
}

