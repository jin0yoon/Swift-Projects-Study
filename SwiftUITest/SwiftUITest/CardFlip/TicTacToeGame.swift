//
//  TicTacToeGame.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2021/01/10.
//

import SwiftUI

struct TicTacToeGame: View {
    var body: some View {
        
        NavigationView {
            TicTacToeHome()
                .navigationTitle("Tic Tac Toe")
                .preferredColorScheme(.dark)
        }
    }
}

struct TicTacToeGame_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeGame()
    }
}

struct TicTacToeHome : View {
    
    var body: some View{
        
        VStack{
            
            //GridView For Playing...
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
             
                ForEach(0..<9, id: \.self){ index in
                    
                    Color.white
                }
                
            }
            .padding()
        }
    }
}
