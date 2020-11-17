//
//  Planet.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation

/// A Planet resource is a large mass, planet or planetoid in the Star Wars Universe, at the time of 0 ABY.
struct Planet: Codable {
    var id: String!
    var climate: String!
    var diameter: String!
    var gravity: String!
    var name: String!
    var orbitalPeriod: String!
    var population: String!
    var rotationPeriod: String!
    var surfaceWater: String!
    var terrain: String!
    var films: [String] = []
    var residents: [String] = []
    var image: String = AppDefined.SW_IMAGES.randomElement()!
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case orbitalPeriod = "orbital_period"
        case rotationPeriod = "rotation_period"
        case surfaceWater = "surface_water"
        case climate, diameter, gravity, name, population, terrain, films, residents
    }
}

extension Planet: Equatable, Hashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Planet: ResourcePresentable {
    static var type: ResourceType = .planets
    var uid: String {
        return id!
    }
    var titleLabelText: String {
        name!
    }
    
    var subtitleLabelText: String {
        """
        Climate: \(climate!)\n
        Population: \(population!)\n
        Diameter: \(diameter!)\n
        Terrain: \(terrain!)
        """
    }
    var imageURL: URL? {
        return URL(string: image)
    }
}
