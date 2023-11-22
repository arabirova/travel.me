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
    
    var twoCityName: String
    var twoCoordinatesCity: String
    var twoImageCityURL: String
    var twoDescrCity: String
    
    var threeCityName: String
    var threeCoordinatesCity: String
    var threeImageCityURL: String
    var threeDescrCity: String
    
    var fourCityName: String
    var fourCoordinatesCity: String
    var fourImageCityURL: String
    var fourDescrCity: String
    
    var fiveCityName: String
    var fiveCoordinatesCity: String
    var fiveImageCityURL: String
    var fiveDescrCity: String
    
    
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
        
        dict["twoCityName"] = twoCityName
        dict["twoCoordinatesCity"] = twoCoordinatesCity
        dict["twoImageCityURL"] = twoImageCityURL
        dict["twoDescrCity"] = twoDescrCity
        
        dict["threeCityName"] = threeCityName
        dict["threeCoordinatesCity"] = threeCoordinatesCity
        dict["threeImageCityURL"] = threeImageCityURL
        dict["threeDescrCity"] = threeDescrCity
        
        dict["fourCityName"] = fourCityName
        dict["fourCoordinatesCity"] = fourCoordinatesCity
        dict["fourImageCityURL"] = fourImageCityURL
        dict["fourDescrCity"] = fourDescrCity
        
        dict["fiveCityName"] = fiveCityName
        dict["fiveCoordinatesCity"] = fiveCoordinatesCity
        dict["fiveImageCityURL"] = fiveImageCityURL
        dict["fiveDescrCity"] = fiveDescrCity
        
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
              let oneDescrCity = dict["oneDescrCity"] as? String,
              
              let twoCityName = dict["twoCityName"] as? String,
              let twoCoordinatesCity = dict["twoCoordinatesCity"] as? String,
              let twoImageCityURL = dict["twoImageCityURL"] as? String,
              let twoDescrCity = dict["twoDescrCity"] as? String,
              
              let threeCityName = dict["threeCityName"] as? String,
              let threeCoordinatesCity = dict["threeCoordinatesCity"] as? String,
              let threeImageCityURL = dict["threeImageCityURL"] as? String,
              let threeDescrCity = dict["threeDescrCity"] as? String,
              
              let fourCityName = dict["fourCityName"] as? String,
              let fourCoordinatesCity = dict["fourCoordinatesCity"] as? String,
              let fourImageCityURL = dict["fourImageCityURL"] as? String,
              let fourDescrCity = dict["fourDescrCity"] as? String,
              
              let fiveCityName = dict["fiveCityName"] as? String,
              let fiveCoordinatesCity = dict["fiveCoordinatesCity"] as? String,
              let fiveImageCityURL = dict["fiveImageCityURL"] as? String,
              let fiveDescrCity = dict["fiveDescrCity"] as? String
                
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
        
        self.twoCityName = twoCityName
        self.twoCoordinatesCity = twoCoordinatesCity
        self.twoImageCityURL = twoImageCityURL
        self.twoDescrCity = twoDescrCity
        
        self.threeCityName = threeCityName
        self.threeCoordinatesCity = threeCoordinatesCity
        self.threeImageCityURL = threeImageCityURL
        self.threeDescrCity = threeDescrCity
        
        self.fourCityName = fourCityName
        self.fourCoordinatesCity = fourCoordinatesCity
        self.fourImageCityURL = fourImageCityURL
        self.fourDescrCity = fourDescrCity
        
        self.fiveCityName = fiveCityName
        self.fiveCoordinatesCity = fiveCoordinatesCity
        self.fiveImageCityURL = fiveImageCityURL
        self.fiveDescrCity = fiveDescrCity
    }
}

extension String: Error {}



