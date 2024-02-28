//
//  PersonViewModel.swift
//  history
//
//  Created by cuongdd on 28/02/2024.
//

import Foundation

class PersonViewModel: BaseViewModel {
    var fetchedPersonDataSource = BehaviorRelay<[PersonModel]>(value: [])
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func loadData() {
        do {
            let items = try context.fetch(PersonModel.fetchRequest())
            fetchedPersonDataSource.accept(items)
        } catch {
            print("Couldn't Fetch Data")
        }
    }
    
    func deleteData(_ index: Int) {
        let user = fetchedPersonDataSource.value[index]
        // To delete the entity from the persistent store, call
        context.delete(user)
        // save on the context
        do {
            try context.save()
            loadData()
        } catch {
            // Handle Error
        }
    }
    
    func updateData(_ index: Int, _ name: String?, _ url: String?) {
        let user = fetchedPersonDataSource.value[index]
        user.name = name
        user.url = url

        // To save new entity updates to the persistent store,
        // call save on the context
        do {
            try context.save()
            loadData()
        } catch {
            // Handle Error
        }
    }
}
