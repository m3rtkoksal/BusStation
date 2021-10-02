//
//  BusView.swift
//  BusView
//
//  Created by Mert Köksal on 29.09.2021.
//

import SwiftUI
import MapKit
import CoreLocation

struct BusView: View {
    @Binding var bus : Bus
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40, longitude: 28), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    var body: some View {
        ZStack {
            Color(UIColor.orange)
                .edgesIgnoringSafeArea(.all)
            Map(coordinateRegion: $region, interactionModes: .all, annotationItems: [bus], annotationContent: { (bus) in
                return MapMarker.init(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(bus.location?.latitude ?? 0.0), longitude: CLLocationDegrees(bus.location?.longitude ?? 0.0)))
            })
                .onAppear{
                    self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: bus.location?.latitude ?? 0, longitude: bus.location?.longitude ?? 0), span: MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 0))
                }
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarTitle(bus.plate ?? "", displayMode: .inline)
        }
       
    }
}
