//
//  ToDoListStore.swift
//  ToDo Flux
//
//  Created by Mac on 10/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//
import Foundation

class ToDoListStore {
    
    private var toDoList = [ToDoItem]()
    
    var getToDoItems: [ToDoItem] {
        return self.toDoList
    }
    
    private init() {}
    
    init(list: [ToDoItem]) {
        self.toDoList = list
        
        //Add Listners
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(addItem(notification:)),
                                               name: NSNotification.Name(rawValue: "add_item"),
                                               object: nil)
    }
    
    @objc private func addItem(notification: Notification) {
        guard let newItem = notification.object as? ToDoItem else {
            return
        }
        self.toDoList.append(newItem)
        ToDoDispatcher.dispatch(action: .updateList)
    }
}
