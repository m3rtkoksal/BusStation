//
//  ContentView.swift
//  Shared
//
//  Created by Mert Köksal on 29.09.2021.
//

import SwiftUI

struct ContentView: View {
    init(){
            UITableView.appearance().backgroundColor = .orange
        }
    @Environment(\.colorScheme) var currentMode
    let screenWidth = UIScreen.main.bounds.width
    @StateObject private var stationListVM = StationListViewModel()
    @State var isStationSelected : Bool = false
    @State var selectedStation = Station(stationName: "", stationCode: "", location: Location(latitude: 0, longitude: 0), buses: [])
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                List{
                    ForEach(stationListVM.stations.stations ?? []) { station in
                        ZStack(alignment: .leading) {
                            Button {
                                self.isStationSelected.toggle()
                                self.selectedStation = station
                            } label: {
                                HStack {
                                    Image(systemName: "rhombus")
                                    Text("\(station.stationName ?? "")")
                                    Spacer()
                                    Text("\(station.stationCode ?? "")")
                                }
                            }
                        }
                    }
                }
               
                    .onAppear {
                        stationListVM.getAllStations()
                    }
                NavigationLink("", destination: StationView(selectedStation: $selectedStation), isActive: $isStationSelected)
                    .preferredColorScheme(.light)
                    .padding()
            }
            .background(Image("BG"))
            .navigationBarTitle("", displayMode: .large)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Text("Stations List")
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .padding(.trailing)
                            .font(.system(size: 20))
                        Spacer()
                        
                    }
                    .frame(width: screenWidth - 20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
