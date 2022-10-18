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
                    ForEach(1..<3) { num in
                        ReminderListView(title: "期限切れのタスク\(num)")
                    }
                }
                
                Section("今日") {
                    ForEach(1..<5) { num in
                        ReminderListView(title: "今日のタスク\(num)")
                    }
                }
                
                Section("明日以降") {
                    ForEach(1..<5) { num in
                        ReminderListView(title: "明日以降のタスク\(num)")
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
    
    @State var title: String
    
    @State var isCheck = false
    
    var body: some View {
        HStack {
            Button {
                isCheck.toggle()
            } label: {
                Image(systemName: isCheck ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(isCheck ? Color.orange : Color(.secondaryLabel))
            }
            .buttonStyle(.borderless)
            
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $title)
                .onSubmit {
                //TODO: DBを更新
                }
            
        }
    }
}
