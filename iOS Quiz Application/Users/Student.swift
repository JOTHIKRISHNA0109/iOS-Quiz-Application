public class Student:User{
    
    private static var count = 100
    private let studentId:Int
    
    
    public init(name:String,password:String,mailId:String,phoneNumber:String){
        self.studentId=Student.count+1
        Student.count+=1
        super.init(name: name, password: password, mailId: mailId, phoneNumber: phoneNumber, userType: .student)
    }
    
    public static func registeration(phoneNumber:String,mailId:String)->Bool{
        for student in DataManager.getStudents(){
            if student.getMailId()==mailId || student.getPhoneNumber() == phoneNumber{
                return false
            }
        }
        return true
    }
    
    public func getStudentId()->Int{
        return self.studentId
    }
    
    public func studentLogin(mailId:String,password:String)->Bool{
        for student in DataManager.getStudents(){
            if student.getMailId() == mailId && student.checkPassword(password:password){
                    return true
            }
        }
        return false
    }
    
}
