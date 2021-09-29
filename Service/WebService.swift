//
//  WebService.swift
//  WebService
//
//  Created by Mert Köksal on 29.09.2021.
//

import UIKit
import Combine

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class WebService: ObservableObject {
    func getAllStations(completion: @escaping (Result<StationModel, NetworkError>) -> Void) {
        guard let url = URL(string: "https://private-ba4027-busremainingtime.apiary-mock.com/stations") else { return }
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data =  data, error == nil else {
                completion(.failure(.noData))
                return
            }
            guard let stations = try?
                    JSONDecoder().decode(StationModel.self, from: data) else {
                        completion(.failure(.decodingError))
                        return
                    }
            completion(.success(stations))
        }.resume()
    }
}
