//
//  SmallCardsPlayView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 19.03.2021.
//

import SwiftUI

struct SmallCardsPlayView: View {
    
    @State var isPlay : Bool = false
    let cardColor : Color  = Color.redPrimary
    
    var body: some View {
        VStack(alignment: .leading){
            Label("Introduce", systemImage: "creditcard")
            
            Text("What is it?")
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text("20 min")
                
                
            
            Button(action: {
                isPlay.toggle()
            }, label: {
                HStack{
                    Image(systemName:  isPlay ?  "pause.circle.fill" :"play.circle.fill")
                        .resizable()
                        .frame(width: 36, height: 36, alignment: .center)
                    Text( isPlay ?  "Pause" : "Start" )
                }
            }).padding(.vertical)
            
            
        }.padding(20)
        .foregroundColor(.white)
        .background(Color.greenPrimary)
        .cornerRadius(20)
    }
}

struct SmallCardsPlayView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCardsPlayView()
    }
}
