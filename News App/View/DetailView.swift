//
//  DetailView.swift
//  News App
//
//  Created by Fathurrahman Muhammad on 02/08/22.
//

import SwiftUI

struct DetailView: View {
    
    var passData: Article
    @StateObject var newsModel = NewsApi()
    @State private var showSF = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(spacing: 5) {
                    Text(passData.title)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Text("Author : \(passData.author ?? "Tidak diketahui")")
                            .font( .caption)
                            .bold()
                            .foregroundColor( .gray)
                        Text("Published at \(passData.publishedAt)")
                            .font( .caption)
                            .foregroundColor( .secondary)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    AsyncImage(url: URL(string: passData.urlToImage ?? "")) { img in
                        img
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(20)
                            .padding( .top)
                    } placeholder: {
                        Text("")
                    }
                    Text(passData.description ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font( .body)
                        .padding( .vertical, 5)
                    Text(passData.content ?? "")
                        .font( .body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button {
                        showSF = true
                    } label: {
                        VStack {
                            Text("Lihat selengkapnya")
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }.padding()
            }
            .sheet(isPresented: $showSF,
                   content: {
                if let stringUrl = passData.url, let url = URL(string: stringUrl) {
                    SFSafariView(url: url)
                }
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passData: Article(author: "Fathur", content: "Dicoding", description: "Test", publishedAt: "yyyy-mm-dd", title: "This is title", url: "", urlToImage: ""))
    }
}
