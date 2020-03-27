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
    
    var joke: Joke = Joke()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = joke.title
        jokeDefinition.text = joke.text
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
