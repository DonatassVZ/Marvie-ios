//
//  FiltersAndSerch.swift
//  Marvie
//
//  Created by Vasiliy Munenko on 11.03.2021.
//

import SwiftUI

struct FiltersAndSerch: View {
    let filtersItems : [Categories2DataItem] = [
        Categories2DataItem(id: 1, imageName: "🔥", catName: "Hot"),
        Categories2DataItem(id: 2, imageName: "👚", catName: "Woman"),
        Categories2DataItem(id: 3, imageName: "👕", catName: "Man"),
        Categories2DataItem(id: 4, imageName: "👙", catName: "Undies")
    ]
    
    let filtersItems2 : [Categories2DataItem] = [
        Categories2DataItem(id: 1, imageName: "😴️", catName: "Relax"),
        Categories2DataItem(id: 2, imageName: "💪", catName: "Gym"),
        Categories2DataItem(id: 3, imageName: "🏊🏻‍♀️", catName: "Swiming"),
        Categories2DataItem(id: 4, imageName: "🚴🏻‍♂️", catName: "Bike"),
        Categories2DataItem(id: 5, imageName: "💦", catName: "Water")
    ]
    
    let filterItems3 : [ CategoriesPicturesViewItem ] = [
        CategoriesPicturesViewItem (id: 1, color: Color.red, text: "🍚"),
        CategoriesPicturesViewItem (id: 2, color: Color.blue, text: "🍒"),
        CategoriesPicturesViewItem (id: 3, color: Color.yellow, text: "🥑"),
        CategoriesPicturesViewItem (id: 4, color: Color.green, text: "🍑"),
        CategoriesPicturesViewItem (id: 5, color: Color.red, text: "🍆"),
        CategoriesPicturesViewItem (id: 6, color: Color.orange, text: "🍚"),
        CategoriesPicturesViewItem (id: 7, color: Color.gray, text: "🍒"),
        CategoriesPicturesViewItem (id: 8, color: Color.pink, text: "🥑"),
        CategoriesPicturesViewItem (id: 9, color: Color.black, text: "🍑")
        ]
    
    var body: some View {
        ScrollView(.vertical) {
            //filter1
            ScrollView(.horizontal){
                HStack{
                    ForEach(filtersItems){ item in
                        Categories2(item: item).padding(6)
                    }
                }.padding(.leading , 20)
            }.padding(.top , 40)
            
            //filter2
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    ForEach(filterItems3){ item in
                        CategoriesPicturesView(item: item)
                    }
                }.padding(.leading , 20)
            }.padding(.top , 20)

            
            
            
            // filter3
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    ForEach(filtersItems2){ item in
                        VStack{
                            CategoriesWithProgressView(item: item).padding(6)
                            
                            Text("\(item.catName)")
                        }
                    }
                }.padding(.leading , 20)
            }.padding(.top , 20)

            //4
            VStack(spacing: 10){
                
                ForEach(filtersItems2){ item in
                    
                    //item-View
                    HStack(spacing:10 ){
                        CategoriesWithProgressView(item: item).padding()
                        Text("\(item.catName)")
                         Spacer()
                        Text("\(300 * item.id) $")
                            .bold()
                            
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.black)
                            .padding(.trailing , 30)
                    }.background(Color.primaryBgTop)
                     .cornerRadius(20)
                     .padding()
                }
            }.padding(.top , 30)
                
        }
        .background(Color.primaryBgBottom)
        .ignoresSafeArea()
        
    }
}

struct FiltersAndSerch_Previews: PreviewProvider {
    static var previews: some View {
        FiltersAndSerch().colorScheme(.dark)
    }
}



struct Categories2 : View {
    
    let wight : CGFloat = 82
    @State var selected : Bool = false
    
    let item : Categories2DataItem
    
    var body: some View {
        Capsule()
            .frame(width: wight, height: 1.8 * wight, alignment: .center)
            .overlay(
               
                    VStack(alignment: .center){
                        Text(item.imageName)
                            .frame(width: 66, height: 66, alignment: .center)
                            .background(Circle()
                                             // border
                                            .overlay(
                                                Circle().stroke(Color.red, lineWidth: 1.5)
                                            )
                                            //selected color
                                            .foregroundColor(selected ? .white : .primaryBgTop)
                            )
        
                
                            .padding(10)
                        
                        Text(item.catName)
                            .foregroundColor(Color.white)
                        Spacer()
                    }.onTapGesture(count: 1, perform: {
                        withAnimation{
                        self.selected.toggle()
                        }
                    })
                
            )
            .foregroundColor(selected ? .red : .primaryBgTop)
    }
}

struct Categories2DataItem : Identifiable {
    
    let id: Int
    let imageName : String
    let catName : String
}

//Categories_WithProgress

struct CategoriesWithProgressView  : View{
    //data
    let item : Categories2DataItem
    
    //param
    let strokeColorLayer = Color.gray
    var strokeColorActive = Color.red
    let lineWight : CGFloat = 3
    let diametr  : CGFloat = 68
    let circleProgress : CGFloat = CGFloat(0.3 + Double.random(in: 0.05...0.5))
    
    var body: some View {
        
        ZStack {
            //...progress line
         RoundedRectangle(cornerRadius: 25.0)
             .stroke(strokeColorLayer, lineWidth: lineWight)
             .frame(width: diametr, height: diametr)
         
         RoundedRectangle(cornerRadius: 25.0)
              .trim(from: 0.0, to: circleProgress)
            .stroke(Color.getRandomColor(index: item.id), style: StrokeStyle(lineWidth: lineWight, lineCap: .round))
              .frame(width: diametr, height: diametr)
              .rotationEffect(Angle(degrees: -90))
            
            Text("\(item.imageName)")
                .font(.title)
            
        }.background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color.primaryBgTop))
    }
}



struct CategoriesPicturesView : View {
    
    @State var isSelected : Bool = false
    let item : CategoriesPicturesViewItem
    
    let height : CGFloat = 64
    
    var body: some View {
        Text("\(item.text)")
            .frame(width: height, height: height)
            
            .onTapGesture(count: 1, perform: {
                withAnimation{
                self.isSelected.toggle()
                }
            })
            .background(item.color.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(1)
            .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(lineWidth: 2.0, antialiased: true)
                        .foregroundColor(isSelected ?  item.color : Color.clear)
                      

                )
            
            .shadow(color: isSelected ?   item.color : .clear, radius: 1, x: 0, y: 0)
            .padding(2)
            
            
            
    }
}


struct  CategoriesPicturesViewItem : Identifiable {
    var id: Int
    
    var color : Color
    var text : String
    
}
