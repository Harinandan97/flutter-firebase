import 'package:firebase_auth/firebase_auth.dart';

class firehelper{
  final FirebaseAuth auth= FirebaseAuth.instance;
  get user => auth.currentUser;

  Future<String?>signup({required  String mail,required String password})async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
     switch(e.code){
       case 'email-already-in-use':
         return "the email is alreay in use by another account";
       case 'invalid-email':
         return "the password is too weak. please choose a stronger password.";
         default:
           return e.message;
     }
    } catch (e) {
      return "unknown error occurd";

    }
  }
  Future<String?> signin({required String mail,required String pass})async{
    try{
      await auth.signInWithEmailAndPassword(email: mail, password: pass);
    }
    on FirebaseAuthException catch(e){
      if(e.code == 'user-nor-found'){
        return "no user found with this email";
      }else if(e.code == 'wrong password'){
        return "incorect password. please try again";
      }
      else if(e.code == 'invalid email'){
        return " enter a valid email";
      }
      else if(e.code=='user disabled'){
        return "this account has been disabled";
      }
      else{
        return e.message;
      }
    }catch(e){
      return "an unkonwn error occurred. please try agin later";
    }

  }
  Future<void>signout()async{
    await auth.signOut();
  }
}