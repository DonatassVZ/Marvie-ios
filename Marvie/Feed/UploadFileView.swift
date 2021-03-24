//
//  UploadFileView.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 17.03.2021.
//

import SwiftUI

struct UploadFileView: View {
    
    var body: some View {
        VStack {
            HStack{
                Text("Upload file")
                    .font(.title2)
                    .foregroundColor(.white)
                Spacer()
            }.padding([.vertical] , 10)
                
            Text("It looks like you are on track. Please continue to follow your daily plan")
                .font(.body)
                .foregroundColor(.white)
            
            
            Button(action: {
                print("add upload function")
            }, label: {
                HStack{
                    GeometryReader{ proxy in
                        ZStack{
                       
                            RoundedRectangle(cornerRadius: 25.0).stroke(style: StrokeStyle(lineWidth: 1, dash: [10.0])).foregroundColor(.white)
                    

                    Image(systemName: "square.and.arrow.up.fill")
                        .padding()
                        .foregroundColor(Color.redPrimary)
                        .background((Color.white.clipShape(Circle())))
                        .padding(6)
                        .background(Color.white.opacity(0.4)
                                        .clipShape(Circle()))
                            
                            
                    
                            
                        }.frame(width: proxy.size.width, alignment: .center)
                    }//zstack
                    
                }
            }).padding()
        }
        .padding()
        .background(Color.redPrimary)
        .cornerRadius(20)
    }
}

struct UploadFileView_Previews: PreviewProvider {
    static var previews: some View {
        UploadFileView().frame(height: 400)
    }
}
