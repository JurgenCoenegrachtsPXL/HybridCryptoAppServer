func @_HybridCryptoApp_Server.Data.Repositories.EncryptedPacketRepository.Add$HybridCryptoApp_Server.Data.Models.EncryptedPacket$(none) -> () loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :20 :8) {
^entry (%_newEncryptedPacket : none):
%0 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :20 :24)
cbde.store %_newEncryptedPacket, %0 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :20 :24)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :23 :16) // Not a variable of known type: context
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :23 :16) // context.EncryptedPackets (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :23 :46) // Not a variable of known type: newEncryptedPacket
%4 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :23 :46) // newEncryptedPacket.Id (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :23 :16) // context.EncryptedPackets.Find(newEncryptedPacket.Id) (InvocationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :23 :72) // null (NullLiteralExpression)
%7 = cbde.unknown : i1  loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :23 :16) // comparison of unknown type: context.EncryptedPackets.Find(newEncryptedPacket.Id) == null
cond_br %7, ^1, ^2 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :23 :16)

^1: // SimpleBlock
%8 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :25 :16) // Not a variable of known type: context
%9 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :25 :16) // context.EncryptedPackets (SimpleMemberAccessExpression)
%10 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :25 :45) // Not a variable of known type: newEncryptedPacket
%11 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :25 :16) // context.EncryptedPackets.Add(newEncryptedPacket) (InvocationExpression)
%12 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :26 :16) // Not a variable of known type: context
%13 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :26 :16) // context.SaveChanges() (InvocationExpression)
br ^3

^2: // JumpBlock
%14 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :30 :72) // Not a variable of known type: newEncryptedPacket
%15 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :30 :72) // newEncryptedPacket.Id (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :30 :44) // $"EncryptedPacket with Id: {newEncryptedPacket.Id} already exists!" (InterpolatedStringExpression)
%17 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :30 :22) // new ArgumentException($"EncryptedPacket with Id: {newEncryptedPacket.Id} already exists!") (ObjectCreationExpression)
cbde.throw %17 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :30 :16)

^3: // ExitBlock
return

}
func @_HybridCryptoApp_Server.Data.Repositories.EncryptedPacketRepository.Update$HybridCryptoApp_Server.Data.Models.EncryptedPacket$(none) -> () loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :35 :8) {
^entry (%_existingItem : none):
%0 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :35 :27)
cbde.store %_existingItem, %0 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :35 :27)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :38 :16) // Not a variable of known type: context
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :38 :16) // context.EncryptedPackets (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :38 :46) // Not a variable of known type: existingItem
%4 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :38 :46) // existingItem.Id (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :38 :16) // context.EncryptedPackets.Find(existingItem.Id) (InvocationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :38 :66) // null (NullLiteralExpression)
%7 = cbde.unknown : i1  loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :38 :16) // comparison of unknown type: context.EncryptedPackets.Find(existingItem.Id) != null
cond_br %7, ^1, ^2 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :38 :16)

^1: // SimpleBlock
%8 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :40 :16) // Not a variable of known type: context
%9 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :40 :16) // context.EncryptedPackets (SimpleMemberAccessExpression)
%10 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :40 :48) // Not a variable of known type: existingItem
%11 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :40 :16) // context.EncryptedPackets.Update(existingItem) (InvocationExpression)
%12 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :41 :16) // Not a variable of known type: context
%13 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :41 :16) // context.SaveChanges() (InvocationExpression)
br ^3

^2: // JumpBlock
%14 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :45 :81) // Not a variable of known type: existingItem
%15 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :45 :81) // existingItem.Id (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :45 :44) // $"No EncryptedPacket found with Id: {existingItem.Id}!" (InterpolatedStringExpression)
%17 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :45 :22) // new ArgumentException($"No EncryptedPacket found with Id: {existingItem.Id}!") (ObjectCreationExpression)
cbde.throw %17 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :45 :16)

^3: // ExitBlock
return

}
func @_HybridCryptoApp_Server.Data.Repositories.EncryptedPacketRepository.Delete$HybridCryptoApp_Server.Data.Models.EncryptedPacket$(none) -> () loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :50 :8) {
^entry (%_existingItem : none):
%0 = cbde.alloca none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :50 :27)
cbde.store %_existingItem, %0 : memref<none> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :50 :27)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :53 :16) // Not a variable of known type: context
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :53 :16) // context.EncryptedPackets (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :53 :46) // Not a variable of known type: existingItem
%4 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :53 :46) // existingItem.Id (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :53 :16) // context.EncryptedPackets.Find(existingItem.Id) (InvocationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :53 :66) // null (NullLiteralExpression)
%7 = cbde.unknown : i1  loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :53 :16) // comparison of unknown type: context.EncryptedPackets.Find(existingItem.Id) != null
cond_br %7, ^1, ^2 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :53 :16)

^1: // SimpleBlock
%8 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :55 :16) // Not a variable of known type: context
%9 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :55 :16) // context.EncryptedPackets (SimpleMemberAccessExpression)
%10 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :55 :48) // Not a variable of known type: existingItem
%11 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :55 :16) // context.EncryptedPackets.Remove(existingItem) (InvocationExpression)
%12 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :56 :16) // Not a variable of known type: context
%13 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :56 :16) // context.SaveChanges() (InvocationExpression)
br ^3

^2: // JumpBlock
%14 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :60 :81) // Not a variable of known type: existingItem
%15 = cbde.unknown : i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :60 :81) // existingItem.Id (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :60 :44) // $"No EncryptedPacket found with Id: {existingItem.Id}!" (InterpolatedStringExpression)
%17 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :60 :22) // new ArgumentException($"No EncryptedPacket found with Id: {existingItem.Id}!") (ObjectCreationExpression)
cbde.throw %17 :  none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :60 :16)

^3: // ExitBlock
return

}
func @_HybridCryptoApp_Server.Data.Repositories.EncryptedPacketRepository.GetById$int$(i32) -> none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :65 :8) {
^entry (%_id : i32):
%0 = cbde.alloca i32 loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :65 :39)
cbde.store %_id, %0 : memref<i32> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :65 :39)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :67 :19) // Not a variable of known type: context
%2 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :67 :19) // context.EncryptedPackets (SimpleMemberAccessExpression)
%3 = cbde.load %0 : memref<i32> loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :67 :49)
%4 = cbde.unknown : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :67 :19) // context.EncryptedPackets.Find(id) (InvocationExpression)
return %4 : none loc("C:\\Users\\Jurgen\\source\\repos\\HybridCryptoApp-Server\\HybridCryptoApp-Server.Data\\Repositories\\EncryptedPacketRepository.cs" :67 :12)

^1: // ExitBlock
cbde.unreachable

}
// Skipping function GetAllPacketsOfReceiver(i32), it contains poisonous unsupported syntaxes

// Skipping function GetAllPacketsOfReceiver(i32, none), it contains poisonous unsupported syntaxes

// Skipping function GetAllPacketsOfSender(i32), it contains poisonous unsupported syntaxes

// Skipping function GetAllPacketsOfSender(i32, none), it contains poisonous unsupported syntaxes

// Skipping function GetAllPacketsBetweenUsers(i32, i32), it contains poisonous unsupported syntaxes

