//
//  CordinatesModel.swift
//  travel.me
//
//  Created by Сашка on 20.11.23.
//

import Foundation

class CordinatesModel {
    var lat: [String]
    var long: [String]
    
    var asDict: [[String]: Any] {
        var dict = [[String]: Any]()
        dict[["lat"]] = lat
        dict[["long"]] = long
        return dict
    }
    
    init(dict: [[String]: Any]) throws {
        guard let lat = dict[["lat"]] as? [String],
              let long = dict[["long"]] as? [String]
        else {
            let error = "Parsing contact error"
            print("[Contact parser] \(error)")
            throw error
        }
        
        self.lat = lat
        self.long = long
    }
}
