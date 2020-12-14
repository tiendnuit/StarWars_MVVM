//
//  DetailViewModel.swift
//  StartWars
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation
import Combine

class DetailViewModel<T: ResourcePresentable>: DetailViewModelProtocol, ListResourceProtocol {
    @Published internal var state: ViewModelState = .stop
    @Published internal var items: [Any] = []
    internal let item: T
    internal let apiService: Networkable
    internal var bindings = Set<AnyCancellable>()
    internal var pageInfo: PaginationInfo = .default
    
    init(item: T, apiService: Networkable = NetworkManager()) {
        self.item = item
        self.apiService = apiService
        fetchDetail()
    }
    
    var title: String {
        item.titleLabelText
    }
    
    var sections: [ResourcesSection] {
        return []
    }
    
    func fetchDetail() {
    }
}
