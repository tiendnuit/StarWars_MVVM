//
//  Storyboarded.swift
//  StartWars
//
//  Created by Scor Doan on 15/11/2020.
//

import Foundation
import UIKit

enum StoryboardType: String {
    case main, detail
}
protocol Storyboarded {
    static func instantiate(of: StoryboardType) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(of storyboard: StoryboardType) -> Self {
        let pathName = NSStringFromClass(self)
        let className = pathName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard.rawValue.capitalized, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
