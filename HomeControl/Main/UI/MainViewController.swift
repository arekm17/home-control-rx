//
//  MainViewController.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import UIKit



class MainViewController: UIViewController {
    
    let infoView: UIView
    
    let sectionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Sections:"
        label.font = UIFont.systemFont(ofSize: label.font.pointSize + 2)
        return label
    }()

    let sectionsView: SectionsView
    
    init(infoView: InfoView, sectionsView: SectionsView) {
        self.infoView = infoView
        self.sectionsView = sectionsView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("required costructor")
    }
    
    
    override func viewDidLoad() {
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        self.title = "Home Control"

        view.backgroundColor = .white
        view.addSubview(infoView)
        view.addSubview(sectionsLabel)
        view.addSubview(sectionsView)

    }
    
    
    func setupConstraints() {
        let margins = view.layoutMarginsGuide
        
        infoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 50),
            infoView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10),
            infoView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10),
            infoView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        sectionsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionsLabel.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 40),
            sectionsLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10)
        ])
        
        sectionsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionsView.topAnchor.constraint(equalTo: sectionsLabel.bottomAnchor, constant: 20),
            sectionsView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            sectionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sectionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
   
}
