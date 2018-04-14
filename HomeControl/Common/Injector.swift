//
//  Injector.swift
//  Home Control
//
//  Created by Arek on 09.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import Swinject

class Injector {
    
    private static let injector = Injector()
    
    private let container = Container()
    private let assembler: Assembler
    
    static func shared() -> Injector {
        return injector
    }
    
    private init() {
        assembler = Assembler(container: container)
    }
    
    func setUp() {
        assembler.apply(assemblies: [
            MainAssembly(),
            RoomsAssembly(),
            DevicesAssembly(),
        ])
    }
    
    func resolve<Service>(_ serviceType: Service.Type) -> Service {
        let service: Service? = container.resolve(serviceType)
        return service.unsafelyUnwrapped
    }
    
}
