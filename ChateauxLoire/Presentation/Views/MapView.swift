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
    @State private var position:MapCameraPosition = .automatic
    
    var body: some View {
        
        Map(position: $position) {
            ForEach(_castles_ViewModel._castles, id:\.id){ castle in
                Annotation(castle.name, coordinate: CLLocationCoordinate2D(latitude: castle.latitude, longitude: castle.longitude),anchor: .bottom) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5).fill(.background)
                        RoundedRectangle(cornerRadius: 5).stroke(.purple)
                        Image(systemName: "house.lodge.fill").padding(5).foregroundStyle(.purple)
                    }
                }
            }
            
        }
        .mapStyle(.hybrid(elevation:.realistic))
        .safeAreaInset(edge: .bottom) {
            HStack{
                Spacer()
                Button(action: {
                    position = .automatic
                }, label: {
                    Text("Center")
                })
                .buttonStyle(.borderedProminent)
                .padding(.top)
                Spacer()
            }
            .background(.white)
            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
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
