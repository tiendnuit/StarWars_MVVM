//
//  Film.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation

/// A Film resource is a single film.
struct Film: Codable {
    var id: String!
    var director: String!
    var episodeId: Int!
    var openingCrawl: String!
    var producer: String!
    var releaseDate: String!
    var title: String!
    
    var characters: [String] = []
    var planets: [String] = []
    var species: [String] = []
    var starships: [String] = []
    var vehicles: [String] = []
    var image: String = AppDefined.SW_IMAGES.randomElement()!
    
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case releaseDate = "release_date"
        case director, producer, title, characters, planets, species, starships, vehicles
    }
}

extension Film: Equatable, Hashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Film: ResourcePresentable {
    var uid: String {
        return id!
    }
    
    var imageURL: URL? {
        return URL(string: image)
    }
    
    static var type: ResourceType = .films
    var titleLabelText: String {
        title!
    }
    
    var subtitleLabelText: String {
        """
        Episode: \(String(episodeId))\n
        Director: \(director!)\n
        Producer: \(producer!)\n
        ReleaseDate: \(releaseDate!)
        """
    }
}
