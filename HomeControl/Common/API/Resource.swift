//
//  Resource.swift
//  Home Control
//
//  Created by Arek on 07.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
//
//
//struct Resource {
//
//    typealias ParseMethod = ((Data) throws -> T)
//
//    let url: URL
//    let parseMethod: ParseMethod
//    let expectedStatus: Int
//
//    init<T>(url: URL, parseMethod: @escaping ParseMethod, expectedStatus: Int = 200) {
//        self.url = url
//        self.parseMethod = parseMethod
//        self.expectedStatus = expectedStatus
//    }
//
//}

protocol Resource2Protocol {

    associatedtype T

    var url: URL { get }
    var expectedStatus: Int { get }

    func parseMethod(data: Data) throws -> T

}

struct Resource<R>: Resource2Protocol {
    var url: URL
    
    var expectedStatus: Int
    
    func parseMethod(data: Data) throws -> R {
        return R
    }
    

    typealias T = R
    
}
