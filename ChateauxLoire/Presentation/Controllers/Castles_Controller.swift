//
//  Castles_Controller.swift
//  ChateauxLoire
//
//  Created by Johan Guenaoui on 08/02/2024.
//

public struct Castles_Controller {
    let _castles_DataConnector = DataConnector()
    
    public func getCastles() async -> [Castle_Model] {
        return await _castles_DataConnector.getCastles()
    }
}
