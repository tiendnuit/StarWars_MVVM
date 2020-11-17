//
//  Transportable.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation
protocol Transportable {
    var id: String! {get set}
    var cargoCapacity: String! {get set}
    var consumables: String! {get set}
    var costInCredits: String! {get set}
    var crew: String! {get set}
    var length: String! {get set}
    var manufacturer: String! {get set}
    var maxAtmospheringSpeed: String! {get set}
    var model: String! {get set}
    var name: String! {get set}
    var passengers: String! {get set}
    var films: [String] {get set}
    var pilots: [String] {get set}
}
