//
//  Resource.swift
//  Home Control
//
//  Created by Arek on 07.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation


struct Resource<T> {
    
    typealias ParseMethod = ((Data) throws -> T)
    
    let url: URL
    let parseMethod: ParseMethod
    let exceptedStatus: Int
    
    init(url: URL, parseMethod: @escaping ParseMethod, exceptedStatus: Int = 200) {
        self.url = url
        self.parseMethod = parseMethod
        self.exceptedStatus = exceptedStatus
    }
    
}
