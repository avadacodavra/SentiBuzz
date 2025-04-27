import Foundation

struct Sentiment: Identifiable, Codable {
    var id = UUID() // This will be auto-generated for every sentiment
    var articleID: UUID
    var sentimentScore: Double
    var sentimentCategory: String
}
