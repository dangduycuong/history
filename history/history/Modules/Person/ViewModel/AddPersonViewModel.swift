//
//  AddPersonViewModel.swift
//  history
//
//  Created by cuongdd on 28/02/2024.
//

import Foundation

class AddPersonViewModel: BaseViewModel {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var name: String?
    var url: String?
    var finishedAddData: (() -> Void) = {}
    
    func validateInput() -> Bool {
        if name == nil {
            return false
        }
        
        if url == nil {
            return false
        }
        
        guard let url = url, let _ = URL(string: url) else {
            return false
        }
        return true
    }
    
    func addData() {
        if validateInput() == false {
            return
        }
        let user = PersonModel(context: context)

        // Assign values to the entity's properties
        user.name = name
        user.url = url
        // To save the new entity to the persistent store, call
        // save on the context
        do {
            try context.save()
            finishedAddData()
        } catch {
            // Handle Error
        }
    }
}
