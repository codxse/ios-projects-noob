//
//  TodoTableViewController.swift
//  ToDo List
//
//  Created by Nadiar Ahmad Syaripul on 27/03/20.
//  Copyright © 2020 Nadiar Syaripul. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    // var todos : [Todo] = []
    var todos : [ToDoEntity] = []
    
    /*
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let todo1 = Todo()
        todo1.name = "Seep"
        todo1.isImportant = false
        
        let todo2 = Todo()
        todo2.name = "Eat"
        todo2.isImportant = true
        
        let todo3 = Todo()
        todo3.name = "Run"
        todo3.isImportant = false
        
        todos.append(todo1)
        todos.append(todo2)
        todos.append(todo3)
    }

    */
    
    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        getTodos();
    }
    
    func getTodos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDosFromCD = try? context.fetch(ToDoEntity.fetchRequest()) {
                if let toDos = toDosFromCD as? [ToDoEntity] {
                    todos = toDos
                    tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        if todos[indexPath.row].isImportant {
            if let myTask = todos[indexPath.row].name {
                cell.textLabel?.text = "🍌 " + myTask
            }
        } else {
            cell.textLabel?.text = todos[indexPath.row].name
        }
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let inputVC = segue.destination as? InputTodoViewController {
            inputVC.todoTableVC = self
        }
        
        if let completeVC = segue.destination as? TodoItemViewController {
            if let selectedTodo = sender as? ToDoEntity {
                completeVC.todo = selectedTodo
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = todos[indexPath.row]
        performSegue(withIdentifier: "routeToComplete", sender: selectedTodo)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
