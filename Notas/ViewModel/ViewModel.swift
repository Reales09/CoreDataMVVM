//
//  ViewModel.swift
//  Notas
//
//  Created by Reales Rectoro Myles Clarence on 6/04/24.
//

import Foundation
import CoreData
import SwiftUI


class ViewModel: ObservableObject {
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
}
