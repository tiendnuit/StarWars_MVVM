//
//  TestNetworkTests.swift
//  StartWarsTests
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation
import XCTest
import Moya
@testable import StartWars

class TestNetworkTests: XCTestCase {

    var network: Networkable!
    
    override func setUp() {
        super.setUp()
        network = NetworkManager(provider: MoyaProvider<SWAPI>(stubClosure: MoyaProvider.immediatelyStub))
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGet_mockFilm_withID_1() throws {
        //Given
        let filmId = "1"
        
        //When
        var filmResponse: Film?
        network.fetchResource(filmId) { (result: Result<Film, MoyaError>) in
            if case let .success(film) = result {
                filmResponse = film
            }
        }
        
        //Then
        XCTAssert(filmResponse != nil)
        XCTAssert(filmResponse?.title == "A New Hope")
        XCTAssertEqual(filmResponse?.title, "A New Hope")
    }
    
    func test_get_list_films() throws {
        //When
        var filmsResponse: ListResource<Film>?
        network.fetchAllResource(pageInfo: .default){ (result: Result<ListResource<Film>, MoyaError>) in
            if case let .success(listResponse) = result {
                filmsResponse = listResponse
            }
        }
        
        //Then
        XCTAssert(filmsResponse != nil)
        XCTAssert(filmsResponse?.results.count == 6)
    }
    
    func test_search_people_with_text_t() throws {
        //Given
        let textSearch = "t"
        
        //When
        var response: ListResource<Person>?
        network.search(textSearch, pageInfo: .default){ (result: Result<ListResource<Person>, MoyaError>) in
            if case let .success(listResponse) = result {
                response = listResponse
            }
        }
        
        //Then
        XCTAssert(response != nil)
        XCTAssert(response?.results.count == 10)
        XCTAssert(response?.results.first?.name == "Darth Vader")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
