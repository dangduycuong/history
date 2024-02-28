//
//  AddPersonViewModel.swift
//  history
//
//  Created by cuongdd on 28/02/2024.
//

import Foundation

class AddPersonViewModel: BaseViewModel {
    var fetchedPersonDataSource = BehaviorRelay<[PersonModel]>(value: [])
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var name: String?
    var url: String?
    
    func loadData() {
        do {
            let items = try context.fetch(PersonModel.fetchRequest())
            fetchedPersonDataSource.accept(items)
        } catch {
            print("Couldn't Fetch Data")
        }
    }
    
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
        }
        catch {
            // Handle Error
        }
    }
}
