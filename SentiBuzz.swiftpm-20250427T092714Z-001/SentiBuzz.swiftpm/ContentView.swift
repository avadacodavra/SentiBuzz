import SwiftUI

struct ContentView: View {
    @State private var country = "US"
    @State private var newsArticles: [NewsArticle] = []
    @State private var sentimentResults: [Sentiment] = []

    var body: some View {
        NavigationView {
            VStack {
                // Country selection dropdown with more styling
                CountrySelectionView(selectedCountry: $country)
                    .padding(.top)
                    .padding(.horizontal)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                
                Button(action: {
                    fetchNewsAndSentiment(for: country)
                }) {
                    Text("Get News & Sentiment")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.vertical)

                // List of news articles with sentiment
                List(newsArticles) { article in
                    if let sentiment = sentimentResults.first(where: { $0.articleID == article.id }) {
                        NewsSummaryView(article: article, sentiment: sentiment)
                    } else {
                        NewsSummaryView(article: article, sentiment: Sentiment(articleID: article.id, sentimentScore: 0.0, sentimentCategory: "Unknown"))
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("SentiBuzz")
            .background(Color.gray.opacity(0.05).edgesIgnoringSafeArea(.all))
        }
    }

    func fetchNewsAndSentiment(for country: String) {
        NewsAPIService.fetchTopNews(country: country) { articles in
            DispatchQueue.main.async {
                newsArticles = articles
            }
            SentimentService.analyzeSentiment(for: articles) { sentiments in
                DispatchQueue.main.async {
                    sentimentResults = sentiments
                }
            }
        }
    }
}

