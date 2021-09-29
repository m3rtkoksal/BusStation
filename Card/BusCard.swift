//
//  BusCard.swift
//  BusCard
//
//  Created by Mert Köksal on 29.09.2021.
//

import SwiftUI

struct BusCard: View {
    @State var bus: Bus
    var body: some View {
            VStack(alignment:.leading, spacing: 10){
                HStack{
                    Spacer()
                    if #available(iOS 15.0, *) {
                        AsyncImage(url: URL(string: "\(bus.icon ?? "")"))
                            .frame(width: 50, height: 20)
                    } else {
                        // Fallback on earlier versions
                    }
                    Spacer()
                }
                HStack{
                    Text("Remaining Time")
                    Spacer()
                    Text("\(bus.remainingTime ?? 0)")
                }
                HStack{
                    Text("Plate")
                    Spacer()
                    Text(bus.plate ?? "")
                }
                HStack{
                    Text("Route Code")
                    Spacer()
                    Text(bus.routeCode ?? "")
                }
            }
            .padding()
            .background(Color("lightYellow"))
            .foregroundColor(.gray)
            .cornerRadius(15)
            .padding()
    }
}

struct BusCard_Previews: PreviewProvider {
    static var previews: some View {
        BusCard(bus: Bus(remainingTime: 0, plate: "", routeCode: "", icon: "", location: Location(latitude: 0, longitude: 0)))
    }
}
