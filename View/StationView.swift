//
//  StationView.swift
//  StationView
//
//  Created by Mert Köksal on 29.09.2021.
//

import SwiftUI

struct StationView: View {
    let screenWidth = UIScreen.main.bounds.width
    @Binding var selectedStation: Station
    @State var isBusSelected: Bool = false
    @State var selectedBus = Bus(remainingTime: 0, plate: "", routeCode: "", icon: "", location: Location(latitude: 0, longitude: 0))
    var body: some View {
        ZStack {
            Color(UIColor.orange)
                .ignoresSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(selectedStation.buses ?? []) { bus in BusCard(bus: bus)
                        .onTapGesture{
                            self.isBusSelected.toggle()
                            selectedBus = bus
                        }
                }
            NavigationLink("", destination: BusView(bus: $selectedBus), isActive: $isBusSelected)
            }
        }
        
        .navigationBarTitle(selectedStation.stationCode ?? "", displayMode: .large)
        .navigationBarBackButtonHidden(false)
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(selectedStation: .constant((Station(stationName: "Station1", stationCode: "S101", location: Location(latitude: 40.995133, longitude: 28.722272), buses: []))))
    }
}

