//
//  ContentView.swift
//  FoodList
//
//  Created by Khensu-Ra Love El on 3/11/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.
//

import SwiftUI
import UIKit

enum MealType: CaseIterable {
    case premeal
    case postmeal
    
    var displayName: String {
        switch self {
        case .premeal:
            return "Pre-meal"
        case .postmeal:
            return "Post-meal"
        }
    }
}

struct FoodResponse: Identifiable {
    var id = UUID()
    var food: Food
    var date: Date
    //    var reading: [Int]
    var preReading: Int? = nil
    var postReading: Int? = nil
    
}

struct Food {
    var id = UUID()
    var foodIcon: String
    var category: String
    var name: String
}


class FoodModel: ObservableObject {
    //Updated list to an array of FoodResponses
    @Published var foodResponses = [FoodResponse]()
    
    init () {
        //Hard coded 4 food reponses to add to the list
        let food1 = Food(foodIcon: "shop", category: "Breakfast", name: "Pancakes")
        let response1 = FoodResponse(food: food1, date: Date(), preReading: 150)
        
        let food2 = Food(foodIcon: "shop", category: "Lunch", name: "Impossible Burger")
        let response2 = FoodResponse( food: food2, date: Date(), preReading: 90)
        
        let food3 = Food(foodIcon: "shop", category: "Dinner", name: "Vegan Lasagna")
        let response3 = FoodResponse(food: food3, date: Date(), preReading: 100)
        
        let food4 = Food( foodIcon: "shop", category: "Snack", name: "Trailmix")
        let response4 = FoodResponse(food: food4, date: Date(), preReading: 70)
        
        //add hard coded responses to array
        foodResponses.append(contentsOf: [response1, response2, response3, response4])
        //
        //        foodResponses.append(response1)
        //        foodResponses.append(response2)
        //        foodResponses.append(response3)
        //        foodResponses.append(response4)
    }
    
}


struct ContentView: View {
    @ObservedObject var foodModel: FoodModel
    @State var showModal = false
    @State var selectedResponseIndex: Int = 0
    //    @State var selectedFoodResponse: FoodResponse? = nil
    @State var showFormModal = false
    
    ///delete Meal cell function///
    func deleteMealCell(at offsets: IndexSet) {
        print("deleting")
        print(offsets)
        foodModel.foodResponses.remove(atOffsets: offsets)
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Latest Entries")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        // Start a new entry
                        let newResponse = FoodResponse(food: Food(foodIcon: "shop", category: "", name: ""), date: Date())
                        
                        self.foodModel.foodResponses.append(newResponse)
                         
                        self.selectedResponseIndex = self.foodModel.foodResponses.count - 1
                        
                        self.showFormModal.toggle()
//                        print(self.foodModel.foodResponse)
                       
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .background(Color.clear)
                            .foregroundColor(.green)
                            .cornerRadius(20)
                        
                    } .frame(width: 35, height: 35)
                        
                    .sheet(isPresented: self.$showFormModal) {
                        FormView(foodResponse: self.$foodModel.foodResponses[self.selectedResponseIndex])
                        
                    }
                    //                        .sheet(isPresented: self.$showFormModal) {
                    //                            FormView(foodModel: self.foodModel)
                    //                    }
                }
                .padding()
                List {
                    //Sebastian & Nien Implementation///
                    // *********
                    ForEach(self.foodModel.foodResponses.indices, id: \.self) { index in
                        Button(action: {
                            self.selectedResponseIndex = index
                            self.showModal.toggle()
                            print("here")
                        }) {
                            MealCell(foodResponse: self.foodModel.foodResponses[index])
                        }
                        .buttonStyle(PlainButtonStyle())
                        .background(Color.systemGray4)
                        .cornerRadius(30)
                        .padding()
                        
                    }
                    .onDelete(perform: deleteMealCell)
                    .sheet(isPresented: self.$showModal) {
                        DetailsView(foodResponse: self.$foodModel.foodResponses[self.selectedResponseIndex])
                        // DetailsView(foodResponse: self.selectedFoodResponse!)
                    }
                    
                    //My Implementation///
                    
                    // ForEach(self.foodModel.foodResponses) { foodResponse in
                    //                        Button(action: {
                    //                            self.selectedFoodResponse = foodResponse
                    //                            self.showModal.toggle()
                    //                        }) {
                    //                            MealCell(foodResponse: foodResponse)
                    //                        }
                    //                        .buttonStyle(PlainButtonStyle())
                    //                        .background(Color.orange)
                    //                        .cornerRadius(50)
                    //                        .padding()
                    //
                    //                    }
                    //                    .onDelete(perform: deleteMealCell)
                    //                    .sheet(isPresented: self.$showModal) {
                    //                        DetailsView(foodResponse: self.selectedFoodResponse!)
                    //                    }
                    //
                    
                }
            }
        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//        
//    }
//}





extension Color {
    
    static var label: Color {
        return Color(UIColor.label)
    }
    
    static var secondaryLabel: Color {
        return Color(UIColor.secondaryLabel)
    }
    
    static var tertiaryLabel: Color {
        return Color(UIColor.tertiaryLabel)
    }
    
    static var quaternaryLabel: Color {
        return Color(UIColor.quaternaryLabel)
    }
    
    static var systemFill: Color {
        return Color(UIColor.systemFill)
    }
    
    static var secondarySystemFill: Color {
        return Color(UIColor.secondarySystemFill)
    }
    
    static var tertiarySystemFill: Color {
        return Color(UIColor.tertiarySystemFill)
    }
    
    static var quaternarySystemFill: Color {
        return Color(UIColor.quaternarySystemFill)
    }
    
    static var systemBackground: Color {
        return Color(UIColor.systemBackground)
    }
    
    static var secondarySystemBackground: Color {
        return Color(UIColor.secondarySystemBackground)
    }
    
    static var tertiarySystemBackground: Color {
        return Color(UIColor.tertiarySystemBackground)
    }
    
    static var systemGroupedBackground: Color {
        return Color(UIColor.systemGroupedBackground)
    }
    
    static var secondarySystemGroupedBackground: Color {
        return Color(UIColor.secondarySystemGroupedBackground)
    }
    
    static var tertiarySystemGroupedBackground: Color {
        return Color(UIColor.tertiarySystemGroupedBackground)
    }
    
    static var systemRed: Color {
        return Color(UIColor.systemRed)
    }
    
    static var systemBlue: Color {
        return Color(UIColor.systemBlue)
    }
    
    static var systemPink: Color {
        return Color(UIColor.systemPink)
    }
    
    static var systemTeal: Color {
        return Color(UIColor.systemTeal)
    }
    
    static var systemGreen: Color {
        return Color(UIColor.systemGreen)
    }
    
    static var systemIndigo: Color {
        return Color(UIColor.systemIndigo)
    }
    
    static var systemOrange: Color {
        return Color(UIColor.systemOrange)
    }
    
    static var systemPurple: Color {
        return Color(UIColor.systemPurple)
    }
    
    static var systemYellow: Color {
        return Color(UIColor.systemYellow)
    }
    
    static var systemGray: Color {
        return Color(UIColor.systemGray)
    }
    
    static var systemGray2: Color {
        return Color(UIColor.systemGray2)
    }
    
    static var systemGray3: Color {
        return Color(UIColor.systemGray3)
    }
    
    static var systemGray4: Color {
        return Color(UIColor.systemGray4)
    }
    
    static var systemGray5: Color {
        return Color(UIColor.systemGray5)
    }
    
    static var systemGray6: Color {
        return Color(UIColor.systemGray6)
    }
}
