//
//  ResourcePresentable.swift
//  StartWars
//
//  Created by Scor Doan on 14/11/2020.
//

import Foundation

protocol ResourcePresentable {
    static var type: ResourceType {get}
    var uid: String { get }
    var titleLabelText: String { get }
    var subtitleLabelText: String { get }
    var imageURL: URL? {get}
}

