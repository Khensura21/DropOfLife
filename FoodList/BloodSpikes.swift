//
//  Shape.swift
//  FoodList
//
//  Created by Khensu-Ra Love El on 4/28/20.
//  Copyright © 2020 khensuraloveel. All rights reserved.
//

//reference: Hacking with swift
import SwiftUI

func circleColor (num: Int)-> Color {
    switch num {
    case 0...50:
        return Color.green
        
    case  -90:
           return Color.systemYellow
        
    case -150:
        return Color.red
        
    default:
        return Color.green
    }
}

struct BloodSpike: View {
    @State var animationAmount: CGFloat = 1
    @State var showSpikeAmount = false
    var foodSpike: Int 
    var mealType: String
    var randomX = Int.random(in: -75 ..< 75)
    var randomY = Int.random(in: 20 ... 40)
    var spikeAmount = 60
    
    var body: some View {
        Button(action: {
             self.showSpikeAmount.toggle()
        }) {
           Text(showSpikeAmount ? "\(foodSpike)" :
           mealType)
            .fontWeight(.bold)
        }
        .frame(width: CGFloat(25 * foodSpike))
        .background(circleColor(num: foodSpike))
            .opacity(Double.random(in: 0.6...1))
        .foregroundColor(.white)
        .clipShape(Circle())
    
        .overlay(
            Circle()
                .stroke(circleColor(num: foodSpike))
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )

        .offset(CGSize(width: randomX, height: randomY))
        .onAppear {
               if self.foodSpike <= -100 {
                 self.animationAmount = 2
            }
        }
//        ZStack {
//            Circle()
//                .fill(Color.red)
//                .frame(width: CGFloat(25 * foodSpike + foodSpike))
//                .offset(CGSize(width: randomX, height: randomY))
//                .opacity(Double.random(in: 0.4...1))
//            Text(mealType)
//                .offset(CGSize(width: randomX, height: randomY))
//        }
    }
}

struct BloodSpikes: View {
    @ObservedObject var foodModel: FoodModel
    
//    func printFoodReponses (foodResponses: FoodModel) {
//        for foodResponse in foodResponses.foodResponses {
//            print(foodResponse.preReading)
//            print(foodResponse.postReading)
//        }
//    }
   
    var body: some View {
        VStack {
            HStack {
                Text("Blood Spikes")
                    .font(.title)
                    .fontWeight(.regular)
                
               
                //                Image(systemName: "info.circle")
                //                 .resizable()
                //                .frame(width: 25, height: 25)
                
            }
            .padding()
            ForEach(self.foodModel.foodResponses) { foodResponse in
                self.validateReadings(foodResponse: foodResponse)
            }
      
        }.navigationBarTitle("Blood Spikes")
    }
    func validateReadings(foodResponse: FoodResponse) ->
        BloodSpike {
        let pre = foodResponse.preReading ?? 0
        let post = foodResponse.postReading ?? 0
        let spike = post - pre
        print(foodResponse.preReading, foodResponse.postReading )
        return {
            BloodSpike(foodSpike: spike,
                       mealType: foodResponse.food.name)
        }()
    }
}

struct BloodSpikes_Previews: PreviewProvider {
    static var previews: some View {
    BloodSpikes(foodModel: FoodModel())
    }
}


