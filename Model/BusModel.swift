//
//  BusModel.swift
//  BusModel
//
//  Created by Mert Köksal on 29.09.2021.
//

import Foundation

struct BusModel: Decodable, Identifiable {
    var id = UUID()
    let buses: [Bus]?
    
    enum CodingKeys: String, CodingKey {
        case buses
    }
}

struct Bus: Decodable, Identifiable {
    var id = UUID()
    let remainingTime: Int?
    let plate: String?
    let routeCode: String?
    let icon: String?
    let location: Location?
    
    enum CodingKeys: String, CodingKey {
        case remainingTime
        case plate
        case routeCode
        case icon
        case location
    }
}

struct Location: Decodable, Hashable {
    var id = UUID()
    let latitude: Double?
    let longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
}
