//
//  NewEntryButton.swift
//  FoodList
//
//  Created by Khensu-Ra Love El on 3/23/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.
//

import SwiftUI

struct NewEntryButton: View {
    //Sebs Edit
    @Binding var foodResponse: FoodResponse
    
    //Original code
    //@ObservedObject var foodModel: FoodModel
    
    var body: some View {
        NavigationView {
            VStack {
                //created a navigation view that
                //links to the  form view
                NavigationLink(destination: FormView(foodResponse: $foodResponse)){
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width:25, height: 25)
                }
                .frame(width:40, height: 40)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
            
        
                // Original Code
                //                NavigationLink(destination: FormView(foodModel: foodModel)){
                //                    Image(systemName: "plus")
                //                        .resizable()
                //                        .frame(width:25, height: 25)
                //                }
                //                .frame(width:40, height: 40)
                //                .background(Color.orange)
                //                .foregroundColor(.white)
                //                .cornerRadius(10)
            }
        }
        
    }
    
}

struct NewEntryButton_Previews: PreviewProvider {
    static var previews: some View {
        //Sebs Edit
        NewEntryButton(foodResponse: .constant(FoodResponse(food: Food(foodIcon: "", category: "", name: ""), date: Date())))
        
        //NewEntryButton(foodModel: FoodModel())
    }
}
