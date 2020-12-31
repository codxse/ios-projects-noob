//
//  ViewController.swift
//  Project2
//
//  Created by Nadiar Syaripul on 28/12/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var track = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }
    
    func askQuestion(alert: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()), score \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        track += 1
        
        if track == 10 {
            setupUIAlertController(sender)
            track = 0
            score = 0
        } else {
            let isCorrect = checkAnswer(sender)
            if !isCorrect {
                setupUIAlertController(sender)
            }
            askQuestion()
        }
    }
    
    func setupUIAlertController(_ sender: UIButton) {
        var title: String = ""
        
        if !checkAnswer(sender) {
            title = "Wrong, That’s the flag of \(countries[sender.tag].uppercased())"
        }
        
        if track == 10 {
            title = "Done! your final score: \(score)"
        }
        
        let ac = UIAlertController(title: title, message: "Your scrore is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Share", style: .default) {_ in
            let _vc = UIActivityViewController(activityItems: ["My score \(self.score)"], applicationActivities: [])
            self.present(_vc, animated: true)
        })
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
    func checkAnswer(_ sender: UIButton) -> Bool  {
        if sender.tag == correctAnswer {
            score += 1
            return true
        } else {
            score -= 1
            return false
        }
    }
    
}

