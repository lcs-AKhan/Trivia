//
//  MainMenuView.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 27/10/2022.
//

import SwiftUI

struct MainMenuView: View {
        
    var body: some View {
        
        NavigationView() {
            
            ZStack {
                
                Image("OrangeBackground")
                    .resizable()
                    .frame(width: 500, height: 1000)
                    .edgesIgnoringSafeArea(.all)
                
                GeometryReader { geometry in
                    VStack {
                        
                        Spacer()
                        Spacer()
                        
//                        GeometryReader { geo in
//                            Image("TriviaTitle")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: geo.size.width * 0.7)
//                                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
//                        }
                        
                        Image("TriviaTitle")
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        
//                        GeometryReader { geo in
//                            Image("StartButtonPink")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: geo.size.width * 0.6)
//                                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
//                        }
                        
                        Image("StartButtonPink")
                            .resizable()
                            .scaledToFit()
                            .padding(50)
                        
                        Spacer()

                        
                    }
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height)
                    .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
                }
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
