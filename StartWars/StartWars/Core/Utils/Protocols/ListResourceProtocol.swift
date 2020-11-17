//
//  ListResourceProtocol.swift
//  StartWars
//
//  Created by Scor Doan on 14/11/2020.
//

import Foundation

protocol ListResourceProtocol: class {
    var vm: DetailViewModelProtocol {get}
    func item(at: IndexPath) -> ResourcePresentable?
    func itemSelected(at: IndexPath)
    func numberOfSections() -> Int
    func numberOfItems(at section: Int) -> Int
    func titleForHeader(at section: Int) -> String
}

extension ListResourceProtocol {

    func item(at: IndexPath) -> ResourcePresentable? {
        vm.item(at: at)
    }
    
    func itemSelected(at: IndexPath) {
        vm.resourceDetail(at: at)
    }
    
    func numberOfSections() -> Int {
        vm.numberOfSections()
    }
    
    func numberOfItems(at section: Int) -> Int {
        vm.numberOfItems(at: section)
    }
    
    func titleForHeader(at section: Int) -> String {
        vm.titleForHeader(section)
    }
}
