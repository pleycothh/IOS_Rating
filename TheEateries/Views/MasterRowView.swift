//
//  MasterRowView.swift
//  TheEateries
//
//  Created by Ben Li on 6/5/21.
//

import SwiftUI


struct MasterRowView: View {
    @ObservedObject var eatery: Eateries
    @ObservedObject var eateryViewModel: ViewModel //<- why use []
    
    var body: some View {
        HStack{
            Image(uiImage: eateryViewModel.load(image: eatery.image))
                .resizable()
                .frame(width: 50, height: 50)
            Text(eatery.name)
            Spacer()
        }
    }
}

//struct MasterRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterRowView(eatery: detailViewModel())
//    }
//}

