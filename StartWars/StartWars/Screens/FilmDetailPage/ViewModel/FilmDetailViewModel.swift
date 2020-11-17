//
//  FilmDetailViewModel.swift
//  StartWars
//
//  Created by Scor Doan on 15/11/2020.
//

import Foundation
import Combine
import Moya

class FilmDetailViewModel: DetailViewModel<Film> {
    private var characters: [Person] = []
    private var planets: [Planet] = []
    private var species: [Species] = []
    private var starships: [Starship] = []
    private var vehicles: [Vehicle] = []
    
    override var sections: [ResourcesSection] {
        var results = [ResourcesSection]()
        results.append(ResourcesSection(header: "Characters", items: characters))
        results.append(ResourcesSection(header: "Planets", items: planets))
        results.append(ResourcesSection(header: "Species", items: species))
        results.append(ResourcesSection(header: "Starships", items: starships))
        results.append(ResourcesSection(header: "Vehicles", items: vehicles))
        
        return results
    }

    override func fetchDetail() {
        state = .loading
        let group = DispatchGroup()
        //Fetch Characters
        if !item.characters.isEmpty {
            characters = []
            item.characters
                .compactMap{URL(string: $0)}
                .compactMap{$0.lastPathComponent}
                .forEach{
                    group.enter()
                    apiService.fetchResource($0) { [weak self] (result: Result<Person, MoyaError>) in
                        switch result {
                        case .failure(_): break
                        case .success(let character):
                            self?.characters.append(character)
                        }
                        group.leave()
                    }
                }
        }
        
        //Fetch planets
        if !item.planets.isEmpty {
            planets = []
            item.planets
                .compactMap{URL(string: $0)}
                .compactMap{$0.lastPathComponent}
                .forEach{
                    group.enter()
                    apiService.fetchResource($0) { [weak self] (result: Result<Planet, MoyaError>) in
                        switch result {
                        case .failure(_): break
                        case .success(let planet):
                            self?.planets.append(planet)
                        }
                        group.leave()
                    }
                }
        }
        
        //Fetch starships
        if !item.starships.isEmpty {
            starships = []
            item.starships
                .compactMap{URL(string: $0)}
                .compactMap{$0.lastPathComponent}
                .forEach{
                    group.enter()
                    apiService.fetchResource($0) { [weak self] (result: Result<Starship, MoyaError>) in
                        switch result {
                        case .failure(_): break
                        case .success(let starship):
                            self?.starships.append(starship)
                        }
                        group.leave()
                    }
                }
        }
        
        //Fetch species
        if !item.species.isEmpty {
            species = []
            item.species
                .compactMap{URL(string: $0)}
                .compactMap{$0.lastPathComponent}
                .forEach{
                    group.enter()
                    apiService.fetchResource($0) { [weak self] (result: Result<Species, MoyaError>) in
                        switch result {
                        case .failure(_): break
                        case .success(let starship):
                            self?.species.append(starship)
                        }
                        group.leave()
                    }
                }
        }
        
        //Fetch vehicles
        if !item.vehicles.isEmpty {
            vehicles = []
            item.vehicles
                .compactMap{URL(string: $0)}
                .compactMap{$0.lastPathComponent}
                .forEach{
                    group.enter()
                    apiService.fetchResource($0) { [weak self] (result: Result<Vehicle, MoyaError>) in
                        switch result {
                        case .failure(_): break
                        case .success(let starship):
                            self?.vehicles.append(starship)
                        }
                        group.leave()
                    }
                }
        }
        group.notify(queue: .main) {
            self.state = .stop
            self.items = self.sections
            
        }
    }
    
    //MARK: - Public functions
}
