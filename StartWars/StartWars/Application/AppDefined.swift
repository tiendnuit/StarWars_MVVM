//
//  AppDefined.swift
//  StartWars
//
//  Created by Scor Doan on 13/11/2020.
//

import Foundation

struct AppDefined {
    
    static func getStringValue(key: String) -> String {
        guard let info = Bundle.main.infoDictionary else { return ""}
        return info[key] as? String ?? ""
    }
    
    struct SWAPI {
        static var BaseUrl: String {
            return getStringValue(key: "SWBaseURL")
        }
        
        static var Version: String {
            return getStringValue(key: "SWVersion")
        }
        
        static let ITEMS_PER_PAGE           = 10
        static let PEOPLE                   = "people"
        static let FILMS                    = "films"
        static let STARSHIPS                = "starships"
        static let VEHICLES                 = "vehicles"
        static let SPECIES                  = "species"
        static let PLANETS                  = "planets"
    }
    
    static let SW_IMAGES = ["https://robd.net/starwars/images/star-wars/swposter1.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter2.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter3.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter4.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter5jpg",
                  "https://robd.net/starwars/images/star-wars/swposter6.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter7.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter8.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter9.jpg",
                  "https://robd.net/starwars/images/star-wars/return-jedi.jpg",
                  "https://robd.net/starwars/images/star-wars/empire-strickes-back.jpg",
                  "https://robd.net/starwars/images/star-wars/star-wars-original.jpg",
                  "https://robd.net/starwars/images/star-wars/darth-maul-head.png",
                  "https://robd.net/starwars/images/star-wars/boba-fett-helmet.png",
                  "https://robd.net/starwars/images/star-wars/vader-helmet.png",
                  "https://robd.net/starwars/images/star-wars/episodei-ani-skywalker.jpg",
                  "https://robd.net/starwars/images/star-wars/episodeii-imax-yoda.jpg",
                  "https://robd.net/starwars/images/star-wars/episodeii-poster.jpg",
                  "https://robd.net/starwars/images/star-wars/episodeii-padme.jpg",
                  "https://robd.net/starwars/images/star-wars/episodeii_poster1.jpg",
                  "https://robd.net/starwars/images/star-wars/episodeiii_teaser.jpg",
                  "https://robd.net/starwars/images/star-wars/queen-amidala2.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter8.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter7.jpg",
                  "https://robd.net/starwars/images/star-wars/queen-amidala3.jpg",
                  "https://robd.net/starwars/images/star-wars/padme-amidala.jpg",
                  "https://robd.net/starwars/images/star-wars/darth-maul3.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter6.jpg",
                  "https://robd.net/starwars/images/star-wars/desktop-backgrounds/the-force-awakens/Star-Wars-TFA-6.jpg",
                  "https://robd.net/starwars/images/star-wars/swposter4.jpg"]
}
