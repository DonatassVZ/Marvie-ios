//
//  BackgroundHelloView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 04.03.2021.
//

import SwiftUI

struct BackgroungHelloView : View {
    
    var body : some View {
        VStack(spacing: 10){
            HStack{
                Spacer()
                Rectangle()
                    .frame(width: 140, height: 140, alignment: .center)
                    .cornerRadius(25)
                    .padding(.all, 20)
                    .foregroundColor(Color.redPrimary)
            }
            HStack{
                Circle()
                    .frame(width: 120, height: 120, alignment: .topLeading)
                    .padding(.leading, -60)
                    .foregroundColor(Color.redPrimary)
                Spacer()
            }
               Spacer()
            HStack{
                Spacer()
                Spacer()
                Rectangle()
                    .frame(width: 160, height: 160, alignment: .center)
                    .cornerRadius(25)
                    .foregroundColor(Color.redPrimary)
                Spacer()
            }
            
            Spacer()
            HStack{
                Rectangle()
                    .frame(width: 170, height: 170, alignment: .center)
                     .cornerRadius(25)
                    .offset(x: -20, y: 30)
                    .foregroundColor(Color.redPrimary)

                Spacer()
            }
            
        }.background(Color.redSecondary)
    }
}

struct BackgroundHelloUIView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroungHelloView().ignoresSafeArea()
    }
}
