func @_HybridCryptoApp_Server.Services.SCryptPasswordHasher$TUser$.HashPassword$TUser.string$(none, none) -> none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :20 :8) {
^entry (%_user : none, %_password : none):
%0 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :20 :35)
cbde.store %_user, %0 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :20 :35)
%1 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :20 :47)
cbde.store %_password, %1 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :20 :47)
br ^0

^0: // BinaryBranchBlock
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :23 :16) // string (PredefinedType)
%3 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :23 :37) // Not a variable of known type: password
%4 = cbde.unknown : i1 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :23 :16) // string.IsNullOrEmpty(password) (InvocationExpression)
cond_br %4, ^1, ^2 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :23 :16)

^1: // JumpBlock
%5 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :25 :44) // nameof(password) (InvocationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :25 :22) // new ArgumentException(nameof(password)) (ObjectCreationExpression)
cbde.throw %6 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :25 :16)

^2: // JumpBlock
%7 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :29 :60) // Not a variable of known type: iterationCount
%8 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :29 :76) // Not a variable of known type: blockSize
%9 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :29 :87) // Not a variable of known type: threadCount
%10 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :29 :42) // new ScryptEncoder(iterationCount, blockSize, threadCount) (ObjectCreationExpression)
%12 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :30 :19) // Not a variable of known type: scryptEncoder
%13 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :30 :40) // Not a variable of known type: password
%14 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :30 :19) // scryptEncoder.Encode(password) (InvocationExpression)
return %14 : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :30 :12)

^3: // ExitBlock
cbde.unreachable

}
func @_HybridCryptoApp_Server.Services.SCryptPasswordHasher$TUser$.VerifyHashedPassword$TUser.string.string$(none, none, none) -> none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :34 :8) {
^entry (%_user : none, %_hashedPassword : none, %_providedPassword : none):
%0 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :34 :63)
cbde.store %_user, %0 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :34 :63)
%1 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :34 :75)
cbde.store %_hashedPassword, %1 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :34 :75)
%2 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :34 :98)
cbde.store %_providedPassword, %2 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :34 :98)
br ^0

^0: // BinaryBranchBlock
%3 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :37 :16) // string (PredefinedType)
%4 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :37 :37) // Not a variable of known type: hashedPassword
%5 = cbde.unknown : i1 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :37 :16) // string.IsNullOrEmpty(hashedPassword) (InvocationExpression)
cond_br %5, ^1, ^2 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :37 :16)

^1: // JumpBlock
%6 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :39 :44) // nameof(hashedPassword) (InvocationExpression)
%7 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :39 :22) // new ArgumentException(nameof(hashedPassword)) (ObjectCreationExpression)
cbde.throw %7 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :39 :16)

^2: // BinaryBranchBlock
%8 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :42 :16) // string (PredefinedType)
%9 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :42 :37) // Not a variable of known type: providedPassword
%10 = cbde.unknown : i1 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :42 :16) // string.IsNullOrEmpty(providedPassword) (InvocationExpression)
cond_br %10, ^3, ^4 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :42 :16)

^3: // JumpBlock
%11 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :44 :44) // nameof(providedPassword) (InvocationExpression)
%12 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :44 :22) // new ArgumentException(nameof(providedPassword)) (ObjectCreationExpression)
cbde.throw %12 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :44 :16)

^4: // BinaryBranchBlock
%13 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :48 :36) // new ScryptEncoder() (ObjectCreationExpression)
%15 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :49 :27) // Not a variable of known type: encoder
%16 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :49 :43) // Not a variable of known type: providedPassword
%17 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :49 :61) // Not a variable of known type: hashedPassword
%18 = cbde.unknown : i1 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :49 :27) // encoder.Compare(providedPassword, hashedPassword) (InvocationExpression)
%19 = cbde.alloca i1 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :49 :17) // isValid
cbde.store %18, %19 : memref<i1> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :49 :17)
%20 = cbde.load %19 : memref<i1> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :52 :16)
cond_br %20, ^5, ^6 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :52 :16)

^5: // JumpBlock
// Entity from another assembly: PasswordVerificationResult
%21 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :54 :23) // PasswordVerificationResult.Success (SimpleMemberAccessExpression)
return %21 : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :54 :16)

^6: // JumpBlock
// Entity from another assembly: PasswordVerificationResult
%22 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :57 :19) // PasswordVerificationResult.Failed (SimpleMemberAccessExpression)
return %22 : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server\\Services\\ScryptPasswordHasher.cs" :57 :12)

^7: // ExitBlock
cbde.unreachable

}
