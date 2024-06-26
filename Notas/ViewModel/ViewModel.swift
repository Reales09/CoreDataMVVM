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
    @Published var updateItem : Notas!
    
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
    func deleteData(item:Notas, context: NSManagedObjectContext){
        context.delete(item)
//        try! context.save()
        do {
            try context.save()
            print("Elimino")
        } catch let error as NSError {
            //alerta al usuario
            print("NO Elimino", error.localizedDescription)
        }
    }
    func sendData(item: Notas){
        updateItem = item
        nota = item.nota ?? ""
        fecha = item.fecha ?? Date()
        show.toggle()
    }
    
    func editData(context: NSManagedObjectContext){
        updateItem.fecha = fecha
        updateItem.nota = nota
        
        do {
            try context.save()
            print("edito")
            show.toggle()
        } catch let error as NSError {
            print("No edito", error.localizedDescription)
        }
    }
}
