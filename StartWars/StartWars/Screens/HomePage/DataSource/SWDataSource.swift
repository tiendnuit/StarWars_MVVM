//
//  SWDataSource.swift
//  StartWars
//
//  Created by Scor Doan on 14/11/2020.
//

import Foundation
import UIKit

class SWDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    weak var delegate: ListResourceProtocol?
    
    init(delegate: ListResourceProtocol) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.numberOfItems(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //fatalError("This method must be overriden")
        guard let item = delegate?.item(at: indexPath) else {
            fatalError("Item not exists")
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicResourceCellView", for: indexPath) as? BasicResourceCellView else {
            fatalError("Cell not exists")
        }
        
        cell.configure(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.itemSelected(at: indexPath)
    }
    
}
