//
//  ToDoDispatcher.swift
//  ToDo Flux
//
//  Created by Mac on 10/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//
import Foundation

class ToDoDispatcher {
    
    static func dispatch(action: ActionContainer) {
        switch action {
        case .add(let item):
            NotificationCenter.default.post(name: Notification.Name("add_item"), object: item)
        case .updateList:
            NotificationCenter.default.post(name: Notification.Name("update_list"), object: nil)
        default:
            break
        }
    }
}
