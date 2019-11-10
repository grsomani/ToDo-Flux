//
//  ViewController.swift
//  ToDo Flux
//
//  Created by Mac on 10/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let store = ToDoListStore.init(list: [])
    
    var list: [ToDoItem] {
        return self.store.getToDoItems
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ToDo List"
        let addActionItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDoItem))
        self.navigationItem.rightBarButtonItem = addActionItem
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleStoreUpdate),
                                               name: NSNotification.Name(rawValue: "update_list"),
                                               object: nil)
    }
    
    @objc private func handleStoreUpdate() {
        self.tableView.reloadData()
    }
    
    @objc func addToDoItem() {
        let alertController = UIAlertController(title: "Add New", message: "Add new ToDo Item", preferredStyle: .alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter ToDo Name"
        }
        
        let saveAction = UIAlertAction(title: "Add", style: .default, handler: { alert -> Void in
            let toDoTextField = alertController.textFields![0] as UITextField
            let itemName = (toDoTextField.text?.isEmpty)! ? "New Item" : toDoTextField.text!
            let newToDoItem = ToDoItem(sequence: self.list.count, name: itemName, state: .toDo)
            ToDoDispatcher.dispatch(action: ActionContainer.add(newToDoItem))
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        let toDoItem = self.list[indexPath.row]
        cell.textLabel?.text = toDoItem.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let toDoItem = self.list[indexPath.row]
            ToDoDispatcher.dispatch(action: .delete(toDoItem))
        }
    }
}

