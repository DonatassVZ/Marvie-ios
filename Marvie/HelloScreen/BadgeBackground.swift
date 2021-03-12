//
//  BadgeBackground.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 04.03.2021.
//

import SwiftUI


struct BadgeBackground: View {
    
    let baseH : CGFloat = 200
    
    let offsetA : CGFloat = 00
    let radius : CGFloat = 20
    var body: some View {
        
        let points : [CGPoint] = [
            
            CGPoint(x: 0+offsetA, y: baseH + offsetA),
            CGPoint(x: baseH / 2 + offsetA, y: CGFloat(baseH  - (sqrt(3)/2 * baseH)) + offsetA),
            CGPoint(x: baseH + offsetA, y: baseH + offsetA),
            
            
        ]
        
        ZStack(alignment: .center){
        Path { path in
//            var width: CGFloat = 200.0
//            let height = width
            path.move(to: points.first!)
            
            points.forEach { (point) in
               path.addLine(to: point)
            }
            

            
            path.move(to: points.first!)
            //1
            path.addPath(
                
                Path{ path1 in
                    path1.move(to: points.first!)
                    points.forEach { (point) in
                        path1.addLine(to: point)
                    }
                                    
                }.offsetBy(dx: 0, dy: 20)
            )
            //2
            path.addPath(
                
                Path{ path2 in
                    path2.move(to: points.first!)
                    points.forEach { (point) in
                        path2.addLine(to: point)
                    }
                    
                                    
                }.offsetBy(dx: 20.0 * (sqrt(2)/2), dy: -20 * sqrt(2)/2)
            )
            //3
            path.addPath(
                
                Path{ path3 in
                    path3.move(to: points.first!)
                    points.forEach { (point) in
                        path3.addLine(to: point)
                    }
                    
                                    
                }.offsetBy(dx: CGFloat(-20.0 * cos(45 * Double.pi / 180)) , dy: -20 * sqrt(2)/2)
            )
            
            path.closeSubpath()
            

            
        }
        .fill(Color.gray)
            
        
        ///circle
        Path{ path in
        points.forEach { (point) in
            path.move(to: point)
            path.addPath(

                Path{ path4 in
                    path4.addArc(center: point, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: false)

                }
            )

        }
        }.fill(Color.gray)
        
        }
        .foregroundColor(.green)
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground().frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
