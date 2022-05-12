public struct MockTestData{
    
    public static func loadMockTestData(){
        
        var testObject1:Test=Test(studentId:102,result:Result(studentAnswer: [1001:"A",1002:"B",1003:"A"]))
        testObject1.initiateEvaluation()
        
    }
}
