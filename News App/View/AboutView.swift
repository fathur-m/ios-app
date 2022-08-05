//
//  AboutView.swift
//  News App
//
//  Created by Fathurrahman Muhammad on 02/08/22.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            Image("LogoDicoding")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300)
                                .padding(.top, 50)
                            Text("Academy")
                                .font( .title)
                                .fontWeight( .semibold)
                                .foregroundColor(Color.black.opacity(0.6))
                            Text("Summary")
                                .fontWeight( .bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(EdgeInsets(top: 20, leading: 20, bottom: 1, trailing: 20))
                            HStack {
                                Text("This App is a Simple iOS App Final Project I made for Submission at ") +
                                Text("Dicoding Academy, ").bold() +
                                Text("Course iOS Learning Path IDCamp 2022").italic()

                            }.frame(maxWidth: .infinity, alignment: .leading).padding( .horizontal, 20)
                            Text("Api").fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(EdgeInsets(top: 10, leading: 20, bottom: 1, trailing: 20))
                            HStack {
                                Text("In this application I use the API from ") +
                                Text("newsapi.org.").fontWeight(.semibold)
                            }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 20)
                            HStack {
                                Button("API Documentation") {
                                    openURL(URL(string: "https://newsapi.org/docs/endpoints/top-headlines")!)
                                }
                            }.frame(maxWidth: .infinity, alignment: .leading).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        }
                    }
                }.frame(maxWidth: .infinity).background(Color(red: 230/255, green: 230/255, blue: 230/255)).padding(.top, 1)
                    .navigationBarTitle("About")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
