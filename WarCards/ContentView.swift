//
//  ContentView.swift
//  WarCards
//
//  Created by Troy Daniels on 10/13/22.
//

import SwiftUI

struct ContentView: View {
    // attributes
    //to display cards
    @State var card1:String = "back"
    @State var card2:String = "back"
    
    //to display points
    @State var playerPoints:Int=0
    @State var cpuPoints:Int=0
    
    var body: some View {
        
        
        //ZStack for background and everything inside
        ZStack{
            Image("background")
            //VStack for everything inside
            VStack{
                //Logo
                Spacer()
                Image("logo")
                Spacer()
                //cards go next 2 nest to each other
                //so hstack
                HStack{
                    //card1
                    Spacer()
                    Image(card1)
                    Spacer()
                    //card2
                    Image(card2)
                    Spacer()
                }.padding(.top, 50.0)
                Spacer()
                //deal Button
                Button {
                    // on click get random value 2-14 (2-ace) for 2 cards
                    var newCard1 = Int.random(in: 2...14)
                    var newCard2 = Int.random(in: 2...14)
                    // updtae the attribute to the new cards
                    card1 = "card\(newCard1)"
                    card2 = "card\(newCard2)"
                    // update the score accordingly
                    if newCard1 > newCard2 {
                        playerPoints=playerPoints+1
                    }
                    else if newCard2>newCard1 {
                        cpuPoints+=1
                    }
                } label: {
                    Image("dealbutton")
                        .frame(width: 120.0, height: 120.0)
                        .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                        .scaleEffect(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
                        
                }
                .frame(width: 120.0, height: 120.0)
                Spacer()
                //player adn CPU scores
                HStack{
                    Spacer()
                    //player score
                    VStack(alignment: .leading){
                        Text("Player 1")
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 5.0)
                            .scaleEffect(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
                        Text(String(playerPoints))
                            .multilineTextAlignment(.leading)
                            .padding(.top, 0.0)
                            .scaleEffect(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
                    }.padding(.trailing, 80.0)
                    Spacer()
                    VStack(alignment: .trailing){
                        Text("CPU")
                            .padding(.bottom, 5.0)
                            .scaleEffect(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
                        Text(String(cpuPoints))
                            .scaleEffect(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
                    }.padding(.leading, 80.0)
                    Spacer()
                    
                }
                Spacer()

            }
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
