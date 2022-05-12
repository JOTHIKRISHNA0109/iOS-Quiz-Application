public struct Result{
    
    public var studentAnswer:[Int:String]=[:]
    public var resultSummary:[Int:String]=[:]
    public var score:Int=0
    
    public init(studentAnswer:[Int:String]){
        self.studentAnswer=studentAnswer
    }
        
    public func getQuestionMark(questionId:Int) -> Int?{
        
        //get the question mark for the particular question
        //for now, the default score has been set
        
        let questionArray=QuestionData.getQuestionList()
        
        let questionObject=questionArray.first(where: {$0.getQuestionId()==questionId})
        return questionObject!.mark
    }
    
    public mutating func answerValidation(){
        
        //compares the student answer with the answer key
        //thereby, preparing the result dictionary
        
        let answerKey=QuestionData.getQuestionKey()
        
        let answerKeyDict = (answerKey).sorted( by: { $0 < $1 })
        
        for (questionId,_) in answerKeyDict{
            if answerKey[questionId] == self.studentAnswer[questionId]{
                self.resultSummary[questionId]="CORRECT✅"
                if let marksForCurrentQuestion:Int=getQuestionMark(questionId: questionId){
                    self.score+=marksForCurrentQuestion
                }
            }
            else{
                self.resultSummary[questionId]="WRONG❌"
            }
        }
    }
    
    
}
