struct Question{
    
    private let questionId:Int
    private var question:String
    private var optionArray:[String:String]
    private var answer:String
    public let mark:Int=10
    
    private static var questionCount=1001
    
    
    
    public init(question:String,optionArray:[String:String],answer:String){
        self.questionId=Question.questionCount
        Question.questionCount+=1
        self.question=question
        self.optionArray=optionArray
        self.answer=answer
        //QuestionData.addQuestion(question: self)
    }
    
    public func getQuestionId() -> Int{
        return self.questionId
    }
    
    public func getQuestion()->String{
        return self.question
    }
    
    public func getChoices()->[String:String]{
        return self.optionArray
    }

    public func getAnswer()->String{
        return self.answer
    }
    
    public func validUserAnswer(userAnswer:String)->Bool{
        
        //checks if the entered option is valid or not
        
        for choice in self.optionArray{
            if userAnswer.uppercased() == choice.key{
                return true
            }
        }
        //print("Please enter a valid option")
        return false
    }
    
    
    
}
