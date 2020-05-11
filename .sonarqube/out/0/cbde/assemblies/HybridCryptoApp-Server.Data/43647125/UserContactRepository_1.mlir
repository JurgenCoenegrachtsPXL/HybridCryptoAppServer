// Skipping function GetUserContactsOfUser(i32), it contains poisonous unsupported syntaxes

// Skipping function Add(none), it contains poisonous unsupported syntaxes

func @_HybridCryptoApp_Server.Data.Repositories.UserContactRepository.Update$HybridCryptoApp_Server.Data.Models.UserContact$(none) -> () loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :46 :8) {
^entry (%_existingItem : none):
%0 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :46 :27)
cbde.store %_existingItem, %0 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :46 :27)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :48 :40) // "Update is not possible for UserContacts." (StringLiteralExpression)
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :48 :18) // new ArgumentException("Update is not possible for UserContacts.") (ObjectCreationExpression)
cbde.throw %2 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :48 :12)

^1: // ExitBlock
return

}
func @_HybridCryptoApp_Server.Data.Repositories.UserContactRepository.Delete$HybridCryptoApp_Server.Data.Models.UserContact$(none) -> () loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :52 :8) {
^entry (%_existingItem : none):
%0 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :52 :27)
cbde.store %_existingItem, %0 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :52 :27)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :55 :39) // Not a variable of known type: context
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :55 :39) // context.UserContacts (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :55 :65) // Not a variable of known type: existingItem
%4 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :55 :65) // existingItem.OwnerId (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :55 :87) // Not a variable of known type: existingItem
%6 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :55 :87) // existingItem.ContactId (SimpleMemberAccessExpression)
%7 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :55 :39) // context.UserContacts.Find(existingItem.OwnerId, existingItem.ContactId) (InvocationExpression)
%9 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :56 :16) // Not a variable of known type: foundContact
%10 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :56 :32) // null (NullLiteralExpression)
%11 = cbde.unknown : i1  loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :56 :16) // comparison of unknown type: foundContact != null
cond_br %11, ^1, ^2 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :56 :16)

^1: // SimpleBlock
%12 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :58 :31) // Not a variable of known type: context
%13 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :58 :45) // Not a variable of known type: foundContact
%14 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :58 :31) // context.Entry(foundContact) (InvocationExpression)
%15 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :58 :31) // context.Entry(foundContact).Entity (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :60 :16) // Not a variable of known type: context
%17 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :60 :16) // context.UserContacts (SimpleMemberAccessExpression)
%18 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :60 :44) // Not a variable of known type: foundContact
%19 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :60 :16) // context.UserContacts.Remove(foundContact) (InvocationExpression)
%20 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :61 :16) // Not a variable of known type: context
%21 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :61 :16) // context.SaveChanges() (InvocationExpression)
br ^3

^2: // JumpBlock
%22 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :65 :82) // Not a variable of known type: existingItem
%23 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :65 :82) // existingItem.OwnerId (SimpleMemberAccessExpression)
%24 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :65 :120) // Not a variable of known type: existingItem
%25 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :65 :120) // existingItem.ContactId (SimpleMemberAccessExpression)
%26 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :65 :44) // $"No UserContact found with ownerId: {existingItem.OwnerId} and contactId: {existingItem.ContactId} !" (InterpolatedStringExpression)
%27 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :65 :22) // new ArgumentException($"No UserContact found with ownerId: {existingItem.OwnerId} and contactId: {existingItem.ContactId} !") (ObjectCreationExpression)
cbde.throw %27 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\UserContactRepository.cs" :65 :16)

^3: // ExitBlock
return

}
