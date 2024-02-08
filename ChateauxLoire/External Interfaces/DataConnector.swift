//
//  DataConnector.swift
//  ChateauxLoire
//
//  Created by Johan Guenaoui on 08/02/2024.
//
import Foundation

public struct DataConnector {
    public func getCastles() async -> [Castle_Model] {
        
        var castles:[Castle_Model] = []
        
        if let path = Bundle.main.url(forResource: "Locations", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                
                if let decodedResponse = try? JSONDecoder().decode([Castle_Model].self, from: data) {
                    castles = decodedResponse
                } else {
                    print("Unable to fetch data")
                }
            } catch {
                print("invalid data")
            }
        }
        return castles
    }
}
