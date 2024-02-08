//
//  Castle_Model.swift
//  ChateauxLoire
//
//  Created by Johan Guenaoui on 08/02/2024.
//
import Foundation

public struct Castle_Model:Identifiable, Codable, Equatable {
    public let id = UUID()
    
    let name:String
    let latitude:Double
    let longitude:Double
}
