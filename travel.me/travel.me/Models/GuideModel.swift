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
    
    var asDict: [String: Any] {
        var dict = [String: Any]()
        dict["imageURL"] = imageURL
        dict["name"] = name
        dict["description"] = description
        dict["detailDescription"] = detailDescription
        dict["lat"] = lat
        dict["long"] = long
        return dict
    }
    
    init(dict: [String: Any]) throws {
        guard let imageURL = dict["imageURL"] as? String,
              let name = dict["name"] as? String,
              let description = dict["description"] as? String,
              let detailDescription = dict["detailDescription"] as? String,
              let lat = dict["lat"] as? String,
              let long = dict["long"] as? String
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
    }
}


