public struct DataManager{

    private static var adminArray:[Admin]=[]
    private static var studentArray:[Student]=[]
    private static var userArray:[User]=[]
    public static var testDetails:[Test]=[]
    
    public static var studentChoices:[OperationType] = [.takeUpTheQuiz,.viewYourScore]
    
    public static var adminChoices:[OperationType]=[.addNewAdmin,.updateQuestions,.viewQuestions,.viewStudents,.viewStudentScore]
    
    public static func getStudents()->[Student]{
        
        //returns the list of student objects
        
        return (DataManager.studentArray)
    }
    
    public static func getTestDetails()->[Test]{
        
        //returns the list of test objects
        
        return (DataManager.testDetails)
    }
    
    public static func getAdmin()->[Admin]{
        
        //returns the list of admin objects
        
        return (DataManager.adminArray)
    }
    
    public static func getUserArray()->[User]{
        
        //returns the list of user objects
        
        return (DataManager.userArray)
    }
    
    public static func addAdmin(admin:Admin){
        
        //adding the admin object to its corresponding list
        
        DataManager.adminArray.append(admin)
        DataManager.userArray.append(admin)
    }
    
    public static func addStudent(student:Student){
        
        //adding the student object to its corresponding list
        
        DataManager.studentArray.append(student)
        DataManager.userArray.append(student)
    }
    
    public static func addTest(testObject:Test){
        
        //adding the test object to its corresponding list
        
        DataManager.testDetails.append(testObject)
    }
    
}

