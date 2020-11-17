//
//  UITableView+Utility.swift
//  StartWars
//
//  Created by Scor Doan on 15/11/2020.
//

import Foundation
import UIKit

extension UITableView {
    func updateHeaderViewHeight() {
        if let header = tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: self.bounds.width, height: 0))
            var headerFrame = header.frame
            
            //Comparison necessary to avoid infinite loop
            if headerFrame.height != newSize.height {
                headerFrame.size.height = newSize.height
                header.frame = headerFrame
                tableHeaderView = header
            }
        }
    }
}
