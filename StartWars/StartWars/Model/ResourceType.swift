//
//  ResourceType.swift
//  StartWars
//
//  Created by Scor Doan on 14/11/2020.
//

import Foundation

enum ResourceType: Int {
    case films = 0, people, planets, species, starships, vehicles
    var name: String {
        switch self {
        case .films:
            return "films"
        case .people:
            return "people"
        case .starships:
            return "starships"
        case .vehicles:
            return "vehicles"
        case .species:
            return "species"
        case .planets:
            return "planets"
        }
    }
}
