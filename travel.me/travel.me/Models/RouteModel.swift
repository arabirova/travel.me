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
    var lat: Double
    var lon: Double
    
    init(imageURL: String, name: String, description: String, detailDescription: String, lat: Double, lon: Double) {
        self.imageURL = imageURL
        self.name = name
        self.description = description
        self.detailDescription = detailDescription
        self.lat = lat
        self.lon = lon
    }
}
