//
//  Configurable.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation

protocol Configurable {
    func configure(item: Any)
}

protocol UIViewControllerConfigurable {
    func setupComponents()
    func bindViewModel()
    func updateUI()
}
