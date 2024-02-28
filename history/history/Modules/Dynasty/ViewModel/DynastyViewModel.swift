//
//  DynastyViewModel.swift
//  history
//
//  Created by cuongdd on 28/02/2024.
//

import Foundation

class DynastyViewModel: BaseViewModel {
    var fetchedPersonDataSource = BehaviorRelay<[DynastyModel]>(value: [])
    private var listDynastyModel = [DynastyModel]()
    
    var searchText: String? = "" {
        didSet {
            filterPerson()
        }
    }
    
    func loadData() {
        do {
            let items = try context.fetch(DynastyModel.fetchRequest())
            listDynastyModel = items
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
            fetchedPersonDataSource.accept(listDynastyModel)
            return
        }
        
        let list = listDynastyModel.filter { (model: DynastyModel) in
            let name = model.name?.lowercased().unaccent()
            if name?.range(of: text) != nil {
                return true
            }
            return false
        }
        fetchedPersonDataSource.accept(list)
    }
}
