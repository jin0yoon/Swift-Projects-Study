//
//  StandardHomeMovie.swift
//  NetflixClone (iOS)
//
//  Created by 윤진영 on 2021/04/27.
//

import SwiftUI

struct StandardHomeMovie: View {
    
    var movie: Movie
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: Movie(id: <#T##String#>, name: <#T##String#>, thumbnailURL: <#T##URL#>))
    }
}
