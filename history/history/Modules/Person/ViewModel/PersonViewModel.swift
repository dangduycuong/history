//
//  PersonViewModel.swift
//  history
//
//  Created by cuongdd on 28/02/2024.
//

import Foundation

class PersonViewModel: BaseViewModel {
    var fetchedPersonDataSource = BehaviorRelay<[PersonModel]>(value: [])
    private var listPersonModel = [PersonModel]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var searchText: String? = "" {
        didSet {
            filterPerson()
        }
    }
    
    func loadData() {
        do {
            let items = try context.fetch(PersonModel.fetchRequest())
            listPersonModel = items
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
    
    func filterPerson() {
        guard let text = searchText?.lowercased().unaccent() else { return }
        if text == "" {
            fetchedPersonDataSource.accept(listPersonModel)
            return
        }
        
        let list = listPersonModel.filter { (model: PersonModel) in
            let name = model.name?.lowercased().unaccent()
            if name?.range(of: text) != nil {
                return true
            }
            return false
        }
        fetchedPersonDataSource.accept(list)
    }
}
