//
//  ReportRowView.swift
//  EateriesCoreData
//
//  Created by Tia on 15/5/21.
//

import SwiftUI

/// Need Report ObservedObject to use $ to binding to report array
struct ReportRowView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.editMode) var editMode
    @ObservedObject var report: Report
    
    
    var body: some View {
        VStack {
            HStack{
            
//<-----------report Author
                if editMode?.wrappedValue == .active {
                    TextField("Enter author name here:", text: $report.reportAuthorString , onCommit: {
                        try? viewContext.save()
                    }).font(.body)
                }else{
                Text(editMode?.wrappedValue == .active ? "" : "\(report.reportAuthorString):")
                    .font(.title3)
                    .fontWeight(.medium)
                    
                }
                Spacer()
            }
//<-----------report Content
            HStack{
                if editMode?.wrappedValue == .active {
                    TextField("Enter author content here:", text: $report.reportContentStringnt , onCommit: {
                        try? viewContext.save()
                    }).font(.body)
                }else{
                Text(editMode?.wrappedValue == .active ? "" : report.reportContentStringnt)
                    .font(.body)
                    
                }
                Spacer()
            }
        }
    }
}

