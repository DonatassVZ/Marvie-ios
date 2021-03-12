//
//  TriangleView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 04.03.2021.
//

import SwiftUI
import CoreGraphics

struct TriangleGraphView: View {
    let maxIndex : Int = 5
    let arr  : Array<Int> = [5,10,15,20]
    let pagging : CGFloat = 20
    
    let heightForRow : CGFloat = 38
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            
            ForEach((1...arr.count).reversed() , id: \.self) { index in
                HStack{
                
                    Text("\(index * 5)%")
                        .frame(width: 250, height: 64 * CGFloat(index) + 40, alignment: .bottom)
                        .padding()
    //                    .background(Color("GreenTriangle").opacity(Double(0.08 + Double(arr.count - index) / Double(arr.count) )))
                        .foregroundColor(Color.black)
                        .background(Color.green.opacity(0.08 + Double(arr.count - index) / Double(arr.count + 1)))
                    
                        .clipShape(TrianShape())
                        
                    
                    Text("🥦")
                        .frame(height: 64 * CGFloat(index) + 40, alignment: .bottom)
                        .padding()
                        
                    
                }
                
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color.primaryBgTop))
        
    }
}

struct TriangleView_Previews: PreviewProvider {
    static var previews: some View {
        TriangleGraphView().colorScheme(.dark)
            
    }
}



struct TriangleShapeView : Shape {
    var baseH : CGFloat
    
    let offsetA : CGFloat = 0
    let radius : CGFloat = 16
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let points : [CGPoint] = [
           
            CGPoint(x: 0 + offsetA , y: baseH + offsetA),
            CGPoint(x: baseH / 2 + offsetA, y: baseH -  sqrt(3)/2  * baseH + offsetA),
            CGPoint(x: baseH + offsetA, y: baseH + offsetA)
    
        ]
        
        path.move(to: points.first!)
        //1
        path.addPath(
            
            Path{ path1 in
                path1.move(to: points.first!)
                points.forEach { (point) in
                    path1.addLine(to: point)
                }
                                
            }.offsetBy(dx: 0, dy: 00)
        )

        
        path.closeSubpath()
        
        return path
    }
    
    

}


struct TrianShape : Shape {
    let radius : CGFloat = 16
    let alphaDeegre  : CGFloat = CGFloat(23 * Double.pi / 180)
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let point1 = CGPoint(x: width/2, y: 0 )
        let point2 = CGPoint(x: width / 2 + (height * tan(alphaDeegre)),
            y: height - radius )
        let point3 = CGPoint(x: width / 2 - (height * tan(alphaDeegre)), y: height - radius)


        let path = CGMutablePath()
      //  path.move(to: CGPoint(x: 0, y: height / 2))
        path.move(to: point3)
        path.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
        path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
        path.addArc(tangent1End: point3, tangent2End: point1, radius: radius)
        
        
        

        path.move(to: CGPoint(x: point2.x - 1.2 * radius, y: point2.y - 1.5))

        
        path.addQuadCurve(to: CGPoint(x: point3.x + 1.2 * radius, y: point3.y - 1.5),
                          control: CGPoint(
                    x: (point2.x + point3.x)/2,
                    y: (point2.y + point3.y) / 2 + radius/2))
    
        let path2 = CGMutablePath()
            
            path2.move(to: point1)
            
         

        
       
        path2.closeSubpath()
        

        
            
       
        
        
        path.closeSubpath()
        
        let path1 = Path(path)
        return path1
    }
    
    
}
