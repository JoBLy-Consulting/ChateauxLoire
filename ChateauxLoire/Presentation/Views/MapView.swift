//
//  ContentView.swift
//  ChateauxLoire
//
//  Created by Johan Guenaoui on 08/02/2024.
//

import SwiftUI

struct MapView: View {
    var _castles_ViewModel = Castles_ViewModel()
    
    var body: some View {
        
        VStack {
            ForEach(_castles_ViewModel._castles, id:\.id){ castle in
                Text("\(castle.name)")
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
