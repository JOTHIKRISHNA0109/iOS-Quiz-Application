public enum TestStatus:String{
    case taken="Taken"
    case notTaken="Not Taken"
}

public struct Test{
    
    public let testId:Int
    public let studentId:Int
    public let testStatus:TestStatus
    public var result:Result
    public static var testCount:Int=101
    
    public init(studentId:Int,result:Result){
        self.testId=Test.testCount
        Test.testCount+=1
        self.studentId=studentId
        self.testStatus = .taken
        self.result=result
    }

    public mutating func initiateEvaluation(){
        
        //initialising the evaluation process
        
        self.result.answerValidation()
        DataManager.addTest(testObject: self)
    }
}

