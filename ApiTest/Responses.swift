struct Response: Decodable {
    struct People: Decodable {
        let name: String
        let number: String
    }
    let people: People
}

