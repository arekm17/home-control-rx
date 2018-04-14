//
//  InfoView.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class InfoView: UIView {
    
    let disposeBag = DisposeBag()
    let infoViewModel: InfoViewModel
    
    let serialNoLabel = UILabel(text: "Serial number:")
    
    let serialNo: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.text = "--asdasdasd-"
        return label
    }()
    
    let macAddrLabel = UILabel(text: "Mac address:")
    
    let macAddr: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.text = "---"
        return label
    }()
    
    let softVerLabel = UILabel(text: "Software version:")
    
    let softVer: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.text = "---"
        return label
    }()
    
    
    init(viewModel: InfoViewModel) {
        self.infoViewModel = viewModel
        super.init(frame: CGRect.zero)
        
        setupView()
        setupConstraints()
        setupBindings()
        
        self.infoViewModel.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("unused constructor")
    }
    
    func setupView() {
        
        addSubview(serialNoLabel)
        addSubview(serialNo)
        addSubview(macAddrLabel)
        addSubview(macAddr)
        addSubview(softVerLabel)
        addSubview(softVer)
        
    }
    
    
    func setupConstraints() {
        
        let labelW = CGFloat(140)
        
        serialNoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            serialNoLabel.topAnchor.constraint(equalTo: self.topAnchor),
            serialNoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            serialNoLabel.widthAnchor.constraint(equalToConstant: labelW)
        ])
            
        serialNo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            serialNo.bottomAnchor.constraint(equalTo: serialNoLabel.bottomAnchor),
            serialNo.leadingAnchor.constraint(equalTo: serialNoLabel.trailingAnchor, constant: 10),
            serialNo.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        macAddrLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            macAddrLabel.topAnchor.constraint(equalTo: serialNoLabel.bottomAnchor, constant: 20),
            macAddrLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            macAddrLabel.widthAnchor.constraint(equalToConstant: labelW)
        ])
        
        macAddr.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            macAddr.bottomAnchor.constraint(equalTo: macAddrLabel.bottomAnchor),
            macAddr.leadingAnchor.constraint(equalTo: macAddrLabel.trailingAnchor, constant: 10),
            macAddr.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])

        softVerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            softVerLabel.topAnchor.constraint(equalTo: macAddrLabel.bottomAnchor, constant: 20),
            softVerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            softVerLabel.widthAnchor.constraint(equalToConstant: labelW),
        ])
        
        softVer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            softVer.bottomAnchor.constraint(equalTo: softVerLabel.bottomAnchor),
            softVer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            softVer.leadingAnchor.constraint(equalTo: softVerLabel.trailingAnchor, constant: 10)
        ])

    }
    
    func setupBindings() {
        
        infoViewModel.serialNumber
            .asObservable()
            .bind(to: self.serialNo.rx.text)
            .disposed(by: disposeBag)
        
        infoViewModel.macAddr
            .asObservable()
            .bind(to: self.macAddr.rx.text)
            .disposed(by: disposeBag)
        
        infoViewModel.softVer
            .asObservable()
            .bind(to: self.softVer.rx.text)
            .disposed(by: disposeBag)
        
    }
    
}
