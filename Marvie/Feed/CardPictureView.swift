//
//  CardPictureView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 18.03.2021.
//

import SwiftUI

enum CardPictureType  {
    case text
    case button
}

struct CardPictureView: View {
    
    let colorCard = Color.red
    
    let cardType : CardPictureType = .text
    
    var body: some View {
        HStack{
        
            Image("cardPictureImg")
           //     .resizable()
                .frame(width: 75, height: 75, alignment: .center)
                .padding()
                .background(Color.lightBgColor)
                .cornerRadius(12)
            
            VStack(alignment: .leading , spacing: 10){
                if cardType == .text {
                Text("Booked for 8 PM ")
                    .font(.title3)
                Text("This is an event manager that will help you choose the most interesting exhibition.")
                    .font(.caption)
                }
                
                if cardType == . button{
                    
                    HStack{
                        Image(systemName: "record.circle")
                            .resizable()
                            .frame(width: 17, height: 17, alignment: .center)
                            .foregroundColor(Color.greenPrimary)
                        Text("Offer Expiring soon ")
                            .font(.caption)
                    }
                    
                    Text("Booked for 8 PM ")
                        .font(.title3)
                    Button(action: {
                        
                    }, label: {
                        VStack{
                            Text("Open")
                                .padding(4)
                                .padding([.horizontal] , 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.greenPrimary))
                                .foregroundColor(Color.white)
                            
                        }
                        
                    })
                }
            }
            Spacer(minLength: 2)
            
            Button(action: {
                
            }, label: {
                VStack{
                    Text(":")
                        .bold()
                        .fontWeight(.heavy)
                        .font(.title)
                        .padding()
                        
                }
                
            })
                 
        }
        .padding()
        .background(Color.primaryBgBottom)
        .cornerRadius(20)
        .padding()

    }
}

struct CardPictureView_Previews: PreviewProvider {
    static var previews: some View {
        CardPictureView()
            .preferredColorScheme(.dark)
    }
}
