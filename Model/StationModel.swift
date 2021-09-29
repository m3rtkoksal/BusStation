//
//  StationModel.swift
//  StationModel
//
//  Created by Mert Köksal on 29.09.2021.
//

import Foundation

struct StationModel: Decodable, Identifiable {
    var id = UUID()
    let stations: [Station]?
    
    enum CodingKeys: String, CodingKey {
        case stations
    }
}

struct Station: Decodable, Identifiable {
    var id = UUID()
    let stationName: String?
    let stationCode: String?
    let location: Location?
    let buses: [Bus]?
    
    enum CodingKeys: String, CodingKey {
        case stationName
        case stationCode
        case location
        case buses
    }
}

