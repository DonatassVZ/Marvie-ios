//
//  RadialGraphsViewUI.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 05.03.2021.
//

import SwiftUI

struct RadialGraphsViewUI: View {
    
    var body: some View {
        
        HStack{
            ZStack{
                ForEach((0...3) , id: \.self) { index in
                    let progress = CGFloat(0.8 - Double(0.15 * Double(index)))
                    RadialGraphUI(
                        circleProgress: progress,
                        diametr: CGFloat(40 + 32*index),
                        strokeColorActive: Color.getRandomColor(index: index), strokeColorLayer: .gray, lineWight: 8)
                }
                
            }.padding([.bottom , .top , .leading])

            VStack(alignment: .leading) {
                Text("Weekly progress")
                    .font(.title3)
                    .fontWeight(.semibold)
                ForEach((0...3) , id: \.self) { index in
                    
                    HStack{
                        Capsule().frame(width: 15, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.getRandomColor(index: index))
                        Text("to start working \(index)")
                            .font(.caption)
                            .padding(4)
                    }
                }
                
            }.padding()
            
        }.background(Color.primaryBgBottom)
         .cornerRadius(12)
    }
    

    
}

extension Color{
    
   static func getRandomColor(index: Int) -> Color {
        
        switch index % 4 {
        case 0:
            return Color.green
        case 1:
             return Color.red
        case 2:
            return Color.yellow
        case 3:
            return Color.blue
        default:
            return Color.blue
        }
    }
}

struct RadialGraphsViewUI_Previews: PreviewProvider {
    static var previews: some View {
        RadialGraphsViewUI().colorScheme(.dark)
            
    }
}



struct RadialGraphUI : View {
    
    @State var circleProgress: CGFloat  = 0.25
    var diametr : CGFloat = 50
    var strokeColorActive : Color = Color.blue
    var strokeColorLayer : Color = .gray
    var lineWight : CGFloat = 10
       
       var body: some View {
           VStack {
               ZStack {
                   //...
                Circle()
                    .stroke(strokeColorLayer, lineWidth: lineWight)
                    .frame(width: diametr, height: diametr)
                
                Circle()
                     .trim(from: 0.0, to: circleProgress)
                    .stroke(strokeColorActive, style: StrokeStyle(lineWidth: lineWight, lineCap: .round))
                     .frame(width: diametr, height: diametr)
                     .rotationEffect(Angle(degrees: -90))
               }

           }
       }
}


