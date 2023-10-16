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

    
    var asDict: [String: Any] {
        var dict = [String: Any]()
        dict["imageURL"] = imageURL
        dict["name"] = name
        dict["description"] = description
        dict["detailDescription"] = detailDescription
        return dict
    }
    
    init(imageURL: String, name: String, description: String, detailDescription: String) {
        self.imageURL = imageURL
        self.name = name
        self.description = description
        self.detailDescription = detailDescription

    }
    
    init(dict: [String: Any]) throws {
        guard let imageURL = dict["imageURL"] as? String,
              let name = dict["name"] as? String,
              let description = dict["description"] as? String,
              let detailDescription = dict["detailDescription"] as? String
        else {
            let error = "Parsing contact error"
            print("[Contact parser] \(error)")
            throw error
        }
        
        self.imageURL = imageURL
        self.name = name
        self.description = description
        self.detailDescription = detailDescription
    }
}

extension String: Error {}



