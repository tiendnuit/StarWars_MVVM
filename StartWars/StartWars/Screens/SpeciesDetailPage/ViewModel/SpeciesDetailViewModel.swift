//
//  SpeciesDetailViewModel.swift
//  StartWars
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation
import Combine
import Moya

class SpeciesDetailViewModel: DetailViewModel<Species> {
    private var people: [Person] = []
    private var films: [Film] = []
    private var vehicles: [Vehicle] = []
    
    override var sections: [ResourcesSection] {
        var results = [ResourcesSection]()
        results.append(ResourcesSection(header: "People", items: people))
        results.append(ResourcesSection(header: "Film", items: films))
        
        return results
    }

    override func fetchDetail() {
        state = .loading
        let group = DispatchGroup()
        //Fetch Residents
        if !item.people.isEmpty {
            people = []
            item.people
                .compactMap{URL(string: $0)}
                .compactMap{$0.lastPathComponent}
                .forEach{
                    group.enter()
                    apiService.fetchResource($0) { [weak self] (result: Result<Person, MoyaError>) in
                        switch result {
                        case .failure(_): break
                        case .success(let resident):
                            self?.people.append(resident)
                        }
                        group.leave()
                    }
                }
        }
        
        //Fetch Films
        if !item.films.isEmpty {
            films = []
            item.films
                .compactMap{URL(string: $0)}
                .compactMap{$0.lastPathComponent}
                .forEach{
                    group.enter()
                    apiService.fetchResource($0) { [weak self] (result: Result<Film, MoyaError>) in
                        switch result {
                        case .failure(_): break
                        case .success(let film):
                            self?.films.append(film)
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
