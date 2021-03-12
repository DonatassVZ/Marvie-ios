//
//  HiGuysUIView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 04.03.2021.
//

import SwiftUI

struct HiGuysUIView: View {
    
    @State private var progress: CGFloat = 0.0
    private let imageOffsetY : CGFloat = -60.0 //
    @State var isLittleScreen : Bool = UIScreen.main.bounds.height > 700 ? true : false
    private let multiplyMinimumValue : CGFloat = 0.6


    var body: some View {
        
        let paddingStandartValue : CGFloat = isLittleScreen ? 20 : 8
        
        VStack(alignment: .leading, spacing: 0) {
            Spacer(minLength: paddingStandartValue)
            Text("Marvie IOS UI Kit")
                .font(.largeTitle)
                .bold()
                .padding(paddingStandartValue)
                .foregroundColor(.white)
            
            Text("Now it’s dark 🌚")
                .font(.title)
                .foregroundColor(.white)
                .padding(paddingStandartValue)
            
            Text("Marvie is your top-notch multipurpose UI kit with bright and friendly colors. Full-featured and handy. Trendy and eye-catching. Created with care of designers and users.")
                .font( isLittleScreen ? .title3 : .caption )
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(20)
            
            Spacer(minLength: 10)
            HStack{
                Spacer()
            Image("Marvie3")
                .resizable()
                .frame(width: isLittleScreen ? 121 : 121 * multiplyMinimumValue ,
                       height: isLittleScreen ?  228 : 228 * multiplyMinimumValue)
            
                .padding(paddingStandartValue)
                .offset(y: imageOffsetY * progress)
                .animation(
                    Animation.easeInOut(duration: 2.5)
                        .repeatForever(autoreverses: true)
                ).onAppear(perform: {
                    withAnimation {
                        self.progress = 1.0
                    }
                })
                
            }
            
        }
        .background(BackgroungHelloView())
        .edgesIgnoringSafeArea(.all)
    
    }
}



struct HiGuysUIView_Previews: PreviewProvider {
    static var previews: some View {
        HiGuysUIView()
    }
}
