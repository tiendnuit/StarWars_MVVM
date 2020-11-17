//
//  Species.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation

/// A Species resource is a type of person or character within the Star Wars Universe.
struct Species: Codable {
    var id: String!
    var averageHeight: String!
    var averageLifespan: String!
    var classification: String!
    var designation: String!
    var eyeColors: String!
    var hairColors: String!
    var homeworld: String!
    var language: String!
    var name: String!
    var skinColors: String!
    var people: [String] = []
    var films: [String] = []
    var image: String = AppDefined.SW_IMAGES.randomElement()!
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case averageHeight = "average_height"
        case averageLifespan = "average_lifespan"
        case eyeColors = "eye_colors"
        case hairColors = "hair_colors"
        case skinColors = "skin_colors"
        case classification, designation, homeworld, language, name, people, films
    }
}

extension Species: Equatable, Hashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Species: ResourcePresentable {
    static var type: ResourceType = .species
    var uid: String {
        return id!
    }
    var titleLabelText: String {
        name!
    }
    
    var subtitleLabelText: String {
        """
        Language: \(language!)\n
        Classification: \(classification!)\n
        Average Height: \(averageHeight!)\n
        Skin Colors: \(skinColors!)
        """
    }
    var imageURL: URL? {
        return URL(string: image)
    }
}
