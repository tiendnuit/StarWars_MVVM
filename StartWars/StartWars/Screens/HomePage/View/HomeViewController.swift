//
//  HomeViewController.swift
//  StartWars
//
//  Created by Scor Doan on 15/11/2020.
//

import Foundation
import UIKit
import Combine
import SVProgressHUD

class HomeViewController: BaseViewController, Storyboarded {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    //private var dataSource: SWDataSource!
    private var dataSource: SectionedTableViewDataSource!
    private var viewModel: HomeViewModel!
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.navigationBar.sizeToFit()
        }
    }
    
    override func setupComponents() {
        super.setupComponents()
        viewModel = HomeViewModel()
        dataSource = SectionedTableViewDataSource(delegate: viewModel)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        let cellIdentifier = "BasicResourceCellView"
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
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
            
            let stateHandler: (ViewModelState) -> Void = { state in
                switch state {
                case .loading:
                    print("loading....")
                    SVProgressHUD.show()
                case .stop:
                    print("stop....")
                    SVProgressHUD.dismiss()
                case .error(let error):
                    print("error....\(error)")
                }
            }
            
            viewModel.$state
                .receive(on: RunLoop.main)
                .sink(receiveValue: stateHandler)
                .store(in: &bindings)
        }
        
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: textField)
            .compactMap { $0.object as? UITextField }
            .compactMap { $0.text }
            .receive(on: RunLoop.main)
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .assign(to: \.searchText, on: viewModel)
            .store(in: &bindings)
        
        bindViewModelToView()
    }
    
    override func updateUI() {
        title = "StarWars"
    }
    
    //MARK: -- Event methods
    @IBAction func segmentValueChanged(_ sender: Any) {
        guard let resourceType = ResourceType(rawValue: segmentControl.selectedSegmentIndex) else { return }
        textField.text = ""
        viewModel.resourceType = resourceType
    }
}
