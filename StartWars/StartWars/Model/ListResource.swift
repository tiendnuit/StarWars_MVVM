//
//  ListResource.swift
//  StartWars
//
//  Created by Scor Doan on 14/11/2020.
//

import Foundation

struct ListResource<T: Decodable & ResourcePresentable>: Decodable {
    var count: Int!
    var next: String?
    var previous: String?
    var results: [T] = []
    
    var canLoadmore: Bool {
        return next != nil
    }
}
