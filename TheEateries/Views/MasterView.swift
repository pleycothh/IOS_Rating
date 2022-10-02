//
//  MasterView.swift
//  TheEateries
//
//  Created by Tia on 4/5/21.
//

import SwiftUI

struct MasterView: View {
    
    ///
    /// pass the setter and getter form VIewModel
    ///
        
    @ObservedObject var eateriess: ViewModel //<- why use []
   // @ObservedObject var eatery: DetailViewModel
    @Environment(\.editMode) var mode
    
        
    var body: some View {
        List{
            if mode?.wrappedValue == .active {
                HStack{
                    TextField("Enter title", text: $eateriess.model[0].title , onCommit: {
                        TheEateriesApp.save(model: eateriess.model)
                    }).font(.largeTitle)
                }
            }
            ForEach(eateriess.model) { eatery in
                    NavigationLink(
                        destination: DetailView(eatery: eatery, eateryViewModel: eateriess)){
                        MasterRowView(eatery: eatery, eateryViewModel: eateriess)
                        }
                    }
            .onMove { (indices, destination) in
                self.eateriess.model.move(fromOffsets: indices, toOffset: destination)
            }
            .onDelete{ indices in
                indices.forEach {self.eateriess.model.remove(at: $0)}
                   // onCommit: {TheEateriesApp.save()}
                print("save move")
            }
        }
        .navigationTitle(mode?.wrappedValue == .active ? "" : eateriess.model[0].title )
    }
}




//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView(eateriess: ViewModel(), eatery:defult1)
//    }
//}
