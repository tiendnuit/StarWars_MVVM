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
        request(target: .allResources(type: T.type, pageInfo: pageInfo)) { (result: Result<ListResource<T>, MoyaError>) in
            if case let .success(items) = result {
                //If success -> cache item to memory
                SWResourceCache.shared.store(items: items.results)
            }
            completed(result)
        }
    }
    
    func fetchResource<T: Decodable & ResourcePresentable>(_ id: String, _ completed: @escaping CompletedBlock<T>) {
        // Get from Cache if it existed
        if let item = SWResourceCache.shared.get(id) as? T{
            completed(Result.success(item))
        } else if let realId = URL(string: id)?.lastPathComponent {
            // else get from server
            request(target: .resource(id: realId, type: T.type)) { (result: Result<T, MoyaError>) in
                if case let .success(item) = result {
                    //If success -> cache item to memory
                    SWResourceCache.shared.store(item, key: item.uid)
                }
                completed(result)
            }
        } else {
            completed(Result.failure(MoyaError.requestMapping("Invalid ID")))
        }
    }
    
    func search<T: Decodable & ResourcePresentable>(_ text: String, pageInfo: PaginationInfo = .default, _ completed: @escaping (Result<ListResource<T>, MoyaError>) -> ()) {
        
        request(target: .search(text: text, type: T.type, pageInfo: pageInfo)) { (result: Result<ListResource<T>, MoyaError>) in
            if case let .success(items) = result {
                //If success -> cache item to memory
                SWResourceCache.shared.store(items: items.results)
            }
            completed(result)
        }
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
