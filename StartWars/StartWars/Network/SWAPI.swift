//
//  SWAPI.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation
import Moya

/// SWAPI network service layer
enum SWAPI {
    case allResources(type: ResourceType, pageInfo: PaginationInfo)
    case resource(id: String, type: ResourceType)
    //search
    case search(text: String, type: ResourceType, pageInfo: PaginationInfo)
}

extension SWAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: AppDefined.SWAPI.BaseUrl) else { fatalError() }
                return url
    }
    
    var path: String {
        switch self {
        case .allResources(let type, _):
            return "\(type.name)/"
        case .resource(let id, let type):
            return "\(type.name)/\(id)/"
        case .search(_, let type, _):
            return "\(type.name)/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
        
    }
    
    // For Unittest
    var sampleData: Data {
        var name: String?
        switch self {
        case .allResources:
            name = "all_films"
        case .resource:
            name = "film_id_1"
        case .search:
            name = "search_people_t"
        }
        guard let url = Bundle.main.url(forResource: name, withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return Data() }
        return data
    }
    
    var task: Task {
        switch self {
        case .allResources(_, let pageInfo):
            return .requestParameters(parameters: ["page":pageInfo.page], encoding: URLEncoding.queryString)
        case .search(let text, _, let pageInfo):
            return .requestParameters(parameters: ["search": text, "page":pageInfo.page], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    

}
