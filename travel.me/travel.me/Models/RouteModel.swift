//
//  RouteModel.swift
//  travel.me
//
//  Created by Сашка on 24.09.23.
//

import Foundation

class RouteModel {
    var imageURL: String
    var name: String
    var description: String
    
    init(imageURL: String, name: String, description: String) {
        self.imageURL = imageURL
        self.name = name
        self.description = description
    }
}
