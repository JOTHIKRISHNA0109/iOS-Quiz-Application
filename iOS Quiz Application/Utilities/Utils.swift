struct Utils{
    
    //String output which are utilized at various places
    
    public enum PasswordConfirmation:String{
        case unstrongPassword="Oops, your password is not strong enough like you!"
        case unmatchedPassword="Nah, nah! Both the passwords didn't match!"
        case validPassword="Your password is also strong like you!"
    }
    
    static let greetings:String="\t\tHello, Welcome to the iOS Quiz Application!!!"
    
    static let horizontalLine:String="\t\t--------------------------------------------"
    
    static let wishForTest:String="All the best for your Quiz!!!🎀"
    
    static let validLoginMessage:String="Login Successful:)"
    
    static let invalidAdminChoice:String="Oops, Admin can't access the prefered option:("
    
    static let invalidUserChoice:String="Oops, The logged in user can't access the prefered option:("
    
    static let invalidStudentChoice:String="Aaaah, Student can't access the prefered option:("
    
    static let passwordMinimumLengthRequired:Int=6
    
    static let successfulAddition:String="Admin has been added successfully:)"
    
    static let studentContents:String="Student ID\tStudent Name\t\tStudent MailID\t\t Student Phn.No."
    
    static let successfulRegisteration:String="Registeration is successfull!!!"
    
    static let unsuccessfulRegisteration:String="Unsuccessful Registeration as, user already exists:("
    
    static let readyForTest:String="Get ready for your test⭐️!!!"
    
    static let enterAnswer:String="Type your answer: "
    
    static let studentSummary:String="\n\t\t\t\t\t\t\t\t*********Quiz Summary Report************\n"
    
    static let invalidCredentials:String="Please enter valid credentials\nIf you haven't registered yet, kindly register and then take up the test!"
    
    static let invalidLogin:String="Hello, Your password seems to be wrong! Try logging again:)"
    
    static let validQuestionAddition:String="Question has been added successfully:)"
    
    static let questionContents:String="QuestionId\t\tQuestion\t\t\t\t\t\t\t\t\t\tAnswer"
    
    static let testNotTaken:String="Ouch! You haven't taken the test yet:("
    
    static let freshUsercheck:String="Wait!wait!!wait!!! Are you a new user?(Y/N)"
    
    static let newUser:String="Adadehhhh, New User?\nPleasant to have you out here!"
    
    static let takeToQuizPage:String="Taking you to the quiz registeration page..."
    
    static let tryAgain:String="Please, try logging in again."
    
    static let wantSummary:String="You have completed the quiz! Do you wish to know your test score now?(Y/N)"
    
    static let thanksText:String="Thank you for taking up the test. All the best for your future!"

    static let thanksAdmin:String="Thank you for adding up a question:)"
    
    static let wishToTakeTest:String="Do you wish to take test now?(Y/N)"
    
    static let takeUpSoon:String="A week from now you may wish you had started today.-Karen Lamb \nSo come back and take the test very soon:)"
    
    static let wantViewQuestions:String="Wishing to view all the questions of the Quiz?"
    
    static let wantToRegister:String="Wishing to register for the test?(Y/N)"
    
    static let questionWiseStatus="\n\t\t\t\t\t\t\t********** Question wise Status **********"
    
    static let thanksApplication:String="Thank you for your intrest towards this application. All the best for your future!"
    
    static let enterValidMailId:String="Please enter valid MailID:("
    
    static let userDontExist:String="User doesn't exists."
    
    static let enterOptions:String="Please enter the options alone🙌"
    
    static let passwordInstruction:String="**Note: Your password should atleast have \(Utils.passwordMinimumLengthRequired) charactersA"
    
    static let invalidOption:String="Please enter a valid option"
    
    static let invalidNewUser:String="The prefered option cannot be accessed by a new user.\nAs a new user cannot be an admin."
    
    static let invalidType:String="Please enter things in a valid format:("
    
    static let operationMenu:String="\n\tHere's a list of operations for you!!!\n\t\t---------------------------\n\t\t1-> Take Up the Quiz✍️\n\n\t\t2->View Your Score💯\n\n\t\t3->Add a new admin➕\n\n\t\t4->Update Question📝\n\n\t\t5->View Questions📒\n\n\t\t6->View Students👨‍🎓\n\n\t\t7->View Students Score✅\n\t\t---------------------------\n"
    
    static let enterOperationChoice:String="Welcome, please enter your operation choice:"
    
}

