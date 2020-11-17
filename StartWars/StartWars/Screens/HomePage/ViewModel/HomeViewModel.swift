//
//  HomeViewModel.swift
//  StartWars
//
//  Created by Scor Doan on 15/11/2020.
//

import Foundation
import Combine
import Moya


enum ViewModelState {
    case stop
    case loading
    case error(MoyaError)
}

class HomeViewModel {
    @Published var searchText: String = ""
    @Published private(set) var items: [ResourcePresentable] = []
    @Published private(set) var state: ViewModelState = .stop
    @Published var resourceType: ResourceType = .films
    
    private let apiService: Networkable
    private var bindings = Set<AnyCancellable>()
    private var pageInfo: PaginationInfo = .default
    
    init(apiService: Networkable = NetworkManager()) {
        self.apiService = apiService
        
        $searchText
            .sink { [weak self] in self?.search($0) }
            .store(in: &bindings)
        
        $resourceType
            .sink{ [weak self] _ in self?.reset()}
            .store(in: &bindings)
        
    }
    
    //MARK: - Private functions
    private func reset() {
        state = .stop
        items = []
        pageInfo = pageInfo.reset()
    }
    
    //MARK: - Public functions
    func loadNextPage() {
        guard pageInfo.loadMore else { return }
        pageInfo = pageInfo.nextPage()
        search(searchText)
    }
}

extension HomeViewModel: DetailViewModelProtocol {
    var sections: [ResourcesSection] {
        [ResourcesSection(header: "", items: items)]
    }
    
    func fetchDetail() {
    }
    
    
}

// MARK: -- Fetch Data
extension HomeViewModel {
    private func search(_ text: String) {
        guard !text.isEmpty else {
            reset()
            return
        }
        state = .loading
        switch resourceType {
        case .films:
            searchFilm(text)
        case .people:
            searchPeople(text)
        case .planets:
            searchPlanet(text)
        case .species:
            searchSpecies(text)
        case .starships:
            searchStarship(text)
        case .vehicles:
            searchVehicle(text)
        }

    }
    
    ///Search Film with search text
    private func searchFilm(_ text: String) {
        apiService.search(text, pageInfo: pageInfo) { [weak self] (result: Result<ListResource<Film>, MoyaError>) in
            guard let `self` = self else { return }
            switch result {
            case .failure(let error):
                print(error)
                self.state = .error(error)
            case .success(let listPerson):
                self.pageInfo = self.pageInfo.checkLoadMore(listPerson.canLoadmore)
                self.items.append(contentsOf: listPerson.results)
                self.state = .stop
            }
        }
    }
    
    ///Search People with text search
    private func searchPeople(_ text: String) {
        apiService.search(text, pageInfo: pageInfo) { [weak self] (result: Result<ListResource<Person>, MoyaError>) in
            guard let `self` = self else { return }
            switch result {
            case .failure(let error):
                print(error)
                self.state = .error(error)
            case .success(let listPerson):
                self.pageInfo = self.pageInfo.checkLoadMore(listPerson.canLoadmore)
                self.items.append(contentsOf: listPerson.results)
                self.state = .stop
            }
        }
    }
    
    ///Search Planet with text search
    private func searchPlanet(_ text: String) {
        apiService.search(text, pageInfo: pageInfo) { [weak self] (result: Result<ListResource<Planet>, MoyaError>) in
            guard let `self` = self else { return }
            switch result {
            case .failure(let error):
                print(error)
                self.state = .error(error)
            case .success(let listPerson):
                self.pageInfo = self.pageInfo.checkLoadMore(listPerson.canLoadmore)
                self.items.append(contentsOf: listPerson.results)
                self.state = .stop
            }
        }
    }
    
    ///Search Species with  text search
    private func searchSpecies(_ text: String) {
        apiService.search(text, pageInfo: pageInfo) { [weak self] (result: Result<ListResource<Species>, MoyaError>) in
            guard let `self` = self else { return }
            switch result {
            case .failure(let error):
                print(error)
                self.state = .error(error)
            case .success(let listPerson):
                self.pageInfo = self.pageInfo.checkLoadMore(listPerson.canLoadmore)
                self.items.append(contentsOf: listPerson.results)
                self.state = .stop
            }
        }
    }
    
    ///Search Starship with  text search
    private func searchStarship(_ text: String) {
        apiService.search(text, pageInfo: pageInfo) { [weak self] (result: Result<ListResource<Starship>, MoyaError>) in
            guard let `self` = self else { return }
            switch result {
            case .failure(let error):
                print(error)
                self.state = .error(error)
            case .success(let listPerson):
                self.pageInfo = self.pageInfo.checkLoadMore(listPerson.canLoadmore)
                self.items.append(contentsOf: listPerson.results)
                self.state = .stop
            }
        }
    }
    
    ///Search Vehicle
    private func searchVehicle(_ text: String) {
        apiService.search(text, pageInfo: pageInfo) { [weak self] (result: Result<ListResource<Vehicle>, MoyaError>) in
            guard let `self` = self else { return }
            switch result {
            case .failure(let error):
                print(error)
                self.state = .error(error)
            case .success(let listPerson):
                self.pageInfo = self.pageInfo.checkLoadMore(listPerson.canLoadmore)
                self.items.append(contentsOf: listPerson.results)
                self.state = .stop
            }
        }
    }
}
