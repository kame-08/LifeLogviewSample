//
//  ReminderView.swift
//  LifeLogviewSample
//
//  Created by Ryo on 2022/10/07.
//

import SwiftUI

struct ReminderView: View {
    var body: some View {
        List{
            Section("期限切れ") {
                ForEach(0..<5) { num in
                    ReminderListView(SFSymbols: "checkmark.circle.fill", title: "期限切れのタスク\(num)")
                }
            }
            
            Section("今日") {
                ForEach(0..<5) { num in
                    ReminderListView(SFSymbols: "checkmark.circle.fill", title: "今日のタスク\(num)")
                }
            }
            
            Section("明日以降") {
                ForEach(0..<5) { num in
                    ReminderListView(SFSymbols: "checkmark.circle.fill", title: "明日以降のタスク\(num)")
                }
            }
            
            
            
            
        }
//        .listStyle(InsetListStyle())
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}

struct ReminderListView: View {
    
    @State var SFSymbols: String
    @State var title: String
    var body: some View {
        HStack {
            Button {
                //TODO: checkの切り替え
            } label: {
                Image(systemName: "checkmark.circle.fill")
            }
            
            Text("タスク")

        }
    }
}
