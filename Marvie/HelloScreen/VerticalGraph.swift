//
//  VerticalGraph.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 09.03.2021.
//

import SwiftUI

struct VerticalGraph: View {
    let dataGraphs : [VerticalGraphDataItem]  = [
        VerticalGraphDataItem(r: 0.3, g: 0.4, day: "Mon", numberDay: 17),
        VerticalGraphDataItem(r: 0.3, g: 0.4, day: "Tue", numberDay: 18),
        VerticalGraphDataItem(r: 0.3, g: 0.2, day: "Wed", numberDay: 19),
        VerticalGraphDataItem(r: 0.3, g: 0.2, day: "Thu", numberDay: 20),
        VerticalGraphDataItem(r: 0.3, g: 0.2, day: "Fri", numberDay: 21),
        VerticalGraphDataItem(r: 0.2, g: 0.4, day: "Sat", numberDay: 22),
        VerticalGraphDataItem(r: 0.3, g: 0.4, day: "Sun", numberDay: 23)
    ]
    
    var body: some View {
        HStack{
            ForEach(dataGraphs) { item in
                VerticalGraphItem(item: item)
            }
        }.frame(height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
         .padding()
         .background(Color.primaryBgBottom)
         .cornerRadius(15)
        
    }
}

struct VerticalGraph_Previews: PreviewProvider {
    static var previews: some View {
        VerticalGraph().colorScheme(.dark)
    }
}

struct VerticalGraphDataItem : Identifiable {
    
    var id: UUID = UUID()
    let r : CGFloat
    let g : CGFloat
    let day : String
    let numberDay : Int
}



struct VerticalGraphItem: View {

    var item : VerticalGraphDataItem
    
    var body: some View {
        VStack{
            ZStack{
                Capsule()
                    .foregroundColor(.gray)
                VStack{
                    GeometryReader{ proxy in
                        let h = proxy.size.height
                        VStack(spacing: 1){
                            Capsule()
                                .foregroundColor(.clear)
                        Capsule()
                            .frame(height: h * item.r, alignment: .bottom)
                            .foregroundColor(.red)
                            .padding(0)
                            .padding(.bottom, h/100)
                        Capsule()
                            .frame(height: h * item.g, alignment: .bottom)
                            .foregroundColor(.green)
                            .padding(0)
                        }
                    }
                }
            }.padding(2)
            .frame(minWidth: 8, idealWidth: 20, maxWidth: 24, alignment: .center)
            //days
            Text("\(item.numberDay)")
                .font(.title3)
                .padding(.top)
            
            Text("\(item.day)")
                .font(.caption)
                .padding(4)
            
        }
        .frame(width: 44, alignment: .center)
        
    }
}
