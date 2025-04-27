import Foundation

struct NewsArticle: Identifiable, Codable {
    var id: UUID
    var title: String
    var description: String?
    var url: String
    var publishedAt: String
}
