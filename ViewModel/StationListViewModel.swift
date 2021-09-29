//
//  BusListViewModel.swift
//  BusListViewModel
//
//  Created by Mert Köksal on 29.09.2021.
//
import SwiftUI
import Foundation

class StationListViewModel: ObservableObject {
    @Published var stations: StationModel = StationModel(stations: [])
    
    func getAllStations() {
        WebService().getAllStations() { result  in
            switch result {
            case .success(let stations):
                DispatchQueue.main.async {
                    self.stations = stations
                    print(stations)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
