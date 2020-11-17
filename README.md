# StarWars!

An example of MVVM + UIKit + Combine with search and display Star Wars resources from [Star Wars API]([https://swapi.dev/documentation](https://swapi.dev/documentation)).


# Key Features
-  Search and display Star Wars resources
-  Using **Swift** + **MVVM** + **UIKit** + **Combine** + **POP**
-  Using [**Moya**](https://github.com/Moya/Moya) for Network layer
-   Be able to traverse resources by navigating through movies or resources
-   Pull in images of resources with hardcoded URLs


## Requirements
-   iOS 13.0+
-   Xcode 12.2

## Architecture
Using MVVC pattern gives us some benefits like code reuse, ease of testing, bindings make UI updates easier to handle, ease of maintainability.

And splitting off protocols (DataSource and Delegate) into separate objects we can re-use those objects in other view controllers, or use different objects in the same view controller to get different behavior at runtime.
#### 1. Model
![enter image description here](https://lh3.googleusercontent.com/xrUC1pa4u-LKLK2g6tRWDK23RVZ05aD1c0nMnYiD9SfTrZ-aQ1a3uzBlE8Gy6gWGu3EirKfSjz8vg3_1pqCmcs1Ap-C-BvPM81ZQntPN3HRXgVysOvdMm6QygXrRVLdgRvPKp6qquScbo9ifEwzFiZbSb96rJoseWR1E8Fu3IerZ2DjVssWnu8x58qnZDKdOHZ6CwDA2bqRw9851lFnd0Es4BCFEtRiHC8yGKT3oXD-ZP1vVjzG1Rk2PF6cz8EotuO9igQ9G7bl-rWtXmtP26Zy94jrlx4p8b5k9TM9p2crCPmplpVmE4R3Gv9JuoLx6r25B3vwDGdLniDEC-cLKgkVgf5jobEI1PfPsaQRET5In0RAzYJSYvNZms-IukRDTAu1LacHzwaZqaWGQsYWx4BnLDOfJNI-FOGnjRlBdCVF1exTIDFtZrZGxxI14yYdm8McE6s19OI6KgNzzahd2hFd9AMSAJ9MB1CtBsIrEQxhiAmReoskw_h0EYg5PXjt-BPmUw3TmLBK-EJh3UZ4Zsuh5zhwnLc_JgNVHBygULwILuX5CC0L9mSNVrgQJP_cirR4ljJ6dKbTjVf0mn9dmWAQJ3ZA3NosM3ksiOM4H4fiKZGeG9fst9Nv2WZanI96u6zoEjR01gg45YEGg5-8oTiKExi41AI-P5ry5ob1Uj4mxswslifkcUeLoHF3T=w1644-h880-no?authuser=0)

#### 2. Home Screen

![enter image description here](https://lh3.googleusercontent.com/RrQYjkG2A5jrQE8_i9Fb7n08UODjr2kLp-f9Q5VlIPHtznwK-MQpXajO_TUJGd02t8D7-Va6sKnTSqVIOffzRz0dIG0m6KR5Ke7kyE3eaLCcyh4CzxrdsjpTGaaLlF7w9oy_9o_WEw2CS-spCVi5tVCNnRzx1hXoVDylAZT6yAxl1tSjwt9H2ne1XUASEBNaQk2WjpUT5KwFcdB7l9zA4segdC2_s2rAjFNfBRpDZfdskOzigUTy9BCBWMymxY1cztBsyrG3GKYw4gXWpy69XQ-VYiu18cqYIW-nqJ2bbH8WkIDOVoKZZu-3FC5Jk2K7ZO3XR_bKD87XBRBJW8D3vYdXOXqbC51EHTCfE6GiBJ670nH6xbqES-gkUK2bsTfWebZ991hYEeNg2Vo73MZMxv-tFJI7g0t0_d2LnPAFdHCZo3_Utohb3Xv6z4bIbinXNF_PLgfUS7fTfSKwoT3CXCN-Ejt2GUcuNN1h-6jqGCBEO0xwwv-4triRdlgykYHZT5rwTxITCD8vAchdtYtWyB3gxFgsLzg4MHW2OakSlqJs0U7NjqFORXBtGQhCqNX0KFIQv0tBc9ch2cIsuPxx82-__pJT8BBwS2z2pQ9ZHPGKQbBAfzC-zSpu6CQEOlWrLkCHin0wWIVbRucCb0IE7detWNPVlzWtxA3CIgM3HIHH1X60GgJq_mS1OTcd=w1222-h812-no?authuser=0)

#### 3. Detail Screens
![enter image description here](https://lh3.googleusercontent.com/5F2YoS7r9b6axoz554-fjygs_gns9hSkwr5h3dhkVrqutYZ9f_Yb-hfpzk9AulDzBniDcDfZOVr3Od6UM_dbz7be4MGPzr0HP19Y_PvId6KMh3EeOihs5AfP8XNBzL6gcpZEJZh9Q1KNRWmhXkOdGYAphbi_2x79ASO6cshbYC_iSGq67_A0W-Y31AS0JTys9WG-qGRd2Uk3aUFnsRuRral6pkCKBk_aDehSUSGysacZfFxpu7_HC5M6nbj-YaaC3S-a8XPYQhHmaHtzBSr2IMV8vfmSJvaokJifNg1wxsXySNZIJvaFifdUJTGaAiIabWmxxXw7wf_c7CcHpX41xs08MWFT09vN5QxNxcQbYblTV2dRstklbN_e4vQ-Byw9_P7SbT5Hnj7Fd5Umf3fQ1F2j23kI1liMKKBV3TAC6li8t--YG-L_F0yYz_XmKhEDuxsL1moQY4u8vY3vEi6U51GQYwI3V7cUHQxb4zkeRnLy4t0vTlzxEWg8XHn3FI72z7njIMrgikyZoZTAZmRPxJtCcc25yHbVD1-t0AYJzymNUgZRRv1MBop8lEd-dT--T2VYSLBmWR3QsX67cqDLpUFVFRemTLpz-oc73ErQoL-CQQ8hOt5YYgKCPXIGy7mtpE0iTTPjKSJOUBzx5NqKKKiVlcDvM2B1cPC4J_MRN3YBz6u9Tw4j2-anfYDN=w529-h346-no?authuser=0)
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
![enter image description here](https://lh3.googleusercontent.com/vg9TZo0SLppp6WU31aW4ZLtGzjwHIr9DeVEHF5NRSRzyO4wNOhkvqbuMJ2tlu00gIc372mLU8sKG57lTd156S9pANeR77jC39ufCx4uJE-_VBSq2aqju_KlYTEK-r2uNhIr2ZmqUcHLSsh3RsC0Kaxe0jovPH6AhdBOb6jCxwU0AhitQmWpnZT7xsFN3rGeoutW_jgmTBB2OIrGc2XSnilkzDA7CKrFHJYdCUJChcAgnx4ixsWcfMgpeNlBN1_GMPyklphtCzjaTqjOrkT46-RF8NldIlfT_uuyGfDwaIZU8ZdKQi6Gxm_57PA1PvyhMFYGaoLYkad695b53WcNOMoT-QAwj59rhy0FShe7E-V3naOWKQNxae--PotEU4xazC0u-28pO_wYAxvha-H3yt-lppHVfKFWLlyiep6Q8PPGA3PYMVPKDX7uh4EuIm0DvUXFLlJKpLxycV6zu_-XHqDgIcl76CELJNpjZRawNWlcOeTu4rGO41UENRXDufrXi-hTSx6N4urHyeUoe1snIw_V1NgU9gnD6snZKU-L1bs-BbTgKtjWT0_CW0yAfbsEVEyutxnYO1m6yLFHnYrN4np3Cb0fP9cGc6jhRy5boE4cPvcSPQRZRpqvOQZ6SZfXcTFzuAYDDZWFEpfCrsQbSGMjwyNDXJRtq3M3c7zb4gs5z47jdAIa1QB9IVkN8=w780-h402-no?authuser=0)
		

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

## Usage
To run the project, clone the repo, and run `pod install` from the project directory first.

## Screenshot:
![enter image description here](https://lh3.googleusercontent.com/kz7umgIA93myNCCdsc7_T2FSq1sWUah4BPio0J2MRxK86z-U4A_2FuIpoHUWkBR0TZapxZZIh864VqWtvpAxdwsJ6634QCpfhAxZyYRmFeqD9N6i4zhG6bS6sC8F7lbd4hyT8v4AvyXBioJCUKEkABlVwbH6kcLTHcXpMlnihZJwepsqubarooNtYQKcgm96jiL9IqDxdreoT_lP3TrsFiAa5w-Hycm_ExM_zN_Kb48hKuid484Isa48Q765Pnozk1pFISbAztItt4ZkL9Z_9_5hWYzeT91aU7AAhjAe-It-4l1tgDxzZ7_wO4FZ7Eur6JLstCNKV01hxw9g_JFidcP5i_7uwLAFbcN_IZvI8nAi5wsbbnRygHucNiStdNBuaqZCUFa92-y68R8cOT4K1gs2rrmVW3Rdi9egSqQuLsWj7EB-YFbUAw5y0j6REIBMNLDKzL80JM942sUN-rP-CSkrL_nDWWOPq7tcNBgbWtqGKf8_7b6uF6GrzR9N4sX22qVEzrFFNn5Tmv7a1kr0Ll0z1j3Xk8DX0QPckTZdi95N5HHOI6hya81hn3GbQmwUqTCFXD2nEeD8MQeCJjj3v-fUu_TUndrc21K1m2Gd36WHjj8PEUGAPpbQGnziLPcQZJ4viTVsudk7Bj1RrIiiqhE0xhw9jLRTFyNvjY_zMV_lXukGBI7jknTafbPP=w776-h1678-no?authuser=0)
## Author
Tommy Doan, [tiendnuit@gmail.com](mailto:tiendnuit@gmail.com) or [tommy.doan2710@gmail.com](mailto:keyhankam@icloud.com)
