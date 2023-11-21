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
    var lat: String
    var long: String
    var oneCityName: String
    var oneCoordinatesCity: String
    var oneImageCityURL: String
    var oneDescrCity: String

    
    var asDict: [String: Any] {
        var dict = [String: Any]()
        dict["imageURL"] = imageURL
        dict["name"] = name
        dict["description"] = description
        dict["detailDescription"] = detailDescription
        dict["lat"] = lat
        dict["long"] = long
        dict["oneCityName"] = oneCityName
        dict["oneCoordinatesCity"] = oneCoordinatesCity
        dict["oneImageCityURL"] = oneImageCityURL
        dict["oneDescrCity"] = oneDescrCity
        return dict
    }
    
    init(dict: [String: Any]) throws {
        guard let imageURL = dict["imageURL"] as? String,
              let name = dict["name"] as? String,
              let description = dict["description"] as? String,
              let detailDescription = dict["detailDescription"] as? String,
              let lat = dict["lat"] as? String,
              let long = dict["long"] as? String,
              let oneCityName = dict["oneCityName"] as? String,
              let oneCoordinatesCity = dict["oneCoordinatesCity"] as? String,
              let oneImageCityURL = dict["oneImageCityURL"] as? String,
              let oneDescrCity = dict["oneDescrCity"] as? String
              
        else {
            let error = "Parsing contact error"
            print("[Contact parser] \(error)")
            throw error
        }
        
        self.imageURL = imageURL
        self.name = name
        self.description = description
        self.detailDescription = detailDescription
        self.lat = lat
        self.long = long
        self.oneCityName = oneCityName
        self.oneCoordinatesCity = oneCoordinatesCity
        self.oneImageCityURL = oneImageCityURL
        self.oneDescrCity = oneDescrCity
    }
}

extension String: Error {}



