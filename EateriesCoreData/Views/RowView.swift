//
//  RowView.swift
//  EateriesCoreData
//
//  Created by Tia on 15/5/21.
//

import SwiftUI

/// display a preview of Detial VIew
struct RowView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var restaurant: Restaurant
    
    var body: some View {
        
        HStack {
            Image(uiImage: restaurant.load(image: restaurant.imageString))
                .resizable()
                .frame(width: 50, height: 50)
            Text(restaurant.nameString)
                .fontWeight(.medium)
            Text(restaurant.locationNameString)
                .font(.subheadline)
            Spacer()
        }
    }
}



//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}
