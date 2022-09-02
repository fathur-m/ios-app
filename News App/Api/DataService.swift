//
//  DataService.swift
//  News App
//
//  Created by Fathurrahman Muhammad on 01/08/22.
//

import Foundation

struct Page: Codable {
    let articles: [Article]
}

struct Article: Codable, Hashable {
    let author: String?
    let content: String?
    let description: String?
    let publishedAt: String
    let title: String
    let url: String
    let urlToImage: String?
}

class NewsApi: ObservableObject {
    
    @Published var news: [Article] = []
    
    func fetchNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=id&apiKey=HIDE") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let json = try JSONDecoder().decode(Page.self, from: data)
                DispatchQueue.main.async {
                    self.news = json.articles
                }
            } catch {
                print(error)
                print("Decode gagal")
            }
        }
        task.resume()
    }
    
}
