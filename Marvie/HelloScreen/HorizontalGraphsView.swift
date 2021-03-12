//
//  HorizontalGraphsView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 11.03.2021.
//

import SwiftUI

struct HorizontalGraphsView: View {
    
    var progress : CGFloat = 0.75
    
    private var frameProgress : CGFloat {
        get{
            if progress >= 1.0 {
                return CGFloat(1.0)
            }else{
                return CGFloat(progress)
            }
        }
    }
    
    private var widgetColor : Color {
        get{
            if progress >= 0.9{
                return .green
            } else if progress >= 0.55 {
                return .yellow
            } else {
                return .red
            }
        }
    }
    
    ///formater
    
    private var formatter : NumberFormatter {
    let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 2
        return formatter
    }
    
    
    var body: some View {
        HStack{
            Image(systemName: "arrow.up")
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .background(widgetColor)
                .cornerRadius(20)
            
            VStack{
                HStack{
                    Text("Weekly progress")
                        .padding([.bottom , .top ], 12)
                    Spacer(minLength: 2)
                    Text("\(formatter.string(from: NSNumber(value: Double(progress))) ?? "2-")")
                }
                    ////
                Spacer(minLength: 2)
                
        
                Capsule()
                    .frame(height: 12, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.blue)
                    .overlay(                                GeometryReader{ proxy in
                        Capsule().foregroundColor(widgetColor)
                            .frame(width: frameProgress * proxy.size.width, height: 12, alignment: .leading)
                        }
                    )
    
                Spacer()
            }
        }.padding()
        .cornerRadius(15)
        .background(Color.primaryBgTop)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}



struct HorizontalGraphsView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalGraphsView()
            .colorScheme(.dark)
            .frame(width: 340, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
