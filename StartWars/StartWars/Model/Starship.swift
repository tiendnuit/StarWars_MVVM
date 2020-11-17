//
//  Starship.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation

/// A Starship resource is a single transport craft that has hyperdrive capability.
struct Starship: Transportable, Codable {
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
    
    //Starship
    var mglt: String!
    var hyperdriveRating: String!
    var starshipClass: String!
    
    
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case mglt = "MGLT"
        case cargoCapacity = "cargo_capacity"
        case costInCredits = "cost_in_credits"
        case hyperdriveRating = "hyperdrive_rating"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case starshipClass = "starship_class"
        case consumables, crew, length, manufacturer, model, name, passengers, films, pilots
    }
}

extension Starship: Equatable, Hashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Starship: ResourcePresentable {
    static var type: ResourceType = .starships
    var uid: String {
        return id!
    }
    var titleLabelText: String {
        name ?? "Unknown"
    }
    
    var subtitleLabelText: String {
        """
        Model: \(model ?? "")\n
        Consumables: \(consumables ?? "")\n
        Manufacturer: \(manufacturer ?? "")\n
        Max Atmosphering Speed: \(maxAtmospheringSpeed ?? "")
        """
    }
    
    var imageURL: URL? {
        return URL(string: image)
    }
}
