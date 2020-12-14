//
//  ListResourceProtocol.swift
//  StartWars
//
//  Created by Scor Doan on 14/11/2020.
//

import Foundation

protocol ListResourceProtocol: class {
    var sections: [ResourcesSection] { get }
    func numberOfItems(at section: Int) -> Int
    func numberOfSections() -> Int
    func item(at indexPath: IndexPath) -> ResourcePresentable?
    func itemSelected(at: IndexPath)
    func titleForHeader(_ at: Int) -> String
}

extension ListResourceProtocol {
    func numberOfItems(at section: Int) -> Int {
        guard section < sections.count else {
            return 0
        }
        
        return sections[section].items.count
    }
    
    func numberOfSections() -> Int {
        sections.count
    }
    
    func item(at indexPath: IndexPath) -> ResourcePresentable? {
        guard indexPath.section < sections.count,
              indexPath.row < sections[indexPath.section].items.count else {
            return nil
        }
        
        return sections[indexPath.section].items[indexPath.row]
    }
    
    func itemSelected(at: IndexPath) {
        guard let item = item(at: at) else { return }
        if let film = item as? Film {
            FilmDetailViewController.show(film)
        } else if let people = item as? Person {
            PeopleDetailViewController.show(people)
        } else if let planet = item as? Planet {
            PlanetDetailViewController.show(planet)
        } else if let species = item as? Species {
            SpeciesDetailViewController.show(species)
        } else if let starship = item as? Starship {
            StarshipDetailViewController.show(starship)
        } else if let vehicle = item as? Vehicle {
            VehicleDetailViewController.show(vehicle)
        }
    }
    
    func titleForHeader(_ at: Int) -> String {
        sections[at].header
    }
}
