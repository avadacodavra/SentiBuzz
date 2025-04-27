import Foundation

class NewsAPIService {
    static func fetchTopNews(country: String, completion: @escaping ([NewsArticle]) -> Void) {
        let apiKey = Constants.newsAPIKey
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(NewsResponse.self, from: data)
                    completion(response.articles)
                } catch {
                    print("Error decoding news: \(error)")
                }
            } else {
                print("Error fetching news: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}

struct NewsResponse: Codable {
    let articles: [NewsArticle]
}
