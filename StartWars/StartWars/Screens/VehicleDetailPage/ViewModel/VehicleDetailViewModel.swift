//
//  VehicleDetailViewModel.swift
//  StartWars
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation
import Combine
import Moya

class VehicleDetailViewModel: DetailViewModel<Vehicle> {
    private var pilots: [Person] = []
    private var films: [Film] = []
    
    override var sections: [ResourcesSection] {
        var results = [ResourcesSection]()
        results.append(ResourcesSection(header: "Pilots", items: pilots))
        results.append(ResourcesSection(header: "Film", items: films))
        
        return results
    }

    override func fetchDetail() {
        state = .loading
        let group = DispatchGroup()
        //Fetch Residents
        if !item.pilots.isEmpty {
            pilots = []
            item.pilots
                .forEach{
                    group.enter()
                    apiService.fetchResource($0) { [weak self] (result: Result<Person, MoyaError>) in
                        switch result {
                        case .failure(_): break
                        case .success(let pilot):
                            self?.pilots.append(pilot)
                        }
                        group.leave()
                    }
                }
        }
        
        //Fetch Films
        if !item.films.isEmpty {
            films = []
            item.films
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
