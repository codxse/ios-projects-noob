//
//  InputTodoViewController.swift
//  ToDo List
//
//  Created by Nadiar Ahmad Syaripul on 27/03/20.
//  Copyright © 2020 Nadiar Syaripul. All rights reserved.
//

import UIKit
import CoreData

class InputTodoViewController: UIViewController {

    @IBOutlet weak var todoTextInput: UITextField!
    @IBOutlet weak var todoSwitcher: UISwitch!
    
    var todoTableVC : TodoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTap(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let t = ToDoEntity(context: context)
            
            // let t = Todo()
            t.isImportant = todoSwitcher.isOn
            if let n = todoTextInput.text {
                t.name = n
            }
            
            print(t);
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        
        // todoTableVC?.todos.append(t)
        // todoTableVC?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
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
