//
//  Castle_Model.swift
//  ChateauxLoire
//
//  Created by Johan Guenaoui on 08/02/2024.
//
import Foundation

public struct Castle_Model:Identifiable, Codable {
    public let id = UUID()
    
    let name:String
    let latitude:Float
    let longitude:Float
}
