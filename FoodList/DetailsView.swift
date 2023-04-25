//
//  DetailsView.swift
//  FoodList
//
//  Created by Khensu-Ra Love El on 3/11/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.


import SwiftUI

struct DetailButton: View {
    var text: String
    var imageName: String
    var color: Color
    
    //Sebs code
    var action: () -> () // You need to pass an action through
    
    var body: some View {
        Button(action: {
            //Sebs code
            self.action()
        }) {
            HStack {
                Image(systemName: imageName)
                    .font(.title)
                Text(text)
                    .fontWeight(.semibold)
                    .font(.title)
            }
            .frame(minWidth: 0, maxWidth: 290)
            .padding()
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(40)
        }
    }
}
//click update view
//

struct DetailReading: View {
    var reading: Int
    var imageName: String
    var date: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName:imageName)
                    .resizable()
                    .frame(width:70, height:70)
                    .foregroundColor(.systemRed)
                VStack (alignment: .leading) {
                    Text("Blood Sugar")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    Text("\(reading)")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                    Text("mg/dL")
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("MAY 4")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.white)
                    Text("1:00 PM")
                        .foregroundColor(.white)
                    //    Text("\(date)")
                    //                            .font(.system(size: 15, weight: .medium))
                    //                            .foregroundColor(.white)
                    //                        Text("\(date)")
                    //                            .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
}


struct DetailsView: View {
    //Sebs edits
    @Binding var foodResponse: FoodResponse
    @State var showForm: Bool = false
    
    // var foodResponse: FoodResponse
    
    var body: some View {
        ZStack {
            VStack {

                DetailReading(reading: foodResponse.preReading ?? 0, imageName: "heart.circle", date: Date())
                
                DetailButton(text: "Update", imageName: "pencil", color: Color.systemGreen) {
                    //Sebs edit -- add action to detail button
                    self.showForm = true
                }
//                DetailButton(text: "Delete", imageName: "trash", color: Color.red) {
//
//                }
            }
            .padding()
        }
        .background(Color.black)
        .opacity(0.8)
        .padding()
        .cornerRadius(4)
            .sheet(isPresented: self.$showForm) { //Sebs edit
                FormView(foodResponse: self.$foodResponse)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ///Sebs edit
        DetailsView(foodResponse: .constant(FoodResponse(food: Food(foodIcon: "shop", category: "Breakfast", name: "Pancakes"), date: Date(), preReading: 94)))
        
        //        DetailsView(foodResponse: FoodResponse(food: Food(foodIcon: "shop", category: "Breakfast", name: "Pancakes"), date: Date(), preReading: [94], type: .premeal))
    }
}


