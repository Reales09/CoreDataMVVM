//
//  addView.swift
//  Notas
//
//  Created by Reales Rectoro Myles Clarence on 6/04/24.
//

import SwiftUI

struct addView: View {
    @ObservedObject var model : ViewModel
    var body: some View {
        VStack{
            Text("Agregar nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.nota)
            Divider()
            DatePicker("Seleccionar fecha", selection: $model.fecha)
            Spacer()
            Button(action:{
                
            }){
                Label(title: {Text("Guardar").foregroundColor(.white ).bold()},
                      icon: {Image(systemName: "plus").foregroundColor(.white)})
            }.padding()
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(Color.blue)
                .cornerRadius(8)
            
        }.padding()
    }
}
