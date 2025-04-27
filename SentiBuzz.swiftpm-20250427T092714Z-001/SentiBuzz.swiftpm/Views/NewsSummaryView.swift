import SwiftUI

struct NewsSummaryView: View {
    let article: NewsArticle
    let sentiment: Sentiment?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(article.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(article.description ?? "No description available")
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(3)
                .truncationMode(.tail)
            
            if let sentiment = sentiment {
                // Sentiment display with color-coding
                HStack {
                    Text("Sentiment: \(sentiment.sentimentCategory.capitalized)")
                        .font(.subheadline)
                        .foregroundColor(sentiment.sentimentCategory == "positive" ? .green : .red)
                    Spacer()
                    Text("Score: \(String(format: "%.2f", sentiment.sentimentScore))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 5)
            } else {
                // Placeholder if sentiment is not available
                HStack {
                    Text("Sentiment: Unknown")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.top, 5)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.vertical, 5)
    }
}
