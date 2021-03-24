//
//  ColorView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 10.03.2021.
//

import SwiftUI
import CoreGraphics

struct ColorView: View {
    
    
    
    let arrayAppColors  : Array<Color> = [
        .redPrimary ,    .redSecondary ,    .redTertiary ,
        .orangePrimary , .orangeSecondary , .orangeTertiary ,
        .yellowPrimary , .yellowSecondary , .yellowTertiary ,
        .greenPrimary ,  .greenSecondary ,  .greenTertiary ,
        .bluePrimary ,   .blueSecondary ,   .blueTertiary  ,
        .violetPrimary , .violetSecondary , .violetTertiary
    ]

    
    var body: some View {
        ScrollView{
            Spacer()
            Text("Color Palette")
            ForEach(arrayAppColors , id : \.self ){ colorItem in
                HStack(alignment: .center){
                    Rectangle()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor( colorItem)
                        
                    Text(colorItem.description.deletingPrefix("NamedColor(name:"))
                    
                    Spacer()
                    
                    let col = UIColor(colorItem).cgColor.components?.count
                    Text("\(col ?? 1) \(colorItem.toHex ?? "") ")
                }
            }
            Spacer()
        }
        .padding(.top , 60)
        .background(Color.primaryBgBottom)
        .ignoresSafeArea(.all)
        
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ColorView().colorScheme(.light)
            ColorView().colorScheme(.dark)
        }
    }
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}


extension Color {
    static let primaryBgTop = Color("primaryBgTop")
    static let primaryBgBottom = Color("primaryBgBottom")

    static let redPrimary  = Color("redPrimary")
    static let redSecondary  = Color("redSecondary")
    static let redTertiary  = Color("redTertiary")

    static let orangePrimary  = Color("orangePrimary")
    static let orangeSecondary  = Color("orangeSecondary")
    static let orangeTertiary = Color("orangeTertiary")

    static let greenPrimary = Color("greenPrimary")
    static let greenSecondary = Color("greenSecondary")
    static let greenTertiary = Color("greenTertiary")

    static let yellowPrimary = Color("yellowPrimary")
    static let yellowSecondary = Color("yellowSecondary")
    static let yellowTertiary = Color("yellowTertiary")

    static let bluePrimary = Color("bluePrimary")
    static let blueSecondary = Color("blueSecondary")
    static let blueTertiary = Color("blueTertiary")

    static let violetPrimary = Color("violetPrimary")
    static let violetSecondary = Color("violetSecondary")
    static let violetTertiary = Color("violetTertiary")
    
    static let lightBgColor = Color("lightBgColor")
    
    
    
    // MARK: - Computed Properties

    
    var toHex: String? {
        
       // self.cgColor?.numberOfComponents
      //  return "\(self.cgColor?.numberOfComponents)"
        return toHex()
    }


    // MARK: - From UIColor to String
    
    func toHex(alpha: Bool = false) -> String? {
//            guard let components = cgColor.components, components.count >= 3 else {
//                return nil
//            }
        let uicolor = UIColor(self)
        
        guard let components = uicolor.cgColor.components, uicolor.cgColor.components?.count ?? 2 >= 3 else {
            return nil
        }
        
        

            let r = Float(components[0])
            let g = Float(components[1])
            let b = Float(components[2])
            var a = Float(1.0)

            if components.count >= 4 {
                a = Float(components[3])
            }

            if alpha {
                return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
            } else {
                return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
            }
        }
}
