public enum OperationType:Int{
    case takeUpTheQuiz=1
    case viewYourScore=2
    case addNewAdmin=3
    case updateQuestions=4
    case viewQuestions=5
    case viewStudents=6
    case viewStudentScore=7
}

public struct AddQuestion{
    
    public static let question:String="Which one creates a dictionary with a key type of Integer and value of String?"
    
    public static let choiceArray:[String:String]=["A":"var dict = [one :1]","B":"var dict: [String: Int] = [1:one]","C":"var dict: [Int: String] = [1:one]","D":"var dict:[Int: String] = [one:1]"]
    
    public static let answer:String="C"
    
}
