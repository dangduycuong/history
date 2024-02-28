//
//  StoryModel.swift
//  history
//
//  Created by cuongdd on 27/02/2024.
//

import Foundation

struct StoryModel: Codable {
    var stories: [ContentModel]?
}

struct ContentModel: Codable {
    var isShowing: Bool?
    var title: String?
    var content: String?
}
