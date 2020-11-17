//
//  NetworkManager.swift
//  StartWars
//
//  Created by Scor Doan on 14/11/2020.
//

import Foundation
import Moya

class NetworkManager: Networkable {
    internal var provider = MoyaProvider<SWAPI>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    init(provider: MoyaProvider<SWAPI> = MoyaProvider<SWAPI>()) {
        self.provider = provider
    }
    
    func fetchAllResource<T: Decodable & ResourcePresentable>(pageInfo: PaginationInfo, _ completed: @escaping (Result<ListResource<T>, MoyaError>) -> ()) {
        request(target: .allResources(type: T.type, pageInfo: pageInfo), completion: completed)
    }
    
    func fetchResource<T: Decodable & ResourcePresentable>(_ id: String, _ completed: @escaping CompletedBlock<T>) {
        request(target: .resource(id: id, type: T.type), completion: completed)
    }
    
    func search<T: Decodable & ResourcePresentable>(_ text: String, pageInfo: PaginationInfo = .default, _ completed: @escaping (Result<ListResource<T>, MoyaError>) -> ()) {
        request(target: .search(text: text, type: T.type, pageInfo: pageInfo), completion: completed)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: SWAPI, completion: @escaping (Result<T, MoyaError>) -> ()) {
        provider.request(target) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let response):
                do{
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch {
                    completion(.failure(MoyaError.jsonMapping(response)))
                }
            }
        }
    }
}
