//
//  StoriesViewModel.swift
//  history
//
//  Created by cuongdd on 27/02/2024.
//

import Foundation

class StoriesViewModel: BaseViewModel {
    var storiesDataSource = BehaviorRelay<[ContentModel]>(value: [])
    private var sourceStories = [ContentModel]()
    var searchText: String? = "" {
        didSet {
            filterStories()
        }
    }
    
    private func filterStories() {
        let keyWord: String = (searchText ?? "").lowercased().unaccent()
        var list = [ContentModel]()
        if keyWord == "" {
            list = sourceStories
            storiesDataSource.accept(list)
            return
        }
        list = sourceStories.filter { (model: ContentModel) in
            let title = model.title?.lowercased().unaccent()
            if title?.range(of: keyWord) != nil {
                return true
            }
            return false
        }
        storiesDataSource.accept(list)
    }
    
    func showingDetail(at index: Int) {
        var list = storiesDataSource.value
        for i in 0..<list.count {
            list[i].isShowing = i == index
        }
        storiesDataSource.accept(list)
    }
    
    func readJSONFile(forName name: String) {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let json = try JSONDecoder().decode(StoryModel.self, from: jsonData)
                if let stories = json.stories {
                    self.sourceStories = stories
                    self.storiesDataSource.accept(self.sourceStories)
                }
            }
        } catch {
            print(error)
        }
    }
    
}
