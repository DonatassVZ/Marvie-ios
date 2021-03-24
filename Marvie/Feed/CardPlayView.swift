//
//  CardPlayView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 18.03.2021.
//

import SwiftUI

struct CardPlayView: View {
    
    var colorCard : Color = Color.greenPrimary
    var progressPlaybutton : CGFloat = 0.72
    
    var body: some View {
        HStack{
        
            Image("cardPlay")
                .resizable()
                .frame(width: 32, height: 32, alignment: .center)
                .padding()
                .background(colorCard)
                .cornerRadius(12)
            
            VStack{
                Text("Booked for 8 PM ")
                Text("Booked for 8 PM ")
            }
            Spacer(minLength: 2)
            
            Button(action: {
                
            }, label: {
                 Image(systemName:"play.fill")
                    .foregroundColor(colorCard)
                    .padding()
                    .background(
                        ZStack{
                            Circle()
                                .opacity(0.4)
                                .foregroundColor(colorCard)
                                
                        Circle()
                            .trim(from: 0.0, to: progressPlaybutton)
                            .stroke(colorCard, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                            .rotationEffect(.init(degrees: -90))
                            
                        
                        }
                    )
                
                
                
            })
            
            
            
        }
        .padding()
        .background(colorCard.opacity(0.3))
        .cornerRadius(20)
        .padding()
    }
}

struct CardPlayView_Previews: PreviewProvider {
    static var previews: some View {
        CardPlayView()
    }
}
