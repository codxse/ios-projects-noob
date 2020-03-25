//
//  JokeDefinitionViewController.swift
//  Joke Bank
//
//  Created by Nadiar Ahmad Syaripul on 26/03/20.
//  Copyright © 2020 Nadiar Syaripul. All rights reserved.
//

import UIKit

class JokeDefinitionViewController: UIViewController {

    
    @IBOutlet weak var jokeDefinition: UILabel!
    
    var joke = ""
    
    let jokesDefinition = ["Q: Siapa Nadiar?\nA: Nadiar adalah Mazter Mizter", "Q: ios?\nA: Apple", "Q: Android?\nA: Garbage", "Q: Windows?\nA: Jabaja"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = joke
        // Do any additional setup after loading the view.
        if (joke == "nadiar") {
            jokeDefinition.text = jokesDefinition[0]
        }
        
        if (joke == "android") {
            jokeDefinition.text = jokesDefinition[1]
        }
        
        if (joke == "ios") {
            jokeDefinition.text = jokesDefinition[2]
        }
        
        if (joke == "windows") {
            jokeDefinition.text = jokesDefinition[3]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
