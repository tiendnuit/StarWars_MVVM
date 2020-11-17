//
//  ResourcesSection.swift
//  StartWars
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation

struct ResourcesSection {
    var header: String
    var items: [Item]
}

extension ResourcesSection: SectionModelType {
    typealias Item = ResourcePresentable
    
    init(original: ResourcesSection, items: [Item]) {
        self = original
        self.items = items
    }
}
