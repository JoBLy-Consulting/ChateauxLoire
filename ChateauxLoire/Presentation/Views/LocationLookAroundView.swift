//
//  LocationLookAroundView.swift
//  ChateauxLoire
//
//  Created by Johan Guenaoui on 08/02/2024.
//

import SwiftUI
import MapKit

struct LocationLookAroundView: View {
    @State private var lookAroundScene: MKLookAroundScene?
    var selectedLocation: Castle_Model
    
    var body: some View {
        LookAroundPreview(initialScene: lookAroundScene)
            .overlay(alignment: .bottomTrailing) {
                HStack {
                    Text("\(selectedLocation.name)")
                }
                .font(.caption)
                .foregroundStyle(.white)
                .padding(18)
            }
            .onAppear {
                getLookAroundScene()
            }
            .onChange(of: selectedLocation) {
                getLookAroundScene()
            }
    }
    
    func getLookAroundScene() {
        lookAroundScene = nil
        Task {
            let request = MKLookAroundSceneRequest(coordinate: CLLocationCoordinate2D(latitude: selectedLocation.latitude, longitude: selectedLocation.longitude))
            lookAroundScene = try? await request.scene
        }
    }
}

#Preview {
    LocationLookAroundView(selectedLocation: Castle_Model(name: "Angers", latitude: 47.47, longitude: -0.56))
}
