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
    var detailDescription: String
    var coordinate: String
    
    init(imageURL: String, name: String, description: String, detailDescription: String, coordinate: String) {
        self.imageURL = imageURL
        self.name = name
        self.description = description
        self.detailDescription = detailDescription
        self.coordinate = coordinate
    }
}
