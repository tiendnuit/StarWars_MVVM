//
//  Vehicle.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation

/// A Vehicle resource is a single transport craft that does not have hyperdrive capability.
struct Vehicle: Transportable, Codable {
    //TransportCraft
    var id: String!
    var cargoCapacity: String!
    var consumables: String!
    var costInCredits: String!
    var crew: String!
    var length: String!
    var manufacturer: String!
    var maxAtmospheringSpeed: String!
    var model: String!
    var name: String!
    var passengers: String!
    var films: [String] = []
    var pilots: [String] = []
    var image: String = AppDefined.SW_IMAGES.randomElement()!
    //Vehicle
    var vehicleClass: String!
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case cargoCapacity = "cargo_capacity"
        case costInCredits = "cost_in_credits"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case consumables, crew, length, manufacturer, model, name, passengers, films, pilots
    }
}

extension Vehicle: Equatable, Hashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Vehicle: ResourcePresentable {
    static var type: ResourceType = .vehicles
    var uid: String {
        return id!
    }
    var titleLabelText: String {
        name!
    }
    
    var subtitleLabelText: String {
        """
        Model: \(model!)\n
        Consumables: \(consumables!)\n
        Manufacturer: \(manufacturer!)\n
        Max Atmosphering Speed: \(maxAtmospheringSpeed!)
        """
    }
    var imageURL: URL? {
        return URL(string: image)
    }
}
