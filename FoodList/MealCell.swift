//
//  MealCell.swift
//  FoodList
//
//  Created by Khensu-Ra Love El on 4/4/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.
//

import SwiftUI



struct MealCell: View {
    var foodResponse: FoodResponse
    
    func foodSymbol (category: String) -> String {
        switch category {
        case "Breakfast":
            return "B"
            
        case "Lunch":
               return "L"
            
        case "Dinner":
            return "D"
            
        case "Snack":
               return "S"
            
        default:
            return "N"
        }
    }
    
    func foodColor(category: String) -> Color {
        switch category {
        case "Breakfast":
            return Color.systemOrange
            
        case "Lunch":
               return Color.systemOrange
        case "Dinner":
            return Color.systemIndigo
            
        case "Snack":
            return Color.systemPink
            
        default:
            return Color.gray
        }
    }

    var body: some View {
        VStack {
            HStack {
//                Image(foodResponse.food.foodIcon)
//                    .resizable()
//                    .frame(width:70, height:70)
                       Text(foodSymbol(category: foodResponse.food.category))
                           .font(.largeTitle)
                           .fontWeight(.black)
                           .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.white,.orange, .orange,.orange ]), startPoint: .top, endPoint: .bottom))
                           .clipShape(Circle())
                        .foregroundColor(.white)
                

                VStack(alignment: .leading) {
                    Text(foodResponse.food.name)
                        .font(.system(size: 20, weight: .medium))
                    Text(foodResponse.food.category)
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Text("Details")
                    .font(.system(size: 13))
                    .fontWeight(.medium)
                    .foregroundColor(Color.systemGreen)
                    .padding(.bottom)
            }
            .padding()
        }
        
    }
    
}
//struct MealCell_Previews: PreviewProvider {
//    static var previews: some View {
//        MealCell()
//    }
//}

struct MealCell_Previews: PreviewProvider {
    static var previews: some View {
        MealCell(foodResponse: FoodResponse(food: Food(foodIcon:"shop", category: "Breakfast", name: "Chicken"), date: Date()))
    }
}
