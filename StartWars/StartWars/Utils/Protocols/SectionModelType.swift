//
//  SectionModelType.swift
//  StartWars
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation

public protocol SectionModelType {
    associatedtype Item

    var items: [Item] { get }
    init(original: Self, items: [Item])
}
