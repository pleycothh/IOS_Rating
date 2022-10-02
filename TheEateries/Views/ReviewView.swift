//
//  ReviewView.swift
//  TheEateries
//
//  Created by Tia on 11/5/21.
//

import SwiftUI

struct ReviewView: View {
    
    @ObservedObject var review: Eateries
    @ObservedObject var eateryViewModel: ViewModel
    @Environment(\.editMode) var editMode
    
    var body: some View {

     
            ForEach(review.reviews) { review in
                VStack{
                    Text("\(review.revName):")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text(review.revNote)
                        .font(.body)
                    
//                    HStack{
//                        Spacer()
//                        Button(action: {
//                            print("Add review")
//                        }, label: {
//                            Image(systemName: "plus")
//                        })
//                    }
                    }
                }
                .onMove { (indices, destination) in
                    self.review.reviews.move(fromOffsets: indices, toOffset: destination)
                }
                .onDelete{ indices in
                    indices.forEach {self.review.reviews.remove(at: $0)}
                       // onCommit: {TheEateriesApp.save()}
                    print("save move")
            }
        
//        .navigationBarItems(leading: Button(action: {
//            print(review.reviews.count)
//           // eateryViewModel.addReviews(at: review.reviews)
//        }, label: {
//            Image(systemName: "plus")
//        }))
        
    }
}
//
//struct ReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewView(review: review)
//    }
//}

