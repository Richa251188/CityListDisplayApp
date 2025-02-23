//
//  CitiesModel.swift
//  CityListDispaly
//
//  Created by Richa Agrawal on 23/02/25.
//

import Foundation

struct CitiesModel: Codable, Hashable {
    var city: String = ""
    var lat: String = ""
    var lng: String = ""
    var country: String = ""
    var iso2: String = ""
    var admin_name: String = ""
    var capital: String = ""
    var population: String = ""
    var population_proper: String = ""
}

struct ListModel: Codable {
    var stateName: String = ""
    var items: [CitiesModel] = []
    var index: Int = 0
    var isExpand: Bool = false
}
