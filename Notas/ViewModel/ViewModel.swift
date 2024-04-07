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
    
    //CoreData
    
    func savedData(context: NSManagedObjectContext){
        let newNota = Notas(context: context)
        newNota.nota = nota
        newNota.fecha = fecha
        
        do {
            try context.save()
            print("Guardo")
            show.toggle()
        } catch let error as NSError {
            //alerta al usuario
            print("No guardo", error.localizedDescription)
        }
    }
}
