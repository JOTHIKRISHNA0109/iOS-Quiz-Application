struct Quiz{
    
    //Core class which connects main to all other classes
    //also does the maximum number of calling and implementation process
    
    
    public static func applicationInvoker(){
        
        //invokes the appplicaton
        
        Quiz.loadMockData()
        Quiz.greetings()
    }
    
    public static func loadMockData(){
        
        //loads the mock/dummy data into the datamanager
        
        MockData.loadMockStudents()
        MockData.loadMockAdmin()
        MockQuestions.loadMockQuestions()
        MockTestData.loadMockTestData()
    }
    
    public static func greetings(){
        
        //prints the header greeting lines
        
        print(Utils.greetings)
        print(Utils.horizontalLine)
    }
    
    public static func mainAuthorization() -> User?{
        
        //validates the mailID and password given by the existing user
        //passes it to the choice validator and validates on the whole
        
        print("Enter your mailID:",terminator: " ")
        let mailId=readLine()!
        if let user=userExists(mailId:mailId){
            print("Enter your Password:",terminator: " ")
            let password=readLine()!
            if user.checkPassword(password: password){
                    return user
            }
            print(Utils.invalidLogin)
            return nil
        }
        return nil
    }

    
    public static func userExists(mailId:String) -> User? {
        
        //checks weather the user with the given mailID exists
        //returns the user obejct if corresponding user object exisits
        
        let user = DataManager.getUserArray().first(where: {$0.getMailId() == mailId})
        return user
    }
    
    public static func displayMenu(){
        print(Utils.operationMenu)
    }
    
    
    public static func operationCheck(userType:UserType)->OperationType?{
        
        displayMenu()
        while (true){
            
            print(Utils.enterOperationChoice,terminator: " ")
            let option=Int(readLine()!)!
            
            if option<=8 && option>0{
                let requiredOperation:OperationType=OperationType(rawValue: option) ?? .takeUpTheQuiz
                if operationValidator(userType: userType, choosenOperation: requiredOperation){
                    return requiredOperation
                }
                return nil
            }
                
            else{print(Utils.invalidOption)}
        }
        
    }
    
    
    public static func operationValidator(userType:UserType,choosenOperation:OperationType)->Bool{
        
        //validates weather the user type and required operation coincides
        //that is, if the user has the access to perform the desired operation
        
        if userType == .student && DataManager.studentChoices.contains(choosenOperation){
            print(Utils.validLoginMessage)
            return true
        }
        else if userType == .admin && DataManager.adminChoices.contains(choosenOperation){
            print(Utils.validLoginMessage)
            return true
        }
        print(Utils.invalidUserChoice)
        return false
    }
    
    
    public static func newUserHandler(){
        
        //driver function which handles the newUser to regiser for the test
        
            let fromAction=choiceOfAction(questionPhrase: Utils.freshUsercheck)
            if fromAction{
                let action = choiceOfAction(questionPhrase: Utils.wantToRegister)
                if action{
                    print(Utils.takeToQuizPage)
                    studentRegisteration()
                }
                else{print(Utils.thanksApplication)}
            }
        else{print(Utils.invalidNewUser)}
    
    }
    
    public static func passwordValidation(password:String,confirmedPassword:String,minimumLength:Int)->Utils.PasswordConfirmation{
        
           // validates the strength of the password
        
           if password.count<=minimumLength{
               return .unstrongPassword
           }
           else if(password != confirmedPassword){
               return .unmatchedPassword
           }
           else{
               return .validPassword
           }
       }
    
    public static func passwordEvaluation(password:String,confirmedPassword:String)->Bool{
        
        //checks the strength of the password given
        //also verifies if both the passwords are same
        
        let passwordVerify=passwordValidation(password:password,confirmedPassword:confirmedPassword,minimumLength:Utils.passwordMinimumLengthRequired)
        switch(passwordVerify){
            case .unmatchedPassword:
                print(Utils.PasswordConfirmation.unmatchedPassword.rawValue)
                return false
            case .unstrongPassword:
                print(Utils.PasswordConfirmation.unstrongPassword.rawValue)
                return false
            default:
                print(Utils.PasswordConfirmation.validPassword.rawValue)
                return true
        }
    }
    
    public static func mailIdEvaluation(mailId:String)->Bool{
        
        //evaluates the mailId and checks weather the mailId is valid or not
        
        if mailId.contains("@") && mailId.contains("."){
            return true
        }
        print(Utils.enterValidMailId)
        return false
    }
    
    
    public static func validPhoneNumberFormat(phoneNumber:String)->Bool{
        
        //checks weather the given phone number is valid or not
        
        let number = Int(phoneNumber);

            if number != nil {
               return true
            }
            return false
    }
    
    public static func wordValidation(word:String)->Bool{
        
        //checks weather the given string length exists
        
        if word.count == 0{
            return false
        }
        return true
        
    }
    
    public static func studentValidation(student:User)->Student?{
        
        //checks if given credentials of the student are true
        //else returns nil
        
        //let student = DataManager.getStudents().first(where: {$0.getMailId()==mailId && $0.checkPassword(password:password)})
        if ((student as? Student) != nil){
            return (student as! Student)
        }
        return nil
    }
    
    public static func choiceOfAction(questionPhrase:String)->Bool{
        
        //gets the yes/no input choice from the user
        //and returns a boolean value
        
        while(true){
            print((questionPhrase),terminator:" " )
            let responseAction=readLine()!.uppercased()
            if responseAction == "Y" || responseAction == "YES"{
                return true
            }
            else if responseAction == "N" || responseAction == "NO"{
                return false
            }
            else{
                print(Utils.invalidOption)
            }
        }
    }
    
    public static func registerationDetails()->[String:String]?{
        
        //get new user detatils for registeration
        
        var registerationParameter:[String:String]=[:]
        while(true){
            print("Enter your name:",terminator:" ")
            let name=readLine()!
            if wordValidation(word: name){
                while(true){
                    print(Utils.passwordInstruction)
                    print("Enter your password:",terminator:" ")
                    let password=readLine()!
                    print("Enter your password again:",terminator:" ")
                    let confirmationPassword=readLine()!
                    if passwordEvaluation(password: password, confirmedPassword: confirmationPassword){
                        print("Enter your mailId:",terminator:" ")
                        let mailId=readLine()!
                        if mailIdEvaluation(mailId:mailId){
                            while(true){
                                print("Enter your phoneNumber:",terminator:" ")
                                let phoneNumber=readLine()!
                                if validPhoneNumberFormat(phoneNumber:phoneNumber){
                                    registerationParameter["Name"]=name
                                    registerationParameter["Password"]=password
                                    registerationParameter["MailID"]=mailId
                                    registerationParameter["PhoneNumber"]=phoneNumber
                                    return registerationParameter
                                }
                                else{print("Invalid Phone number format:(")}
                            }
                        }
                    }
                }
            }else{print(Utils.invalidType)}
        }
    }
    
    public static func studentRegisteration(){
        
        //gets the details of the student from the user
        //and registers for the test
        
        if let userDetails = registerationDetails(){
            Quiz.studentConstruction(name: userDetails["Name"]!, mailId: userDetails["MailID"]!, phoneNumber: userDetails["PhoneNumber"]!, password: userDetails["Password"]!)
        }
                            
    
    }
    
    public static func studentConstruction(name:String,mailId:String,phoneNumber:String,password:String){
        
        //checks if the student has already registered for the test or else
        //new student object is created
        
        if Student.registeration(phoneNumber: phoneNumber, mailId: mailId){
            let studentObject=Student(name:name,password:password,mailId:mailId,phoneNumber:phoneNumber)
            DataManager.addStudent(student: studentObject)
            print("\t\t\t\t\(Utils.successfulRegisteration)")
            print(Utils.studentContents)
            print("\(studentObject.getStudentId())\t\t\(studentObject.getUserName())\t\t\(studentObject.getMailId())\t\t\(studentObject.getPhoneNumber())")
            print("\t\t\t\t\(Utils.wishForTest)")
            let action=choiceOfAction(questionPhrase: Utils.wishToTakeTest)
            if action && !alreadyTakenTest(studentId: studentObject.getStudentId()){
                loadQuestions(student: studentObject)
            }
            else{
                print(Utils.takeUpSoon)
            }
        }
        else{
            print(Utils.unsuccessfulRegisteration)
        }
    }
    
    public static func alreadyTakenTest(studentId:Int)->Bool{
        
        //checks weather the student has taken the test already
        //return true if already taken
        
        let testDetatil=DataManager.testDetails
        
        if testDetatil.first(where: {$0.studentId==studentId}) != nil{
            return true
        }
        return false
        
    }
    
    public static func loadQuestions(student:Student){
        
        //loads the question with their option one by one
        //allows the user to give their answer and sends it to the evaluation process
        
        if !(alreadyTakenTest(studentId: student.getStudentId())){
        
            print(Utils.readyForTest)
            print(Utils.enterOptions)
            let questionArray=QuestionData.getQuestionList()
            var userAnswerArray:[String]=[]
            var questionNumber=1
            var studentAnswerDictionary:[Int:String]=[:]
            for questionObject in questionArray{
                print("Question Number: \(questionNumber)")
                print("Question: \(questionObject.getQuestion())")
                let choicesDictionary = (questionObject.getChoices()).sorted( by: { $0 < $1 })
                for (key,value) in choicesDictionary{
                    print("\(key). \(value)")
                }
                while(true){
                    print(Utils.enterAnswer,terminator: " ")
                    let userAnswer=readLine()
                    if questionObject.validUserAnswer(userAnswer:userAnswer!){
                        studentAnswerDictionary[questionObject.getQuestionId()]=userAnswer!.uppercased()
                        userAnswerArray.append(userAnswer!.uppercased())
                        questionNumber+=1
                        break
                    }
                    else{print(Utils.invalidOption)}
                }
        }
        testProcess(studentId:student.getStudentId(),studentAnswer:studentAnswerDictionary)
        let action=choiceOfAction(questionPhrase: Utils.wantSummary)
            if action{
                print(Utils.questionWiseStatus)
                testSummary(student: student)
                studentSummary(student:student)
            }
            else{
                print(Utils.thanksText)
            }
        }
        else{
            print("You have already taken the test:)\nYour scores are here:)")
            print(Utils.questionWiseStatus)
            testSummary(student: student)
            studentSummary(student:student)
        }
    }
    
    public static func testProcess(studentId:Int,studentAnswer:[Int:String]){
        
        //test object for the student is being created
        //
        
        var testObject=Test(studentId:studentId,result:Result(studentAnswer: studentAnswer))
        testObject.initiateEvaluation()
    }
    
    public static func testSummary(student:Student){
        
        //view test summary of the student required
        
        let questionDetails = DataManager.getTestDetails()
        print("\n\t\t\t\t\t\t\tQuestion ID\tYour Answer\t\t\tAnswer Status")
        for questionDetail in questionDetails{
            if questionDetail.studentId==student.getStudentId(){
                var questionCount=0
                let studentAnswerDict = (questionDetail.result.studentAnswer).sorted( by: { $0 < $1 })
                for (id,answer) in studentAnswerDict{
                    print("\t\t\t\t\t\t\t\(id)\t\t\t\(answer)\t\t\t\t\(String(describing: questionDetail.result.resultSummary[id]!))")
                    questionCount+=1
                }
                
            }
        }
    }
    
    public static func studentSummary(student:Student){
        
        //prints the student summary with his scores
        
        let testDeatil=DataManager.getTestDetails().first(where: { $0.studentId == student.getStudentId()})
        
        print(Utils.studentSummary)
        print("StudentID\tStudent Name\t\tStudent MailID\t\t\tTestStatus\t\tMarks Scored\t\tMaximum Marks")
        print("\(student.getStudentId())\t\t\t\(student.getUserName())\t\t\(student.getMailId())\t\t\t\(testDeatil!.testStatus)\t\t\t\t\(testDeatil!.result.score)\t\t\t\t\t\(QuestionData.getTotalMarks())")
    }

    public static func displayScore(student: User)->String{
        
        //displays score of the student
        
        if let student=studentValidation(student:student){
            for testDetail in DataManager.getTestDetails(){
                if testDetail.studentId==student.getStudentId(){
                    return ("Your test scoire is \(testDetail.result.score)")
                }
            }
            return(Utils.testNotTaken)
        }
        return(Utils.userDontExist)
    }
    
    public static func adminRegisteration(){
        
        //add a new admin
        //in the sense, to create a new admin object
        
        if let userDetails=registerationDetails(){
            adminConstruction(name: userDetails["Name"]!, mailId: userDetails["MailID"]!, phoneNumber: userDetails["PhoneNumber"]!, password: userDetails["Password"]!)
        }
        
    }
    
    public static func adminConstruction(name:String,mailId:String,phoneNumber:String,password:String){
        
        //creating a new admin object
        //and appending it into the admin list
        
        let adminObject=Admin(name:name,password:password,mailId:mailId, phoneNumber:phoneNumber)
        adminObject.addAdmin(admin: adminObject)
        print(Utils.successfulAddition)
    }
    
    public static func updateQuestions(){
        
        //add a new question that is,
        //creating a new question object
        
        let question=AddQuestion.question
        let optionArray=AddQuestion.choiceArray
        let answer=AddQuestion.answer
        let questionObject=Question(question: question, optionArray: optionArray, answer: answer)
        QuestionData.setKey(question: questionObject)
        print("Question:\(questionObject.getQuestion())")
        print("Answer: \(questionObject.getAnswer())")
        print(Utils.validQuestionAddition)
        let action=choiceOfAction(questionPhrase: Utils.wantViewQuestions)
            if action{
                viewQuestions()
            }
            else{
                print(Utils.thanksAdmin)
            }
    }
    
    public static func viewQuestions(){
        
        //display the questions with answer option
        
        let questionList=QuestionData.getQuestionList()
        print(Utils.questionContents)
        for question in questionList{
            print(question.getQuestionId(),question.getQuestion(),question.getAnswer())
        }
    }
    
    public static func viewStudentList(){
        
        //display the students with all their properties
        
        let studentList=DataManager.getStudents()
        print(Utils.studentContents)
        for student in studentList{
            print("\(student.getStudentId())\t\t\t\(student.getUserName())\t\t\t\(student.getMailId())\t\t\t\(student.getPhoneNumber())")
        }
    }
    
    public static func viewStudentScore(){
        
        //display the student score which is required
        
        while(true){
            print("Enter the mailID of the student:",terminator: " ")
            let targetMailId:String=readLine()!
        
            if let student=(userExists(mailId: targetMailId)){
                if let stu = student as? Student{
                    if let testDetail=DataManager.getTestDetails().first(where: {$0.studentId==stu.getStudentId()}){
                        var questionCount=0
                        let studentAnswerDict = (testDetail.result.studentAnswer).sorted( by: { $0 < $1 })
                        print("\n\t\t\t\t\t\t\tQuestion ID\tYour Answer\t\t\tAnswer Status")
                        for (id,answer) in studentAnswerDict{
                            print("\t\t\t\t\t\t\t\(id)\t\t\t\(answer)\t\t\t\t\(String(describing: testDetail.result.resultSummary[id]!))")
                            questionCount+=1
                        }
                        let testDeatil=DataManager.getTestDetails().first(where: { $0.studentId == stu.getStudentId()})
                    
                        print(Utils.studentSummary)
                        print("StudentID\tStudent Name\t\tStudent MailID\t\t\tTestStatus\t\tMarks Scored\t\tMaximum Marks")
                        print("\(stu.getStudentId())\t\t\t\(stu.getUserName())\t\t\(stu.getMailId())\t\t\t\(testDetail.testStatus)\t\t\t\t\(testDeatil!.result.score)\t\t\t\t\t\(QuestionData.getTotalMarks())")
                        break
                    }
                    else{
                        print("The student has not yet taken the test:)")
                        break
                    }
                }
            }
            else{print("Such user doesn't exists:(")}
        }

    }
}


