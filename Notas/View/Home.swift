//
//  Home.swift
//  Notas
//
//  Created by Reales Rectoro Myles Clarence on 6/04/24.
//

import SwiftUI

struct Home: View {
    @StateObject var model = ViewModel()
    @FetchRequest(entity: Notas.entity(), sortDescriptors: [NSSortDescriptor(key: "fecha", ascending: true)], animation: .spring()) var results : FetchedResults<Notas>
    var body: some View {
        NavigationView{
            List{
                ForEach(results){ item in
                    VStack(alignment: .leading){
                        Text(item.nota ?? "Sin nota")
                            .font(.title)
                            .bold()
                        Text(item.fecha ?? Date(), style: .date)
                    }
                }
            }.navigationBarTitle("Notas")
                .navigationBarItems(trailing: Button(action:{
                    model.show.toggle()
                }){
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                ).sheet(isPresented: $model.show, content: {
                    addView(model: model)
            })
        }
    }
}
