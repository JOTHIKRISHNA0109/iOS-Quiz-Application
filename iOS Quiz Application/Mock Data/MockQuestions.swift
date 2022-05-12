struct MockQuestions{
    
    //creates and initializes mock question objects

    public static func loadMockQuestions(){
        
        let question1="What type of declaration can be used to access symbols that were defined outside the current file?"
        
        let optionArray1=["A":"Import","B":"Export","C":"Copy","D":"Mirror"]
        
        let answer1="A"
        
        let question2="Swift is an ____ language, which means anyone can take the code, build it, and contribute to the greater community."
        
        let optionArray2=["A":"Open Source","B":"Free","C":"Loose","D":"Excellant"]
        
        let answer2="A"
        
        let question3="To comment out a particular line in Swift you must use the following symbols:"
        
        let optionArray3=["A":"//","B":";;","C":"$","D":"[]"]
        
        let answer3="A"
        
        let questionObject1=Question(question: question1, optionArray:optionArray1,answer: answer1)
        QuestionData.addQuestion(question: questionObject1)
                
        let questionObject2=Question(question: question2, optionArray:optionArray2, answer: answer2)
        QuestionData.addQuestion(question: questionObject2)
        
        let questionObject3=Question(question: question3, optionArray:optionArray3, answer: answer3)
        QuestionData.addQuestion(question: questionObject3)

    }
}

