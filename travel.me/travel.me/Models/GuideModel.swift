//
//  GuideModel.swift
//  travel.me
//
//  Created by Сашка on 21.10.23.
//

import Foundation

class GuideModel {
    var imageURL: String
    var name: String
    var description: String
    var detailDescription: String
    var lat: String
    var long: String
    var transport: String
    var transportImageURL: String
    var housing: String
    var housingImageURL: String
    var culture: String
    var cultureImageURL: String
    var food: String
    var foodImageURL: String
    
    var asDict: [String: Any] {
        var dict = [String: Any]()
        dict["imageURL"] = imageURL
        dict["name"] = name
        dict["description"] = description
        dict["detailDescription"] = detailDescription
        dict["lat"] = lat
        dict["long"] = long
        dict["transport"] = transport
        dict["transportImageURL"] = transportImageURL
        dict["housing"] = housing
        dict["housingImageURL"] = housingImageURL
        dict["culture"] = culture
        dict["cultureImageURL"] = cultureImageURL
        dict["food"] = food
        dict["foodImageURL"] = foodImageURL
        return dict
    }
    
    init(dict: [String: Any]) throws {
        guard let imageURL = dict["imageURL"] as? String,
              let name = dict["name"] as? String,
              let description = dict["description"] as? String,
              let detailDescription = dict["detailDescription"] as? String,
              let lat = dict["lat"] as? String,
              let long = dict["long"] as? String,
              let transport = dict["transport"] as? String,
              let transportImageURL = dict["transportImageURL"] as? String,
              let housing = dict["housing"] as? String,
              let housingImageURL = dict["housingImageURL"] as? String,
              let culture = dict["culture"] as? String,
              let cultureImageURL = dict["cultureImageURL"] as? String,
              let food = dict["food"] as? String,
              let foodImageURL = dict["foodImageURL"] as? String
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
        self.transport = transport
        self.transportImageURL = transportImageURL
        self.housing = housing
        self.housingImageURL = housingImageURL
        self.culture = culture
        self.cultureImageURL = cultureImageURL
        self.food = food
        self.foodImageURL = foodImageURL
    }
}


