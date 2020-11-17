//
//  PeopleDetailViewModel.swift
//  StartWars
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation
import Combine
import Moya

class PeopleDetailViewModel: DetailViewModel<Person> {
    @Published private(set) var homeworldName: String = ""
    private var species: [Species] = []
    private var starships: [Starship] = []
    private var vehicles: [Vehicle] = []
    private var homeworld: Planet? = nil
    
    override var sections: [ResourcesSection] {
        var results = [ResourcesSection]()
        results.append(ResourcesSection(header: "Species", items: species))
        results.append(ResourcesSection(header: "Starships", items: starships))
        results.append(ResourcesSection(header: "Vehicles", items: vehicles))
        
        return results
    }
    

    override func fetchDetail() {
        state = .loading
        let group = DispatchGroup()
        if let homeworld = item.homeworld, let id = URL(string: homeworld)?.lastPathComponent {
            group.enter()
            apiService.fetchResource(id) { [weak self] (result: Result<Planet, MoyaError>) in
                switch result {
                case .failure(_): break
                case .success(let planet):
                    self?.homeworld = planet
                }
                group.leave()
            }
        }
        
        //Fetch starships
        if !item.starships.isEmpty {
            starships = []
            item.starships
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
                .forEach{
                    group.enter()
                    apiService.fetchResource($0) { [weak self] (result: Result<Species, MoyaError>) in
                        switch result {
                        case .failure(_):
                            break
                        case .success(let species):
                            self?.species.append(species)
                        }
                        group.leave()
                    }
                }
        }
        
        //Fetch vehicles
        if !item.vehicles.isEmpty {
            vehicles = []
            item.vehicles
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
            self.homeworldName = self.homeworld?.name ?? ""
            
        }
    }
    
    //MARK: - Public functions
}
