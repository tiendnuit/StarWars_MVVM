//
//  SWError.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation

enum SWError: Error {
    case statusCode
    case decoding
    case invalidURL
    case unknown(Error)
    
    static func map(_ error: Error) -> SWError {
        return (error as? SWError) ?? .unknown(error)
    }
}
