//
//  Castles_ViewModel.swift
//  ChateauxLoire
//
//  Created by Johan Guenaoui on 08/02/2024.
//
import SwiftUI

@Observable
public class Castles_ViewModel {
    private let _castles_Controller = Castles_Controller()
    public var _castles:[Castle_Model] = []
    
    func getCastles() async {
        self._castles = await _castles_Controller.getCastles()
    }
}
