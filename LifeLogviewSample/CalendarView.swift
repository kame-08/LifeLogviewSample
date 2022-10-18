//
//  CalendarView.swift
//  LifeLogviewSample
//
//  Created by Ryo on 2022/10/07.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        
        
        
        VStack(spacing: 0) {
            
            List {
                Section("終日") {
                    allDayCalendarView(title: "卒業制作", SF: "poweron")
                    allDayCalendarView(title: "今日からの予定", SF: "arrow.left.to.line")
                    allDayCalendarView(title: "昨日から明日までの予定", SF: "arrow.left.and.right")
                    allDayCalendarView(title: "今日までの予定", SF: "arrow.right.to.line")
                }
                .font(.footnote)
            }
            .frame(height: 100.0)
            //            HStack(alignment: .top){
            //                Text("終日")
            //                    .font(.footnote)
            //
            //                    ScrollView(showsIndicators: false) {
            //                        allDayCalendarView(title: "卒業制作", SF: "poweron")
            //                        allDayCalendarView(title: "今日からの予定", SF: "arrow.left.to.line")
            //                        allDayCalendarView(title: "昨日から明日までの予定", SF: "arrow.left.and.right")
            //                        allDayCalendarView(title: "今日までの予定", SF: "arrow.right.to.line")
            //                    }
            //                    .frame(height: 100.0)
            //
            //
            //            }
//            .padding([.top, .leading, .trailing])
            //
//            .background(RoundedCorners(color: Color(.systemGroupedBackground), tl: 0, tr: 0, bl: 20, br: 20))
//            .background(Color(uiColor: .systemGroupedBackground))
            //            .border(Color.orange, width: 1)
            //            .padding(.horizontal)
            
            List{
                
                //            ForEach(0..<5) { num in
                //                Section {
                //                    CalendarListView()
                //                }
                //            }
                Section {
                    CalendarListView(startTime: "9:20", endTime: "10:50", title: "WEBシステム開発")
                }
                Section {
                    CalendarListView(startTime: "13:30", endTime: "15:00", title: "Android卒業制作")
                }
                Section {
                    CalendarListView(startTime: "15:10", endTime: "16:40", title: "Android卒業制作")
                }
            }
            
            
            //            VStack{
            //                Rectangle()
            //                    .frame(height: 50.0)
            //                Spacer()
            //
            //            }
            
            
            //        .listStyle(InsetListStyle())
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

struct CalendarListView: View {
    @State var startTime: String
    @State var endTime: String
    @State var title: String
    var body: some View {
        HStack {
            
            VStack(alignment: .leading){
                Text(startTime)
                    .font(.footnote)
                
                Spacer()
                
                //                    Image(systemName: "circle")
                Text("90")
                    .padding(8.0)
                //                    .background(){
                //                        Image(systemName: "circle")
                //                    }
                    .overlay(
                        Circle()
                            .stroke(Color.orange, lineWidth: 4)
                    )
                    .padding(.leading)
                
                
                Spacer()
                
                Text(endTime)
                    .font(.footnote)
            }
            Spacer()
            
            Text(title)
            
            Spacer()
        }
        .frame(height: 80.0)
    }
}

struct allDayCalendarView: View {
    @State var title: String
    @State var SF: String
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "arrow.left.to.line")
                    .foregroundColor(Color.clear)
                
                Image(systemName: SF)
                    .foregroundColor(Color.orange)
            }
            
            Text(title)
            Spacer()
        }
    }
}
