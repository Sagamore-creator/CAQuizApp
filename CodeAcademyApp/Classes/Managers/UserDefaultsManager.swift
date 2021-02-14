import Foundation

struct UserDefaultsManager {
    
    private enum UserDefaultsManagerKey {
        static let quizQuestions = "QuizQuestions"
        static let accounts = "Accounts"
        static let pointsRules = "PointsRules"
        static let gameSaves = "GameSaves"
        static let loggedInUser = "loggedInUser"
        static let quizSettings = "QuizSettings"
    }
    
    private static var userDefaults: UserDefaults {
        UserDefaults.standard
    }
    
    private static var keyChain: KeychainSwift {
        KeychainSwift()
    }

    static func saveQuestion(_ question: Question) {
        var savedQuestions = [Question]()
        
        if let questions = questions {
            savedQuestions = questions
        }
        savedQuestions.append(question)
        questions = savedQuestions
    }

    static func deleteQuestions() {
        questions?.removeAll()
    }
    
    static func saveAccount(_ account: inout Account) {
        var savedAccounts = [Account]()
        
        if let accounts = accounts {
            savedAccounts = accounts
        }
        savePassword(account.password, username: account.username)
        account.password = ""
        savedAccounts.append(account)
        accounts = savedAccounts 
    }
    
    static func saveGame(with gameSave: GameSave) {
        var newGameSaves = [GameSave]()

        if let currentGameSaves = gameSaves {
            newGameSaves = currentGameSaves
        }
        newGameSaves.append(gameSave)
        updateGameSaves(with: newGameSaves)
    }

    static func updateGameSaves(with newGameSaves: [GameSave]) {
        gameSaves = newGameSaves
    }

    static func deleteGameSaves() {
        gameSaves?.removeAll()
    }

    static func deleteUsers() {
        UserDefaultsManager.accounts?.removeAll(where: { account -> Bool in
            account.accountType == .user
        })
    }
}

// MARK: - Helpers

extension UserDefaultsManager {
    
    static var pointsRules: Points? {
        get {
            guard let encodedPointsRules = userDefaults.object(forKey: UserDefaultsManagerKey.pointsRules) as? Data else {
                return nil
            }
            return try? JSONDecoder().decode(Points.self, from: encodedPointsRules)
        } set {
            let encodedPointsRules = try? JSONEncoder().encode(newValue)
            userDefaults.set(encodedPointsRules, forKey: UserDefaultsManagerKey.pointsRules)
        }
    }
    
    static var questions: [Question]? {
        get {
            guard let encodedQuestions = userDefaults.object(forKey: UserDefaultsManagerKey.quizQuestions) as? Data else {
                return nil
            }
            return try? JSONDecoder().decode([Question].self, from: encodedQuestions)
        } set {
            let encodedQuestions = try? JSONEncoder().encode(newValue)
            userDefaults.set(encodedQuestions, forKey: UserDefaultsManagerKey.quizQuestions)
        }
    }
    
    static var accounts: [Account]? {
        get {
            guard let encodedAccounts = userDefaults.object(forKey: UserDefaultsManagerKey.accounts) as? Data else {
                return nil
            }
            return try? JSONDecoder().decode([Account].self, from: encodedAccounts)
        } set {
            let encodedAccounts = try? JSONEncoder().encode(newValue)
            userDefaults.set(encodedAccounts, forKey: UserDefaultsManagerKey.accounts)
        }
    }
    
    static var gameSaves: [GameSave]? {
        get {
            guard let gameSaves = userDefaults.object(forKey: UserDefaultsManagerKey.gameSaves) as? Data else {
                return nil
            }
            return try? JSONDecoder().decode([GameSave].self, from: gameSaves)
        } set {
            let gameSaves = try? JSONEncoder().encode(newValue)
            userDefaults.set(gameSaves, forKey: UserDefaultsManagerKey.gameSaves)
        }
    }

    static var loggedInAccount: Account? {
        get {
            guard let encodedLoggedInUser = userDefaults.object(forKey: UserDefaultsManagerKey.loggedInUser) as? Data else {
                return nil
            }
            return try? JSONDecoder().decode(Account.self, from: encodedLoggedInUser)
        } set {
            let encodedCurrentUser = try? JSONEncoder().encode(newValue)
            userDefaults.set(encodedCurrentUser, forKey: UserDefaultsManagerKey.loggedInUser)
        }
    }

    static var quizSettings: QuizSettings? {
        get {
            guard let encodedQuizSettings = userDefaults.object(forKey: UserDefaultsManagerKey.quizSettings) as? Data else {
                return nil
            }
            return try? JSONDecoder().decode(QuizSettings.self, from: encodedQuizSettings)
        } set {
            let encodedQuizSettings = try? JSONEncoder().encode(newValue)
            userDefaults.set(encodedQuizSettings, forKey: UserDefaultsManagerKey.quizSettings)
        }
    }
    
    private static func savePassword(_ password: String, username: String) {
        keyChain.set(password, forKey: username)
    }
    
    static func getPassword(username: String) -> String? {
        keyChain.get(username)
    }
}
