//
//  ListView.swift
//  News App
//
//  Created by Fathurrahman Muhammad on 02/08/22.
//

import SwiftUI

struct ListView: View {
    @StateObject var newsModel = NewsApi()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(newsModel.news, id: \.self) { news in
                        NavigationLink(destination: DetailView(passData: news), label: {
                            HStack(spacing: 15) {
                                AsyncImage(url: URL(string: news.urlToImage ?? "")) { img in
                                    img
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(5)
                                        .frame(width: 120)
                                } placeholder: {
                                    Text("")
                                }
                                Text(news.title)
                                    .padding( .vertical)
                                    .lineLimit(3)
                            }
                        })
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Headlines News")
            }
        }
        .onAppear {
            newsModel.fetchNews()
        }
        .navigationViewStyle( .stack)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
