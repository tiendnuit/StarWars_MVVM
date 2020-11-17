//
//  StarshipDetailViewController.swift
//  StartWars
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation
import UIKit
import Combine

class StarshipDetailViewController: BaseViewController, Storyboarded, OverviewResourcePresentable {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    private var dataSource: SectionedTableViewDataSource!
    private var viewModel: StarshipDetailViewModel!
    private var bindings = Set<AnyCancellable>()
    
    static func show(_ item: Starship) {
        let vc = StarshipDetailViewController.instantiate(of: .detail)
        vc.viewModel = StarshipDetailViewModel(item: item)
        UIViewController.topMostController().show(viewController: vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        bindViewModel()
        updateUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.updateHeaderViewHeight()
    }
    
    override func setupComponents() {
        super.setupComponents()
        dataSource = SectionedTableViewDataSource(delegate: self)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }
    
    override func bindViewModel() {
        func bindViewModelToView() {
            let reloadTableHandler: ([Any]) -> Void = { [weak self] _ in
                self?.tableView.reloadData()
            }
            
            viewModel.$items
                .receive(on: RunLoop.main)
                .sink(receiveValue: reloadTableHandler)
                .store(in: &bindings)
            
            let stateHandler: (ViewModelState) -> Void = {[weak self] state in
                switch state {
                case .loading:
                    print("loading....")
                case .stop:
                    print("stop....")
                case .error(let error):
                    print("error....\(error)")
                }
                self?.updateUI()
            }
            
            viewModel.$state
                .receive(on: RunLoop.main)
                .sink(receiveValue: stateHandler)
                .store(in: &bindings)
        }
        
        bindViewModelToView()
    }
    
    override func updateUI() {
        title = viewModel.title
        map(resource: viewModel.item)
    }
    
    
}

// MARK: - ListResourceProtocol
extension StarshipDetailViewController: ListResourceProtocol {
    var vm: DetailViewModelProtocol {
        viewModel
    }
    
}
