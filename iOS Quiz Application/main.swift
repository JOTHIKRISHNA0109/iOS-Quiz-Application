Quiz.applicationInvoker()

while(true){
    
    if let validExistingUser=Quiz.mainAuthorization(){
        
        if let currentOperation=Quiz.operationCheck(userType: validExistingUser.userType){
        
            switch(currentOperation) {

                case .takeUpTheQuiz:
                    //student taking up the test
                    if let studentObject = Quiz.studentValidation(student: validExistingUser){
                        Quiz.loadQuestions(student: studentObject)
                    }

                case .viewYourScore:
                    //display the score pursued by the student
                    let studentScore=Quiz.displayScore(student: validExistingUser)
                    print(studentScore)

                case .addNewAdmin:
                    //add a new admin
                    Quiz.adminRegisteration()

                case .updateQuestions:
                    //get list of updated questions
                    Quiz.updateQuestions()

                case .viewQuestions:
                    //view the list of questions with their questionID
                    Quiz.viewQuestions()

                case .viewStudents:
                    //view the details of the student
                    Quiz.viewStudentList()
            
                case .viewStudentScore:
                    //view the testDetails of particular student
                    Quiz.viewStudentScore()

                    
            }
        }
    }
    else{Quiz.newUserHandler()}
}



