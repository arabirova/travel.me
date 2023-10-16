//
//  Environment.swift
//  travel.me
//
//  Created by Сашка on 15.10.23.
//

import Foundation
import FirebaseDatabase

struct Environment {
    static let ref = Database.database(url: "https://travelme-46ed4-default-rtdb.europe-west1.firebasedatabase.app/").reference()
}
