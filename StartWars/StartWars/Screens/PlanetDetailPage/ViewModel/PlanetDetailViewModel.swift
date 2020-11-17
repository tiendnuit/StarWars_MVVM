//
//  PlanetDetailViewModel.swift
//  StartWars
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation
import Combine
import Moya

class PlanetDetailViewModel: DetailViewModel<Planet> {
    private var residents: [Person] = []
    private var films: [Film] = []
    
    override var sections: [ResourcesSection] {
        var results = [ResourcesSection]()
        results.append(ResourcesSection(header: "Residents", items: residents))
        results.append(ResourcesSection(header: "Films", items: films))
        
        return results
    }

    override func fetchDetail() {
        state = .loading
        let group = DispatchGroup()
        //Fetch Residents
        if !item.residents.isEmpty {
            residents = []
            item.residents
                .compactMap{URL(string: $0)}
                .compactMap{$0.lastPathComponent}
                .forEach{
                    group.enter()
                    apiService.fetchResource($0) { [weak self] (result: Result<Person, MoyaError>) in
                        switch result {
                        case .failure(_): break
                        case .success(let resident):
                            self?.residents.append(resident)
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
