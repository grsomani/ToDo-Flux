//
//  ViewController.swift
//  ToDo Flux
//
//  Created by Mac on 10/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let store = ToDoListStore.init(list: [ToDoItem(name: "Sample", state: .toDo)])
    
    var list: [ToDoItem] {
        return self.store.getToDoItems
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ToDo List"
        let addActionItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDoItem))
        self.navigationItem.rightBarButtonItem = addActionItem
    }
    
    @objc func addToDoItem() {
        
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
}

