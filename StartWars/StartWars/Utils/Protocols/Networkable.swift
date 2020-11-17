//
//  Networkable.swift
//  StartWars
//
//  Created by Scor Doan on 14/11/2020.
//

import Foundation
import Moya

typealias CompletedBlock<T:Decodable & ResourcePresentable> = (Result<T, MoyaError>) -> ()
typealias ListCompletedBlock<T:Decodable & ResourcePresentable> = (Result<[T], MoyaError>) -> ()

protocol Networkable {
    var provider: MoyaProvider<SWAPI> { get }
    func fetchAllResource<T: Decodable & ResourcePresentable>(pageInfo: PaginationInfo, _ completed: @escaping (Result<ListResource<T>, MoyaError>) -> ())
    func fetchResource<T: Decodable & ResourcePresentable>(_ id: String, _ completed: @escaping CompletedBlock<T>)
    func search<T: Decodable & ResourcePresentable>(_ text: String, pageInfo: PaginationInfo, _ completed: @escaping (Result<ListResource<T>, MoyaError>) -> ())
}
