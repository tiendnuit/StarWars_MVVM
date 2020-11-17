//
//  CacheManager.swift
//  StartWars
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation

protocol CacheProtocol {
    associatedtype Item
    func store(_ item: Item, key: String)
    func remove(_ key: String)
    func clear()
    func get(_ key: String) -> Item?
}

/// SWResourceCache use to cache fetched resources
class SWResourceCache: CacheProtocol {
    typealias Item = ResourcePresentable
    static let shared = SWResourceCache()
    private var memoryDict: [String: Item] = [:]
    private let queue = DispatchQueue(label: "SWResourceCacheQueue", attributes: .concurrent)
    
    func store(_ item: Item, key: String) {
        queue.async(flags: .barrier) {
            self.memoryDict[key] = item
        }
    }
    
    func get(_ key: String) -> Item? {
        var item: Item?
        queue.sync {
            item = self.memoryDict[key]
        }
        return item
    }
    
    func remove(_ key: String) {
        queue.async(flags: .barrier) {
            self.memoryDict[key] = nil
        }
    }
    
    func clear() {
        queue.async(flags: .barrier) {
            self.memoryDict = [:]
        }
    }
}
