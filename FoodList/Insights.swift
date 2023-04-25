//
//  Insights.swift
//  FoodList
//
//  Created by Khensu-Ra Love El on 4/7/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.
//

import SwiftUI


struct Insights: View {
    @ObservedObject var foodModel: FoodModel
    
    var body: some View {
        VStack {
//            HStack {
//                Text("Blood Spikes")
//                .font(.title)
//                .fontWeight(.regular)
//                Spacer()
////                Image(systemName: "info.circle")
////                 .resizable()
////                .frame(width: 25, height: 25)
//
//                     }
//            .padding()
//            Spacer()
//    
            BloodSpikes(foodModel: foodModel)
        }
       
        
    }
}


struct Insights_Previews: PreviewProvider {
    static var previews: some View {
        Insights(foodModel: FoodModel())
    }
}



//old insights page

//
//
//struct Insights: View {
//    //    let chartStyle = ChartStyle(backgroundColor: Color.black, accentColor: Colors.GradientLowerBlue, secondGradientColor: Colors.GradientNeonBlue, textColor: Color.white, dropShadowColor: Color.black, legendTextColor: Color.white )
//
//    var body: some View {
//        VStack {
//            NavigationView {
//                List {
//                    Section {
//                        HStack {
//
//                            BarChartView(data:ChartData(values: [("BFST:", 20) , ("LUN:", 50), ("DIN:", 117), ("SNAC:", 59)]), title: "Blood Sugar Spikes", legend: "Meals", style: Styles.barChartStyleOrangeDark, form: ChartForm.medium)
//                            BarChartView(data:ChartData(values: [("BFST:", 20) , ("LUN:", 50), ("DIN:", 117), ("SNAC:", 59)]), title: "Energy Level", legend: "Meals", style: Styles.barChartStyleNeonBlueDark, form: ChartForm.medium)
//                        }
//
//
//                    }
//                CircleView(foodSpike: 50, mealType: "Lunch")
//
//
//                }
//                .navigationBarTitle("Trends")
//            }
//        }
//
//    }
//}
