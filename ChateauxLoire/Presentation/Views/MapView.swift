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
    @State private var selectedCastle: UUID?
    
    var body: some View {
        
        Map(position: $position, selection: $selectedCastle) {
            ForEach(_castles_ViewModel._castles, id:\.id){ castle in
                Annotation(castle.name, coordinate: CLLocationCoordinate2D(latitude: castle.latitude, longitude: castle.longitude),anchor: .bottom) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5).fill(.background)
                        RoundedRectangle(cornerRadius: 5).stroke(.purple)
                        Image(systemName: "house.lodge.fill").padding(5).foregroundStyle(.purple)
                    }
                }
                .tag(castle.id)
            }
            
        }
        .mapControls{
            MapUserLocationButton()
            MapPitchToggle()
        }
        .mapStyle(.hybrid(elevation:.realistic))
        .safeAreaInset(edge: .bottom) {
            HStack{
                Spacer()
                VStack(spacing:0){
                    if let selectedCastle {
                        if let item = _castles_ViewModel._castles.first(where: {$0.id == selectedCastle}) {
                            LocationLookAroundView(selectedLocation: item)
                                .frame(height: 128)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .padding([.top, .horizontal])
                        }
                    }
                }
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
        .onChange(of: selectedCastle) {
            guard let selectedCastle else { return}
            guard let item = _castles_ViewModel._castles.first(where: {$0.id == selectedCastle}) else { return }
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
