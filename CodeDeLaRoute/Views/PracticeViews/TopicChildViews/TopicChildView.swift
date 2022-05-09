//
//  TopicChildView.swift
//  CodeDeLaRoute
//
//  Created by Nhung Nguyen on 21/04/2022.
//

import SwiftUI

struct TopicChildView: View {
    @EnvironmentObject var viewModel : PracticeViewModel
    var title: String
    var total: Int
    
    var body: some View {
        VStack {
            HStack {
                BackHearderLeftView(title: title, color: Color.blue1!)
                    
                Spacer()
            }
            .padding(.horizontal, 24.0)
            .padding(.bottom)
            
            VStack {
                ProgressView(value: 5, total: 10)
                    .accentColor(Color.blue1)
                    .background(Color.blue3)
                      .frame(height: 8.0)
                      .scaleEffect(x: 1, y: 2, anchor: .center)
                  .clipShape(RoundedRectangle(cornerRadius: 4))
                  .padding(.bottom)
                
                HStack() {
                    VStack(alignment: .leading) {
                        Text("Total")
                            .foregroundColor(.blue2)
                            .font(.system(size: 18, weight: .medium))
                            .padding(.bottom)
                        Text("Answered")
                            .foregroundColor(.blue2)
                            .font(.system(size: 18, weight: .medium))

                    }
                    .padding(.trailing)
                    
                    VStack(alignment: .leading) {
                        Text(String(total))
                            .foregroundColor(.blue1)
                            .font(.system(size: 24, weight: .bold))
                            .padding(.bottom, 8.0)
                        Text("0")
                            .foregroundColor(.blue1)
                            .font(.system(size: 24, weight: .bold))

                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 24.0)
            .padding(.bottom, 70.0)
            
            VStack {
                ScrollView(showsIndicators: false){
                    ForEach(viewModel.listChildTopics){
                        topic in
                        TopicChildRowView(title: topic.name, total: topic.totalQuestion, id: topic.id)
                                .padding(.bottom, 14.0)
                    }
                }
                .padding(.bottom, -8.0)
                Spacer()
            }
            .padding(.horizontal, 20.0)
            .padding(.top, 40.0)
            .background(Color.white.opacity(0.6))
            .cornerRadius(25, corners: [.topLeft, .topRight])
            
            
            Spacer()
     
        }.padding(.top, Screen.statusBarHeight)
         .background(BackGroundView())
         .ignoresSafeArea()
         
            
    }
}

struct TopicChildView_Previews: PreviewProvider {
    static var previews: some View {
        TopicChildView(title: "Topic", total: 10)
    }
}
