# StarWars!

An example of MVVM + UIKit + Combine with search and display Star Wars resources from [**Star Wars API**](https://swapi.dev/documentation).


# Key Features
-  Search and display Star Wars resources
-  Using **Swift** + **MVVM** + **UIKit** + **Combine** + **POP**
-  Using [**Moya**](https://github.com/Moya/Moya) for Network layer
-  Be able to traverse resources by navigating through movies or resources
-  Pull in images of resources with hardcoded URLs
-  Cache fetched resources in memory


## Requirements
-   iOS 13.0+
-   Xcode 12.2

## Architecture
Using MVVC pattern gives us some benefits like code reuse, ease of testing, bindings make UI updates easier to handle, ease of maintainability.

And splitting off protocols (DataSource and Delegate) into separate objects we can re-use those objects in other view controllers, or use different objects in the same view controller to get different behavior at runtime.
#### 1. Model
<a href="https://drive.google.com/uc?export=view&id=1GtO2n8shjs9skMGV-5Jnihv_rgI9KugM"><img src="https://drive.google.com/uc?export=view&id=1GtO2n8shjs9skMGV-5Jnihv_rgI9KugM" style="width: 650px; max-width: 100%; height: auto" title="Click to enlarge picture" />

#### 2. Home Screen

<a href="https://drive.google.com/uc?export=view&id=13EyMOlOn1zV7XJFV7eMA9eL0AKmNm-o_"><img src="https://drive.google.com/uc?export=view&id=13EyMOlOn1zV7XJFV7eMA9eL0AKmNm-o_" style="width: 650px; max-width: 100%; height: auto" title="Click to enlarge picture" />
	
#### 3. Detail Screens

<a href="https://drive.google.com/uc?export=view&id=1jA84R4qavEaDvAVykgh78GOdmJUfkWgf"><img src="https://drive.google.com/uc?export=view&id=1jA84R4qavEaDvAVykgh78GOdmJUfkWgf" style="width: 650px; max-width: 100%; height: auto" title="Click to enlarge picture" />
	

##### DetailViewModelProtocol
		

    protocol DetailViewModelProtocol {
	    var sections: [ResourcesSection] { get }
	    func numberOfItems(at section: Int) -> Int
	    func numberOfSections() -> Int
	    func item(at indexPath: IndexPath) -> ResourcePresentable?
	    func resourceDetail(at: IndexPath)
	    func titleForHeader(_ at: Int) -> String
	    func fetchDetail()
	}

#### 4. Network
The **MoyaProvider<SWAPI>** is an independence injection in **NetworkManager**, it is loosely coupled and thus easy to use for another purpose like debugging and testing.
<a href="https://drive.google.com/uc?export=view&id=1KV0I9jmAXChFKSc-KuR9rjkMd8glctGK"><img src="https://drive.google.com/uc?export=view&id=1KV0I9jmAXChFKSc-KuR9rjkMd8glctGK" style="width: 650px; max-width: 100%; height: auto" title="Click to enlarge picture" />
		

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

## Unit Test

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
    }

## Next Features
- Implement Paging on HomePage
- Apply Coordinator pattern
- Using Combine in Network layer
- Replace UIKit by SwiftUI

## Usage
To run the project, clone the repo, and run `pod install` from the project directory first.

## Screenshot:
<a href="https://drive.google.com/uc?export=view&id=https://drive.google.com/file/d/1m952nxhpmibEpw5P4etHtrWuh8_c-xT4"><img src="https://drive.google.com/uc?export=view&id=https://drive.google.com/file/d/1m952nxhpmibEpw5P4etHtrWuh8_c-xT4" style="width: 650px; max-width: 100%; height: auto" title="Click to enlarge picture" />

## Author
Tommy Doan, [tiendnuit@gmail.com](mailto:tiendnuit@gmail.com) or [tommy.doan2710@gmail.com](mailto:keyhankam@icloud.com)
