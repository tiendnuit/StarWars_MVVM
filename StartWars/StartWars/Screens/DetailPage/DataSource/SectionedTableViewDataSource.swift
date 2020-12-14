//
//  SectionedTableViewDataSource.swift
//  StartWars
//
//  Created by Scor Doan on 15/11/2020.
//

import Foundation
import UIKit

class SectionedTableViewDataSource: NSObject {
    weak var delegate: ListResourceProtocol?
    
    init(delegate: ListResourceProtocol?) {
        self.delegate = delegate
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension SectionedTableViewDataSource: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        delegate?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate?.numberOfItems(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ResourceCellView"
        guard let item = delegate?.item(at: indexPath) else {
            fatalError("Item not exists")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = item.titleLabelText
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        delegate?.titleForHeader(section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.itemSelected(at: indexPath)
    }
    
}
