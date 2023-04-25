//
//  FormView.swift
//  FoodList
//
//  Created by Khensu-Ra Love El on 3/21/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.
//

//1. create button
//2. create add feature to the button
//3. add cancel functionality to modal
//4. add title to modal as well

import SwiftUI



struct FormView: View {
    //Environment Variable to dismiss form modal
    @Environment(\.presentationMode) var presentationMode
    
    //Sebs Edits -Start///
    @Binding var foodResponse: FoodResponse
    @State var mealType: MealType = .premeal
    
    init(foodResponse: Binding <FoodResponse>) {
        self._foodResponse = foodResponse
    }
    
    let foodTypes = ["Breakfast", "Lunch", "Dinner", "Snack"]
    let mealTypes = ["Pre-Meal", "Post-Meal"]
    //Sebs Edits -End///
  
//
//    @ObservedObject var foodModel: FoodModel
//
//    @State private var foodName = ""
//    @State private var foodType = 0
//    @State private var mealType = 0
//    @State private var reading = ""
//    @State private var currentDate = Date()
//    let foodTypes = ["Breakfast", "Lunch", "Dinner", "Snack"]
//    let mealTypes = ["Pre-Meal", "Post-Meal"]
//
//    func addMeal (foodType: String, foodName: String, mealType: String, reading: String) {
//
//        let response = FoodResponse(
//            food:Food(foodIcon: "shop",  category: foodType, name: foodName),
//            date: Date(),
//            reading:[Int(reading)!],
//            type: mealType == "Post-Meal" ? .postmeal : .premeal
//        )
//
//        print(response)
//
//        self.foodModel.foodResponses.append(response)
//    }
    
    
    var body: some View {
        NavigationView {
            Form {
                // Sebs Edit-Start
                Section(header: Text("Time and Date")){
                    DatePicker("", selection: self.$foodResponse.date, displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                }
                Section(header: Text("Type of Food ")) {
                    Picker("Food Types", selection: self.$foodResponse.food.category){
                        ForEach(foodTypes, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Food Name ")){
                    TextField("Kale Salad", text: self.$foodResponse.food.name)
                        .keyboardType(.default)
                }
                
                Section(header: Text("Meal Type")) {
                    Picker("Food Types", selection: self.$mealType){
                        ForEach(MealType.allCases, id: \.self) {
                            Text("\($0.displayName)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // Two fields
                if self.mealType == MealType.premeal {
                    // Use a custom binding here to convert between your different data types (string -> Int)
                    Section(header: Text("Pre-meal Blood Sugar Reading (mg/ DL)")) {
                        TextField("", text: Binding(get: {
                            if let value = self.$foodResponse.preReading.wrappedValue {
                                return "\(value)"
                            }
                            return ""
                        }, set: { newValue in
                            self.foodResponse.preReading = Int(newValue)
                        }))
                            .keyboardType(.decimalPad)
                    }
                }
                if self.mealType == MealType.postmeal {
                    // Use a custom binding here to convert between your different data types (string -> Int)
                    Section(header: Text("Post-meal Blood Sugar Reading (mg/ DL)")) {
                        TextField("", text: Binding(get: {
                            if let value = self.$foodResponse.postReading.wrappedValue {
                                return "\(value)"
                            }
                            return ""
                        }, set: { newValue in
                            self.foodResponse.postReading = Int(newValue)
                        }))
                            .keyboardType(.decimalPad)
                    }
                }
                // Sebs Edit-End
                
                // my Version
                
                //                Section(header: Text("Time and Date")){
                //                    DatePicker("", selection: $currentDate, displayedComponents: [.date, .hourAndMinute])
                //                        .labelsHidden()
                //                }
                //                Section(header: Text("Type of Food ")) {
                //                    Picker("Food Types", selection: $foodType){
                //                        ForEach(0..<foodTypes.count){
                //                            Text("\(self.foodTypes[$0])")
                //                        }
                //                    }
                //                    .pickerStyle(SegmentedPickerStyle())
                //                }
                //
                //                Section (header: Text("Food Name ")){
                //                    TextField("Kale Salad", text: $foodName)
                //                        .keyboardType(.default)
                //                }
                //
                //                Section(header: Text("Meal Type")) {
                //                    Picker("Food Types", selection: $mealType){
                //                        ForEach(0..<mealTypes.count){
                //                            Text("\(self.mealTypes[$0])")
                //                        }
                //                    }
                //                    .pickerStyle(SegmentedPickerStyle())
                //                }
                //
                //                Section(header: Text("Blood Sugar Reading (mg/ DL)")) {
                //                    TextField("", text: $reading)
                //                        .keyboardType(.decimalPad)
                //                }
                // my Version end
                
            }
            .navigationBarTitle("New Entry", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                       
                }
                .frame(width: 75, height: 25)
                .foregroundColor(.white),trailing:
                
            
                Button(action: {
                    //  self.addMeal(foodType: self.foodTypes[self.foodType], foodName: self.foodName , mealType: self.mealTypes[self.mealType], reading: self.reading)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .fontWeight(.medium)
                }
                .frame(width: 75, height: 25)
                .foregroundColor(.green)
        
               
                
            )
            
        }
        .onAppear() {
            // Sebs Edit
            // If we already have a premeal reading, we can assume this is a postmeal entry
            if let _ = self.foodResponse.preReading {
                self.mealType = .postmeal
            } else {
                self.mealType = .premeal
            }
        }
        
    }
    
}



struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        //Sebs Edit
        FormView(foodResponse: .constant(FoodResponse(food: Food(foodIcon: "", category: "", name: ""), date: Date()))).environment(\.colorScheme, .dark)
        //        FormView(foodModel: FoodModel())
    }
}
