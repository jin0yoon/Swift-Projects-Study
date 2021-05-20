//
//  StandardHomeMovie.swift
//  NetflixClone (iOS)
//
//  Created by 윤진영 on 2021/04/27.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovie: View {
    
    var movie: Movie
    
    var body: some View {
        KFImage(movie.thumbnailURL)
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
    }
}
