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
                
                VStack {
                    
                    Spacer()
                    Spacer()
                    
                    Image("TriviaTitle")
                        .resizable()
                        .scaledToFit()
                        .padding(50)
                    
                    Spacer()
                    Spacer()
                    
                    NavigationLink(destination: TriviaScreen()) {
                    
                            Image("StartButtonPink")
                            .resizable()
                            .scaledToFit()
                            .padding(100)
                        
                        }
                    
                    Spacer()

                    
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
