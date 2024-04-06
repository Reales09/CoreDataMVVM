//
//  Home.swift
//  Notas
//
//  Created by Reales Rectoro Myles Clarence on 6/04/24.
//

import SwiftUI

struct Home: View {
    @StateObject var model = ViewModel()
    var body: some View {
        Button(action:{
            model.show.toggle()
        }){
            Text("+")
        }.sheet(isPresented: $model.show, content: {
            addView(model: model)
        })
    }
}
