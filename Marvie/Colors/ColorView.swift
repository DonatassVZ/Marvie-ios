//
//  ColorView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 10.03.2021.
//

import SwiftUI

struct ColorView: View {
    
     let color1 = Color("GreenTriangle")
    
    var body: some View {
        VStack{
            Spacer()
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Spacer()
        }.ignoresSafeArea()
        .background(color1)
            
        
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}


extension Color {
    static let primaryBgTop = Color("primaryBgTop")
    static let primaryBgBottom = Color("primaryBgBottom")
}
