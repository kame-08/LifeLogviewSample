//
//  ContentView.swift
//  LifeLogviewSample
//
//  Created by Ryo on 2022/10/07.
//

import SwiftUI

struct ContentView: View {
    
    //    @State private var selectedTask: PartyTask?
    
    var body: some View {
        NavigationSplitView {
            List {
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, displayedComponents: .date, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                    .datePickerStyle(.graphical)
                ListView(Title: "カレンダー", SFSymbols: "calendar")
                ListView(Title: "リマインダー", SFSymbols: "checklist")
                Section("プロジェクト") {
                    ListView(Title: "卒業制作", SFSymbols: "graduationcap.fill")
                }
                .listStyle(.sidebar)
            }
        } detail: {
          DayView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListView: View {
    
    @State var Title :String
    @State var SFSymbols :String
    
    var body: some View {
        Label(Title, systemImage: SFSymbols)
        
        
        
    }
}
