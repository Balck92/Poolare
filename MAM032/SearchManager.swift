//
//  SearchManager.swift
//  MAM032
//
//  Created by Lisa Silfversten on 2016-12-11.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
enum Gender {
    case none
    case man
    case woman
}

protocol SearchDidChangeDelegate: class{
    func update()
}

class SearchManager {
    static let instance = SearchManager()
    private init(){}
    weak var delegate: SearchDidChangeDelegate?
    
    
    var animalAllowed = false
    var numberOfPersons = 1
    var minAge = 18
    var maxAge = 99
    var gender: Gender = .none
    var time: Double = 0
    
    var didChange = false {
        didSet {
            delegate?.update()
        }
    }
    
}
