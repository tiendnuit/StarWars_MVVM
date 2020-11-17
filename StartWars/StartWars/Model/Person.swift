//
//  Person.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation

/// A People resource is an individual person or character within the Star Wars universe.
struct Person: Codable {
    var id: String!
    var birthYear: String!
    var eyeColor: String!
    var gender: String!
    var hairColor: String!
    var height: String!
    var homeworld: String!
    var mass: String!
    var name: String!
    var skinColor: String!
    var species: [String] = []
    var starships: [String] = []
    var vehicles: [String] = []
    var image: String = AppDefined.SW_IMAGES.randomElement()!
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case gender, height, mass, name, species, starships, vehicles, homeworld
    }
}

extension Person: Equatable, Hashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Person: ResourcePresentable {
    static var type: ResourceType = .people
    var uid: String {
        return id!
    }
    var titleLabelText: String {
        name!
    }
    
    var subtitleLabelText: String {
        """
        Gender: \(gender!)\n
        Height: \(height!) - Mass: \(mass!)\n
        Hair Color: \(hairColor!)\n
        Skin Color: \(skinColor!)
        """
    }
    var imageURL: URL? {
        return URL(string: image)
    }
}
