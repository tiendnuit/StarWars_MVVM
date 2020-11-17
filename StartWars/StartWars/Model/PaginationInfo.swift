//
//  PaginationInfo.swift
//  StartWars
//
//  Created by Scor Doan on 14/11/2020.
//

import Foundation

public struct PaginationInfo {
    private(set) var page: Int = 1
    private(set) var pageSize: Int = AppDefined.SWAPI.ITEMS_PER_PAGE
    private(set) var loadMore: Bool = true
    
    func update(page: Int, loadMore: Bool) -> PaginationInfo {
        return PaginationInfo(page: page, pageSize: pageSize, loadMore: loadMore)
    }
    
    func nextPage() -> PaginationInfo {
        return PaginationInfo(page: page+1, pageSize: pageSize, loadMore: loadMore)
    }
    
    func checkLoadMore(_ loadMore: Bool) -> PaginationInfo {
        return PaginationInfo(page: page, pageSize: pageSize, loadMore: loadMore)
    }
    
    func reset() -> PaginationInfo {
        return PaginationInfo()
    }
    
    static let `default` = PaginationInfo()
}
