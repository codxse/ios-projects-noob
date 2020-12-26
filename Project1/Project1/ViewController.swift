//
//  ViewController.swift
//  Project1
//
//  Created by Nadiar Syaripul on 25/12/20.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Panda Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        if let path = Bundle.main.resourcePath {
            let items = try! fm.contentsOfDirectory(atPath: path)
            for item in items {
                if item.hasPrefix("animal_") {
                    pictures.append(item)
                }
            }
        }
        
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

