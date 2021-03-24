//
//  GreenBigCardView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 17.03.2021.
//

import SwiftUI

struct GreenBigCardView: View {
    //some variable
    // ....
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "star")
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15.0)
                                        .foregroundColor(Color.white.opacity(0.4)))
                    Text("Weekly \n Progress")
                        .foregroundColor(.white)
                        .padding([.horizontal])
                }.padding(.leading , 10)
                
                Text("It looks like you are on track. Please continue to follow your daily plan")
                    .foregroundColor(.white)
                    .padding(8)
                
            }.padding()
            Spacer()
            
            Button(action: { }, label: {
                Text("ok")
                    .padding()
                    .foregroundColor(Color.greenPrimary)
                    .background((Color.white.clipShape(Circle())))
                    .padding(6)
                    .background(Color.white.opacity(0.4)
                                    .clipShape(Circle()))
                    
            }).padding()
            
        }.background(Color.greenPrimary)
        .cornerRadius(20.0)
    }
}

struct GreenBigCardView_Previews: PreviewProvider {
    static var previews: some View {
        GreenBigCardView().frame(width: 360, height: 200, alignment: .center)
    }
}
