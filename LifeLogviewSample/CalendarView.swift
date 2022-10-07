//
//  CalendarView.swift
//  LifeLogviewSample
//
//  Created by Ryo on 2022/10/07.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        List{
            
            ForEach(0..<5) { num in
                Section {
                    CalendarListView()
                }
            }
           
        
        }
//        .listStyle(InsetListStyle())
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

struct CalendarListView: View {
    var body: some View {
        HStack {
            VStack{
                Text("開始時間")
                    .font(.footnote)
                
                
                Spacer()
                
                Text("終了時間")
                    .font(.footnote)
            }
            Spacer()
            
            Text("予定の名前")
            
            Spacer()
        }
        .frame(height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
    }
}
