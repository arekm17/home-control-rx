//
//  RoomsViewModel.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

class RoomsViewModel {
    
    let getRoomsUseCase: GetRoomsUseCase
    
    var rooms: [Room] = []
    
    var onRoomsLoaded: (() -> ())?
    
    init(getRoomsUseCase: GetRoomsUseCase) {
        self.getRoomsUseCase = getRoomsUseCase
    }
    
    func setup(_ sectionId: Int) {

        getRoomsUseCase.execute(sectionId) { [weak self] rooms in
            self?.rooms = rooms
            self?.onRoomsLoaded?()
        }
    }
    
}
