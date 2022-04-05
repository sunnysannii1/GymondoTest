//
//  ImageSlidingView.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 05/04/2022.
//

import SwiftUI
import Kingfisher
import Combine
struct ImageSlidingView: View {
   //MARK: - Properties
    private  var images : [String]
    //MARK: - Constructor
    init(images: [String]){
        self.images = images
    }
    //MARK: - View
    var body: some View {
        if self.images.count > 0 {
        TabView {
            ForEach(images, id: \.self) { imgUrl in
                KFImage.url(URL(string: imgUrl))
                    .cacheMemoryOnly()
                    .resizable()
                    .overlay(Color.black.opacity(0.2))
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        } else {
            Image(uiImage: Constants.placeholderImage)
                                .resizable()
                                .scaledToFill()
        }
    }
}
