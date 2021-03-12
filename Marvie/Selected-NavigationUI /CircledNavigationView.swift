//
//  CircledNavigationView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 09.03.2021.
//

import SwiftUI

struct CircledNavigationView: View {
    
    @State var isOpenMenu : Bool =  true
    let diametrFrame  : CGFloat = 200
    let diametrButton : CGFloat = 50
    let lineWight : CGFloat  = 80
    
    let menuItems : [CNButtonItem] = [
        CNButtonItem(color: Color.blue, imageName: "bell.fill"),
        CNButtonItem(color: Color.green, imageName: "message"),
        CNButtonItem(color: Color.yellow, imageName: "star.fill"),
        CNButtonItem(color: Color.orange, imageName: "house.fill"),
        CNButtonItem(color: Color.red, imageName: "suit.heart.fill")
    ]
    
    
    var body: some View {
        
            
            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                
                GeometryReader { proxy in
                    
                
                    var centerZ : CGPoint =
                        CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
                    
                    
                    
                    Circle()
                        .stroke(Color.clear , lineWidth: lineWight)
                        .frame(width: isOpenMenu ?  diametrFrame : 0, height: isOpenMenu ?  diametrFrame : 0)
                        .position(x: centerZ.x, y: centerZ.y)
                        
                    
                    Circle()
                        .trim(from: 0.0, to: 0.7)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: lineWight, lineCap: .round))
                         .frame(width: isOpenMenu ?  diametrFrame : 0, height: isOpenMenu ?  diametrFrame : 0)
                         .rotationEffect(Angle(degrees: 145))
                        .position(x: centerZ.x, y: centerZ.y)
                    
                
                    ForEach((0..<menuItems.count) , id: \.self) { index in
                        
                        let angle : CGFloat = CGFloat(Double(30 - index * 60) * Double.pi / 180)
                        let pointP = CGPoint(x: centerZ.x + diametrFrame * cos(angle) / 2  ,
                                             y: centerZ.y + diametrFrame * sin(angle) / 2)
                    
                        Image(systemName: "\(menuItems[index].imageName)")
                            .frame(width: diametrButton, height: diametrButton, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Circle()
                                            .foregroundColor(menuItems[index].color))
                            .position(isOpenMenu ? pointP : centerZ)
                            
                        }
                    
                    
                
                    
                Button(action: {
                    withAnimation {
                        isOpenMenu.toggle()
                    }
                    
                }, label: {
                    
                    
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: diametrButton , height: diametrButton, alignment: .center)
                        .rotationEffect(Angle(degrees:  isOpenMenu ? -45 : 0 ))
                        .background(isOpenMenu ?  Color.white : Color.white)
                       // .position(x: centerZ.x, y: centerZ.y)
                        .clipShape(Circle())
                        
                    
                }).frame(width: diametrButton, height: diametrButton, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .position(x: centerZ.x, y: centerZ.y)
                
                
                    
                    
                    
                
                  
              
           
                }//proxy
        })//Zstack
        
    }
}

//DataModel
struct CNButtonItem {
    let color : Color
    let imageName : String
}


struct CircledNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CircledNavigationView().preferredColorScheme(.dark)
    }
}
