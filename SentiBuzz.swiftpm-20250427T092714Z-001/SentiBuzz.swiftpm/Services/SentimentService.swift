import Foundation

class SentimentService {
    static func analyzeSentiment(for articles: [NewsArticle], completion: @escaping ([Sentiment]) -> Void) {
        var sentiments: [Sentiment] = []
        
        let group = DispatchGroup()
        
        for article in articles {
            group.enter()
            let bodyString = "extractors=entities,topics,keywords&text=\(article.description ?? "")"
            let urlString = "https://api.textrazor.com?text=\(bodyString)"
            
            var request = URLRequest(url: URL(string: urlString)!)
            request.httpMethod = "POST"
            request.setValue("Your Sentiment API", forHTTPHeaderField: "x-textrazor-key")
            
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let data = data, error == nil {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(SentimentResponse.self, from: data)
                        let sentiment = Sentiment(articleID: article.id, sentimentScore: response.score, sentimentCategory: response.category)
                        sentiments.append(sentiment)
                    } catch {
                        print("Error decoding sentiment: \(error)")
                    }
                }
                group.leave()
            }.resume()
        }
        
        group.notify(queue: .main) {
            completion(sentiments)
        }
    }
}

struct SentimentResponse: Codable {
    let score: Double
    let category: String
}
