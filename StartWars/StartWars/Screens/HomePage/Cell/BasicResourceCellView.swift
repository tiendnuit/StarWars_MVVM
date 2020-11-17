//
//  BasicResourceCellView.swift
//  StartWars
//
//  Created by Scor Doan on 15/11/2020.
//

import Foundation
import UIKit

class BasicResourceCellView: UITableViewCell, Configurable, OverviewResourcePresentable {
    @IBOutlet var thumbImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(item: Any) {
        map(resource: item as? ResourcePresentable)
    }
}
