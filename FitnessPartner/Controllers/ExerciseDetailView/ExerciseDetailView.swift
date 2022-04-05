//
//  ExerciseDetailView.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 05/04/2022.
//

import SwiftUI

struct ExerciseDetailView: View {
    //MARK: - Properties
    @ObservedObject var viewModel = ExerciseDetailViewModel(provider:ServiceProvider<ExerciseService>())
    private let id: Int
    //MARK: - Constructor
    init(id: Int) {
        self.id = id
    }
    //MARK: - View
    var body: some View {
        GeometryReader { geometry in
            LazyVStack{
                ImageSlidingView(images: viewModel.images)
                    .frame(width: geometry.size.width, height: geometry.size.height / 2)
                Text(viewModel.exerciseItem?.name ?? "" )
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    if viewModel.getVariationCount() > 0 {
                        Text("Variations:")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ForEach(viewModel.getVariations(), id: \.self) { item in
                            NavigationLink(destination: ExerciseDetailView(id: item)) {
                                Text(String(item))
                                    .font(.title3)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.getExerciseInfo(id: id)
        }
    }
}
