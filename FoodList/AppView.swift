//
//  AppView.swift
//  FoodList
//
//  Created by Khensu-Ra Love El on 4/7/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.
//

import SwiftUI


struct AppView: View {
    @ObservedObject var foodModel: FoodModel
    var body: some View {
        TabView {
            ContentView(foodModel: foodModel)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Logs")
            }
            Insights(foodModel: foodModel)
                .tabItem {
                    Image(systemName: "eye.fill")
                    Text("Insights")
            }
            
        }
        .background(Color.gray)
        .accentColor(Color.systemGreen)
    }
    
}

struct AppView_Previews: PreviewProvider {
    //not sure if this is right
//    static let content = ContentView()
    static var previews: some View {
        AppView(foodModel: FoodModel())
            //.environmentObject(content)
         .environment(\.colorScheme, .dark)
    }
}
