//
//  TodoItemViewController.swift
//  ToDo List
//
//  Created by Nadiar Ahmad Syaripul on 27/03/20.
//  Copyright © 2020 Nadiar Syaripul. All rights reserved.
//

import UIKit

class TodoItemViewController: UIViewController {

    var todo: ToDoEntity? = nil
    
    @IBOutlet weak var todoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        todoLabel.text = todo?.name ?? "NA"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapComplete(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let todo2 = todo {
                context.delete(todo2)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        
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
