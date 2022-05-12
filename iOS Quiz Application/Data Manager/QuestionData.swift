struct QuestionData{
    
    private static var questionList:[Question]=[]
    private static var questionKey:[Int:String]=[:]
    private static var questionIdList:[Int]=[]
    
    
    public static func getTotalMarks()->Int{
        var sum=0
        for questionObject in questionList{
            sum+=questionObject.mark
        }
        return sum
    }
    
    public static func addQuestion(question:Question){
        questionList.append(question)
        questionIdList.append(question.getQuestionId())
        setKey(question: question)
    }
    
    public static func setKey(question:Question){
        questionKey[question.getQuestionId()]=question.getAnswer()
    }
    
    public static func getQuestionList()->[Question]{
        return QuestionData.questionList
    }
    
    public static func getQuestionKey()->[Int:String]{
        return QuestionData.questionKey
    }
    
}

