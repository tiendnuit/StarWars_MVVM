//
//  BaseViewController.swift
//  StartWars
//
//  Created by Scor Doan on 16/11/2020.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, UIViewControllerConfigurable {
    private var backgroundGradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.hexColor("#196068").cgColor,
                                UIColor.hexColor("#111111").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.45)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 1)
        return gradientLayer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        bindViewModel()
        updateUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backgroundGradientLayer.frame = view.bounds
    }
    
    func setupComponents() {
        view.layer.insertSublayer(backgroundGradientLayer, at: 0)
    }
    
    func bindViewModel() {
    }
    
    func updateUI() {
    }
}
