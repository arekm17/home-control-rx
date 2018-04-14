//
//  Result.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

enum Result<T> {
    
    case Success(T)
    case Error(Error)
    
}
