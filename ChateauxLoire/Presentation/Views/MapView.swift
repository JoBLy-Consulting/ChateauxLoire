//
//  ContentView.swift
//  ChateauxLoire
//
//  Created by Johan Guenaoui on 08/02/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    var _castles_ViewModel = Castles_ViewModel()
    
    var body: some View {
        
        Map {
            ForEach(_castles_ViewModel._castles, id:\.id){ castle in
                Marker(castle.name, coordinate: CLLocationCoordinate2D(latitude: castle.latitude, longitude: castle.longitude))
            }
            
        }
        .onAppear(perform: {
            Task {
                await _castles_ViewModel.getCastles()
            }
        })
    }
}

#Preview {
    MapView()
}
