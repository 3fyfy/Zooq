import 'package:zooq/authintication/firebase_auth.dart';
class UserController{
  FirebaseAuthintication _firebaseAuthintication=FirebaseAuthintication();

  loginController(String email,String password)async{
   var user= await _firebaseAuthintication.login(email, password);
   print(user);
   print(user.uid);
   return user;

  }

  currentUserController()async{
    var user= await _firebaseAuthintication.getCurrenUser();
    print(user);
    print(user.uid);
    return user;

  }
  registerController(String email,String password)async{
    var user=await _firebaseAuthintication.register(email, password);
    print(user);
    print(user.uid);
  }

  logOutController(){
    _firebaseAuthintication.signOut();


  }



}