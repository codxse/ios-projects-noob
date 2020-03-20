//
//  ViewController.swift
//  Swift Fun
//
//  Created by Nadiar Ahmad Syaripul on 19/03/20.
//  Copyright © 2020 Nadiar Ahmad Syaripul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var counter: UILabel!
    
    var initial = 1
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        counter.text = String(initial);
        // Do any additional setup after loading the view.
        
        // view.backgroundColor = UIColor.green
        
    }

    @IBAction func myButton(_ sender: Any) {
        myLabel.text = "Jabaja Funk Night"
    }
    
    @IBAction func increment(_ sender: Any) {
        initial = initial + 1
        counter.text = String(initial);
        
        if initial > 10 {
            view.backgroundColor = UIColor.gray
        }
        
    }
}

