//
//  YellowBigCardView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 18.03.2021.
//

import SwiftUI

struct YellowBigCardView: View {
    
    
    var body: some View {
        VStack{
            Image("yellowGifCard")
                .padding()
            
            Text("Weekly progress")
                .bold()
                .padding(8)
            
            Text("It looks like you are on track. Please continue to follow your daily plan")
                .padding()
                .padding(.bottom , 10)
        }.padding()
        .foregroundColor(.white)
        .background(BackgroungYellowCardView())
        .cornerRadius(20)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
    }
}




struct YellowBigCardView_Previews: PreviewProvider {
    static var previews: some View {
        YellowBigCardView().colorScheme(.dark)
    }
}


//
struct BackgroungYellowCardView : View {
    
    var body : some View {
        HStack(alignment: .center , spacing: 0) {
                VStack{
                    Rectangle().hidden()
                  
                    RoundedRectangle(cornerRadius: 25.0)
                        .offset(x: 0, y: 0.0)
                        .foregroundColor(Color.yellowPrimary)
                }.frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity)
                
                VStack{
                    RoundedRectangle(cornerRadius: 25.0)

                        .offset(x: 0, y: -0.0)
                        .foregroundColor(Color.yellowPrimary)
                        
                    Rectangle().hidden()
                }.frame(minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity)
                
                VStack{
                    Circle().hidden()
            
                    Circle()
                        .padding(10)
                        .offset(x: -20, y: 10.0)
                    Circle().hidden()
                    
                }.aspectRatio(contentMode: .fit)
                .foregroundColor(Color.yellowPrimary)
                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       minHeight: 0,
                                       maxHeight: .infinity)
               
                

            
        }.aspectRatio(contentMode: .fill)
        .background(Color.yellowSecondary)


        
    }
}
