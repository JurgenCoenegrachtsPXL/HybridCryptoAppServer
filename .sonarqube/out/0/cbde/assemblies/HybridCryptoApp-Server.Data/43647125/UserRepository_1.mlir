func @_HybridCryptoApp_Server.Data.Repositories.UserRepository.GetById$int$(i32) -> none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :16 :8) {
^entry (%_userId : i32):
%0 = cbde.alloca i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :16 :28)
cbde.store %_userId, %0 : memref<i32> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :16 :28)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :18 :19) // Not a variable of known type: context
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :18 :19) // context.Users (SimpleMemberAccessExpression)
%3 = cbde.load %0 : memref<i32> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :18 :38)
%4 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :18 :19) // context.Users.Find(userId) (InvocationExpression)
return %4 : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :18 :12)

^1: // ExitBlock
cbde.unreachable

}
func @_HybridCryptoApp_Server.Data.Repositories.UserRepository.Add$HybridCryptoApp_Server.Data.Models.User$(none) -> () loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :22 :8) {
^entry (%_newUser : none):
%0 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :22 :24)
cbde.store %_newUser, %0 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :22 :24)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :25 :16) // Not a variable of known type: context
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :25 :16) // context.Users (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :25 :35) // Not a variable of known type: newUser
%4 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :25 :35) // newUser.Id (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :25 :16) // context.Users.Find(newUser.Id) (InvocationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :25 :50) // null (NullLiteralExpression)
%7 = cbde.unknown : i1  loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :25 :16) // comparison of unknown type: context.Users.Find(newUser.Id) == null
cond_br %7, ^1, ^2 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :25 :16)

^1: // SimpleBlock
%8 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :27 :16) // Not a variable of known type: context
%9 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :27 :16) // context.Users (SimpleMemberAccessExpression)
%10 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :27 :34) // Not a variable of known type: newUser
%11 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :27 :16) // context.Users.Add(newUser) (InvocationExpression)
%12 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :28 :16) // Not a variable of known type: context
%13 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :28 :16) // context.SaveChanges() (InvocationExpression)
br ^3

^2: // JumpBlock
%14 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :32 :57) // Not a variable of known type: newUser
%15 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :32 :57) // newUser.Id (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :32 :44) // $"User with {newUser.Id} already exists!" (InterpolatedStringExpression)
%17 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :32 :22) // new ArgumentException($"User with {newUser.Id} already exists!") (ObjectCreationExpression)
cbde.throw %17 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :32 :16)

^3: // ExitBlock
return

}
func @_HybridCryptoApp_Server.Data.Repositories.UserRepository.Update$HybridCryptoApp_Server.Data.Models.User$(none) -> () loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :37 :8) {
^entry (%_existingUser : none):
%0 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :37 :27)
cbde.store %_existingUser, %0 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :37 :27)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :40 :16) // Not a variable of known type: context
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :40 :16) // context.Users (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :40 :35) // Not a variable of known type: existingUser
%4 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :40 :35) // existingUser.Id (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :40 :16) // context.Users.Find(existingUser.Id) (InvocationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :40 :55) // null (NullLiteralExpression)
%7 = cbde.unknown : i1  loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :40 :16) // comparison of unknown type: context.Users.Find(existingUser.Id) != null
cond_br %7, ^1, ^2 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :40 :16)

^1: // SimpleBlock
%8 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :42 :16) // Not a variable of known type: context
%9 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :42 :16) // context.Users (SimpleMemberAccessExpression)
%10 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :42 :37) // Not a variable of known type: existingUser
%11 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :42 :16) // context.Users.Update(existingUser) (InvocationExpression)
%12 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :43 :16) // Not a variable of known type: context
%13 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :43 :16) // context.SaveChanges() (InvocationExpression)
br ^3

^2: // JumpBlock
%14 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :47 :69) // Not a variable of known type: existingUser
%15 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :47 :69) // existingUser.Id (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :47 :44) // $"No user found with Id {existingUser.Id}" (InterpolatedStringExpression)
%17 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :47 :22) // new ArgumentException($"No user found with Id {existingUser.Id}") (ObjectCreationExpression)
cbde.throw %17 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :47 :16)

^3: // ExitBlock
return

}
func @_HybridCryptoApp_Server.Data.Repositories.UserRepository.Delete$HybridCryptoApp_Server.Data.Models.User$(none) -> () loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :52 :8) {
^entry (%_existingUser : none):
%0 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :52 :27)
cbde.store %_existingUser, %0 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :52 :27)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :55 :16) // Not a variable of known type: context
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :55 :16) // context.Users (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :55 :35) // Not a variable of known type: existingUser
%4 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :55 :35) // existingUser.Id (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :55 :16) // context.Users.Find(existingUser.Id) (InvocationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :55 :55) // null (NullLiteralExpression)
%7 = cbde.unknown : i1  loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :55 :16) // comparison of unknown type: context.Users.Find(existingUser.Id) != null
cond_br %7, ^1, ^2 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :55 :16)

^1: // SimpleBlock
%8 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :57 :16) // Not a variable of known type: context
%9 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :57 :16) // context.Users (SimpleMemberAccessExpression)
%10 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :57 :37) // Not a variable of known type: existingUser
%11 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :57 :16) // context.Users.Remove(existingUser) (InvocationExpression)
%12 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :58 :16) // Not a variable of known type: context
%13 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :58 :16) // context.SaveChanges() (InvocationExpression)
br ^3

^2: // JumpBlock
%14 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :62 :69) // Not a variable of known type: existingUser
%15 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :62 :69) // existingUser.Id (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :62 :44) // $"No user found with Id {existingUser.Id}" (InterpolatedStringExpression)
%17 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :62 :22) // new ArgumentException($"No user found with Id {existingUser.Id}") (ObjectCreationExpression)
cbde.throw %17 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserRepository.cs" :62 :16)

^3: // ExitBlock
return

}
