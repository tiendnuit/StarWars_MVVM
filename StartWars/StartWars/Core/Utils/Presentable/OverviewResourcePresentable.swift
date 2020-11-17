//
//  OverviewResourcePresentable.swift
//  StartWars
//
//  Created by Scor Doan on 15/11/2020.
//

import Foundation
import UIKit
import SDWebImage

protocol OverviewResourcePresentable {
    var titleLabel: UILabel! {set get}
    var subtitleLabel: UILabel! {set get}
    var thumbImageView: UIImageView! {set get}
}

extension OverviewResourcePresentable {
    func map(resource: ResourcePresentable?) {
        guard let resource = resource else { return }
        titleLabel?.text = resource.titleLabelText
        subtitleLabel?.text = resource.subtitleLabelText

        if let imageURL = resource.imageURL {
            thumbImageView?.sd_imageIndicator = SDWebImageActivityIndicator.gray
            thumbImageView?.sd_setImage(with: imageURL)
        } else {
            thumbImageView?.image = nil
        }
    }
}
