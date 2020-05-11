ºh
rC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Controllers\AuthenticationController.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Controllers! ,
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class $
AuthenticationController )
:* +
ControllerBase, :
{ 
private 
readonly 
RoleManager $
<$ %
Role% )
>) *
roleManager+ 6
;6 7
private 
readonly 
IPasswordHasher (
<( )
User) -
>- .
passwordHasher/ =
;= >
private 
readonly 
IOptions !
<! "
TokenSettings" /
>/ 0
tokenSettings1 >
;> ?
private 
readonly 
UserManager $
<$ %
User% )
>) *
userManager+ 6
;6 7
public $
AuthenticationController '
(' (
UserManager( 3
<3 4
User4 8
>8 9
userManager: E
,E F
RoleManagerG R
<R S
RoleS W
>W X
roleManagerY d
,d e
IPasswordHasher 
< 
User  
>  !
passwordHasher" 0
,0 1
IOptions 
< 
TokenSettings "
>" #
tokenSettings$ 1
)1 2
{ 	
this 
. 
roleManager 
= 
roleManager *
;* +
this 
. 
passwordHasher 
=  !
passwordHasher" 0
;0 1
this 
. 
tokenSettings 
=  
tokenSettings! .
;. /
this   
.   
userManager   
=   
userManager   *
;  * +
}!! 	
[(( 	
HttpPost((	 
((( 
$str(( 
)(( 
](( 
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
Register))) 1
())1 2
[))2 3
FromBody))3 ;
])); <
RegistrationModel))= N
model))O T
)))T U
{** 	
var++ 
user++ 
=++ 
new++ 
User++ 
{,, 
UserName-- 
=-- 
model--  
.--  !
Email--! &
,--& '
Email.. 
=.. 
model.. 
... 
Email.. #
,..# $
	FirstName// 
=// 
model// !
.//! "
	FirstName//" +
,//+ ,
LastName00 
=00 
model00  
.00  !
LastName00! )
,00) *
PublicKeyXml11 
=11 
model11 $
.11$ %
	PublicKey11% .
}22 
;22 
var44 
result44 
=44 
await44 
userManager44 *
.44* +
CreateAsync44+ 6
(446 7
user447 ;
,44; <
model44= B
.44B C
Password44C K
)44K L
;44L M
if66 
(66 
result66 
.66 
	Succeeded66  
)66  !
{77 
string88 
role88 
=88 
Role88 "
.88" #
RegularUser88# .
;88. /
await99 
EnsureRoleExists99 &
(99& '
role99' +
)99+ ,
.99, -
ConfigureAwait99- ;
(99; <
false99< A
)99A B
;99B C
await:: 
userManager:: !
.::! "
AddToRoleAsync::" 0
(::0 1
user::1 5
,::5 6
role::7 ;
)::; <
;::< =
return<< 
Ok<< 
(<< 
)<< 
;<< 
}== 
foreach?? 
(?? 
var?? 
error?? 
in?? !
result??" (
.??( )
Errors??) /
)??/ 0
{@@ 

ModelStateAA 
.AA 
AddModelErrorAA (
(AA( )
errorAA) .
.AA. /
CodeAA/ 3
,AA3 4
errorAA5 :
.AA: ;
DescriptionAA; F
)AAF G
;AAG H
}BB 
returnDD 

BadRequestDD 
(DD 

ModelStateDD (
)DD( )
;DD) *
}EE 	
[LL 	
HttpPostLL	 
(LL 
$strLL 
)LL 
]LL 
publicMM 
asyncMM 
TaskMM 
<MM 
IActionResultMM '
>MM' (
CreateTokenMM) 4
(MM4 5
[MM5 6
FromBodyMM6 >
]MM> ?

LoginModelMM@ J
modelMMK P
)MMP Q
{NN 	
varOO 
userOO 
=OO 
awaitOO 
userManagerOO (
.OO( )
FindByNameAsyncOO) 8
(OO8 9
modelOO9 >
.OO> ?
EmailOO? D
)OOD E
;OOE F
ifPP 
(PP 
userPP 
==PP 
nullPP 
)PP 
{QQ 
returnRR 
UnauthorizedRR #
(RR# $
)RR$ %
;RR% &
}SS 
ifUU 
(UU 
passwordHasherUU 
.UU  
VerifyHashedPasswordUU 3
(UU3 4
userUU4 8
,UU8 9
userUU: >
.UU> ?
PasswordHashUU? K
,UUK L
modelUUM R
.UUR S
PasswordUUS [
)UU[ \
!=UU] _&
PasswordVerificationResultVV *
.VV* +
SuccessVV+ 2
)VV2 3
{WW 
returnXX 
UnauthorizedXX #
(XX# $
)XX$ %
;XX% &
}YY 
var[[ 
token[[ 
=[[ 
await[[ 
CreateJwtToken[[ ,
([[, -
user[[- 1
)[[1 2
.[[2 3
ConfigureAwait[[3 A
([[A B
false[[B G
)[[G H
;[[H I
return\\ 
Ok\\ 
(\\ 
new\\ 
LoginResponseModel\\ ,
{]] 
Token^^ 
=^^ 
token^^ 
,^^ 
Name__ 
=__ 
user__ 
.__ 
Fullname__ $
}`` 
)`` 
;`` 
}aa 	
[hh 	
HttpPosthh	 
(hh 
$strhh 
)hh 
]hh 
[ii 	
	Authorizeii	 
(ii 
Rolesii 
=ii 
$strii &
)ii& '
]ii' (
publicjj 
asyncjj 
Taskjj 
<jj 
IActionResultjj '
>jj' (
ChangePublicKeyjj) 8
(jj8 9
[jj9 :
FromBodyjj: B
]jjB C
ChangeKeyModeljjC Q
modeljjR W
)jjW X
{kk 	
Userll 
userll 
=ll 
awaitll 
userManagerll )
.ll) *
FindByEmailAsyncll* :
(ll: ;
Userll; ?
.ll? @
	FindFirstll@ I
(llI J

ClaimTypesllJ T
.llT U
EmailllU Z
)llZ [
.ll[ \
Valuell\ a
)lla b
;llb c
usernn 
.nn 
PublicKeyXmlnn 
=nn 
modelnn  %
.nn% &
NewKeynn& ,
;nn, -
awaitoo 
userManageroo 
.oo 
UpdateAsyncoo )
(oo) *
useroo* .
)oo. /
;oo/ 0
returnqq 
Okqq 
(qq 
)qq 
;qq 
}rr 	
privateyy 
asyncyy 
Taskyy 
<yy 
stringyy !
>yy! "
CreateJwtTokenyy# 1
(yy1 2
Useryy2 6
useryy7 ;
)yy; <
{zz 	
var|| 
claims|| 
=|| 
await|| 
userManager|| *
.||* +
GetClaimsAsync||+ 9
(||9 :
user||: >
)||> ?
;||? @
claims}} 
.}} 
Add}} 
(}} 
new}} 
Claim}}  
(}}  !#
JwtRegisteredClaimNames}}! 8
.}}8 9
NameId}}9 ?
,}}? @
user}}A E
.}}E F
Id}}F H
.}}H I
ToString}}I Q
(}}Q R
)}}R S
)}}S T
)}}T U
;}}U V
claims~~ 
.~~ 
Add~~ 
(~~ 
new~~ 
Claim~~  
(~~  !#
JwtRegisteredClaimNames~~! 8
.~~8 9
Sub~~9 <
,~~< =
user~~> B
.~~B C
UserName~~C K
)~~K L
)~~L M
;~~M N
claims 
. 
Add 
( 
new 
Claim  
(  !#
JwtRegisteredClaimNames! 8
.8 9
Jti9 <
,< =
Guid> B
.B C
NewGuidC J
(J K
)K L
.L M
ToStringM U
(U V
)V W
)W X
)X Y
;Y Z
claims
ÄÄ 
.
ÄÄ 
Add
ÄÄ 
(
ÄÄ 
new
ÄÄ 
Claim
ÄÄ  
(
ÄÄ  !%
JwtRegisteredClaimNames
ÄÄ! 8
.
ÄÄ8 9
Email
ÄÄ9 >
,
ÄÄ> ?
user
ÄÄ@ D
.
ÄÄD E
Email
ÄÄE J
)
ÄÄJ K
)
ÄÄK L
;
ÄÄL M
var
ÉÉ 
	userRoles
ÉÉ 
=
ÉÉ 
await
ÉÉ !
userManager
ÉÉ" -
.
ÉÉ- .
GetRolesAsync
ÉÉ. ;
(
ÉÉ; <
user
ÉÉ< @
)
ÉÉ@ A
;
ÉÉA B
foreach
ÑÑ 
(
ÑÑ 
var
ÑÑ 
role
ÑÑ 
in
ÑÑ  
	userRoles
ÑÑ! *
)
ÑÑ* +
{
ÖÖ 
claims
ÜÜ 
.
ÜÜ 
Add
ÜÜ 
(
ÜÜ 
new
ÜÜ 
Claim
ÜÜ $
(
ÜÜ$ %

ClaimTypes
ÜÜ% /
.
ÜÜ/ 0
Role
ÜÜ0 4
,
ÜÜ4 5
role
ÜÜ6 :
)
ÜÜ: ;
)
ÜÜ; <
;
ÜÜ< =
}
áá 
var
ää 
keyBytes
ää 
=
ää 
Encoding
ää #
.
ää# $
UTF8
ää$ (
.
ää( )
GetBytes
ää) 1
(
ää1 2
tokenSettings
ää2 ?
.
ää? @
Value
ää@ E
.
ääE F
Key
ääF I
)
ääI J
;
ääJ K
var
ãã "
symmetricSecurityKey
ãã $
=
ãã% &
new
ãã' *"
SymmetricSecurityKey
ãã+ ?
(
ãã? @
keyBytes
ãã@ H
)
ããH I
;
ããI J
var
åå  
signingCredentials
åå "
=
åå# $
new
åå% ( 
SigningCredentials
åå) ;
(
åå; <"
symmetricSecurityKey
åå< P
,
ååP Q 
SecurityAlgorithms
ååR d
.
ååd e

HmacSha256
ååe o
)
ååo p
;
ååp q
var
èè 
token
èè 
=
èè 
new
èè 
JwtSecurityToken
èè ,
(
èè, -
tokenSettings
êê 
.
êê 
Value
êê #
.
êê# $
Issuer
êê$ *
,
êê* +
tokenSettings
ëë 
.
ëë 
Value
ëë #
.
ëë# $
Audience
ëë$ ,
,
ëë, -
claims
íí 
,
íí 
expires
ìì 
:
ìì 
DateTime
ìì !
.
ìì! "
UtcNow
ìì" (
.
ìì( )

AddMinutes
ìì) 3
(
ìì3 4
tokenSettings
ìì4 A
.
ììA B
Value
ììB G
.
ììG H%
ExpirationTimeInMinutes
ììH _
)
ìì_ `
,
ìì` a 
signingCredentials
îî "
:
îî" # 
signingCredentials
îî$ 6
)
îî6 7
;
îî7 8
return
ññ 
new
ññ %
JwtSecurityTokenHandler
ññ .
(
ññ. /
)
ññ/ 0
.
ññ0 1

WriteToken
ññ1 ;
(
ññ; <
token
ññ< A
)
ññA B
;
ññB C
}
óó 	
private
ôô 
async
ôô 
Task
ôô 
EnsureRoleExists
ôô +
(
ôô+ ,
string
ôô, 2
roleName
ôô3 ;
)
ôô; <
{
öö 	
if
õõ 
(
õõ 
await
õõ 
roleManager
õõ !
.
õõ! "
RoleExistsAsync
õõ" 1
(
õõ1 2
roleName
õõ2 :
)
õõ: ;
)
õõ; <
{
úú 
return
ùù 
;
ùù 
}
ûû 
await
†† 
roleManager
†† 
.
†† 
CreateAsync
†† )
(
††) *
new
††* -
Role
††. 2
{
°° 
Name
¢¢ 
=
¢¢ 
roleName
¢¢ 
,
¢¢  
NormalizedName
££ 
=
££  
roleName
££! )
.
££) *
ToUpper
££* 1
(
££1 2
)
££2 3
}
§§ 
)
§§ 
;
§§ 
}
•• 	
}
¶¶ 
}ßß êX
kC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Controllers\MessageController.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Controllers! ,
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
( 
Roles 
= 
$str "
)" #
]# $
public 

class 
MessageController "
:# $
ControllerBase% 3
{ 
private 
readonly &
IEncryptedPacketRepository 3%
encryptedPacketRepository4 M
;M N
private 
readonly 
UserManager $
<$ %
User% )
>) *
userManager+ 6
;6 7
private 
readonly 
IUserRepository (
userRepository) 7
;7 8
public 
MessageController  
(  !&
IEncryptedPacketRepository! ;%
encryptedPacketRepository< U
,U V
UserManagerW b
<b c
Userc g
>g h
userManageri t
,t u
IUserRepository	v Ö
userRepository
Ü î
)
î ï
{ 	
this 
. %
encryptedPacketRepository *
=+ ,%
encryptedPacketRepository- F
;F G
this 
. 
userManager 
= 
userManager *
;* +
this 
. 
userRepository 
=  !
userRepository" 0
;0 1
} 	
[   	
HttpPost  	 
(   
$str   
)   
]    
public!! 
async!! 
Task!! 
<!! 
IActionResult!! '
>!!' (
SendNewMessage!!) 7
(!!7 8
[!!8 9
FromBody!!9 A
]!!A B#
NewEncryptedPacketModel!!C Z

newMessage!![ e
)!!e f
{"" 	
if## 
(## 
userRepository## 
.## 
GetById## &
(##& '

newMessage##' 1
.##1 2

ReceiverId##2 <
)##< =
==##> @
null##A E
)##E F
{$$ 

ModelState%% 
.%% 
AddModelError%% (
(%%( )
$str%%) 0
,%%0 1
$str%%2 K
)%%K L
;%%L M
return&& 

BadRequest&& !
(&&! "

ModelState&&" ,
)&&, -
;&&- .
}'' 
EncryptedPacket** 
encryptedPacket** +
=**, -
new**. 1
EncryptedPacket**2 A
{++ 
DataType,, 
=,, 

newMessage,, %
.,,% &
DataType,,& .
,,,. /
EncryptedData-- 
=-- 

newMessage--  *
.--* +
EncryptedData--+ 8
,--8 9
EncryptedSessionKey.. #
=..$ %

newMessage..& 0
...0 1
EncryptedSessionKey..1 D
,..D E
Hmac// 
=// 

newMessage// !
.//! "
Hmac//" &
,//& '
Iv00 
=00 

newMessage00 
.00  
Iv00  "
,00" #

ReceiverId11 
=11 

newMessage11 '
.11' (

ReceiverId11( 2
,112 3
	Signature22 
=22 

newMessage22 &
.22& '
	Signature22' 0
,220 1
SenderId33 
=33 
(33 
await33 !
GetUserAsync33" .
(33. /
)33/ 0
.330 1
ConfigureAwait331 ?
(33? @
false33@ E
)33E F
)33F G
.33G H
Id33H J
,33J K
SendDateTime44 
=44 
DateTime44 '
.44' (
Now44( +
,44+ ,
IsMeantForReceiver55 "
=55# $

newMessage55% /
.55/ 0
MeantForReceiver550 @
}66 
;66 
try99 
{:: %
encryptedPacketRepository;; )
.;;) *
Add;;* -
(;;- .
encryptedPacket;;. =
);;= >
;;;> ?
return<< 
Ok<< 
(<< 
)<< 
;<< 
}== 
catch>> 
(>> 
ArgumentException>> $
e>>% &
)>>& '
{?? 
return@@ 

BadRequest@@ !
(@@! "
e@@" #
.@@# $
Message@@$ +
)@@+ ,
;@@, -
}AA 
}BB 	
[DD 	
HttpGetDD	 
(DD 
$strDD 
)DD 
]DD 
publicEE 
asyncEE 
TaskEE 
<EE 
IActionResultEE '
>EE' (!
GetMessagesAsReceiverEE) >
(EE> ?
)EE? @
{FF 	
returnGG 
OkGG 
(GG %
encryptedPacketRepositoryGG /
.GG/ 0#
GetAllPacketsOfReceiverGG0 G
(GGG H
(GGH I
awaitGGI N
GetUserAsyncGGO [
(GG[ \
)GG\ ]
.GG] ^
ConfigureAwaitGG^ l
(GGl m
falseGGm r
)GGr s
)GGs t
.GGt u
IdGGu w
)GGw x
.GGx y
SelectGGy 
(	GG Ä
e
GGÄ Å
=>
GGÇ Ñ
new
GGÖ à)
StrippedDownEncryptedPacket
GGâ §
(
GG§ •
e
GG• ¶
)
GG¶ ß
)
GGß ®
)
GG® ©
;
GG© ™
}HH 	
[JJ 	
HttpGetJJ	 
(JJ 
$strJJ 
)JJ 
]JJ 
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (
GetMessagesAsSenderKK) <
(KK< =
)KK= >
{LL 	
returnMM 
OkMM 
(MM %
encryptedPacketRepositoryMM /
.MM/ 0!
GetAllPacketsOfSenderMM0 E
(MME F
(MMF G
awaitMMG L
GetUserAsyncMMM Y
(MMY Z
)MMZ [
.MM[ \
ConfigureAwaitMM\ j
(MMj k
falseMMk p
)MMp q
)MMq r
.MMr s
IdMMs u
)MMu v
.MMv w
SelectMMw }
(MM} ~
eMM~ 
=>
MMÄ Ç
new
MMÉ Ü)
StrippedDownEncryptedPacket
MMá ¢
(
MM¢ £
e
MM£ §
)
MM§ •
)
MM• ¶
)
MM¶ ß
;
MMß ®
}NN 	
[PP 	
HttpPostPP	 
(PP 
$strPP #
)PP# $
]PP$ %
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ '
>QQ' (&
GetMessagesAsReceiverAfterQQ) C
(QQC D
[QQD E
FromBodyQQE M
]QQM N
MessagesAfterModelQQO a
modelQQb g
)QQg h
{RR 	
returnSS 
OkSS 
(SS %
encryptedPacketRepositorySS /
.SS/ 0#
GetAllPacketsOfReceiverSS0 G
(SSG H
(SSH I
awaitSSI N
GetUserAsyncSSO [
(SS[ \
)SS\ ]
.SS] ^
ConfigureAwaitSS^ l
(SSl m
falseSSm r
)SSr s
)SSs t
.SSt u
IdSSu w
,SSw x
modelSSy ~
.SS~ 
DateTime	SS á
)
SSá à
.
SSà â
Select
SSâ è
(
SSè ê
e
SSê ë
=>
SSí î
new
SSï ò)
StrippedDownEncryptedPacket
SSô ¥
(
SS¥ µ
e
SSµ ∂
)
SS∂ ∑
)
SS∑ ∏
)
SS∏ π
;
SSπ ∫
}TT 	
[VV 	
HttpPostVV	 
(VV 
$strVV !
)VV! "
]VV" #
publicWW 
asyncWW 
TaskWW 
<WW 
IActionResultWW '
>WW' ($
GetMessagesAsSenderAfterWW) A
(WWA B
[WWB C
FromBodyWWC K
]WWK L
MessagesAfterModelWWM _
modelWW` e
)WWe f
{XX 	
returnYY 
OkYY 
(YY %
encryptedPacketRepositoryYY /
.YY/ 0!
GetAllPacketsOfSenderYY0 E
(YYE F
(YYF G
awaitYYG L
GetUserAsyncYYM Y
(YYY Z
)YYZ [
.YY[ \
ConfigureAwaitYY\ j
(YYj k
falseYYk p
)YYp q
)YYq r
.YYr s
IdYYs u
,YYu v
modelYYw |
.YY| }
DateTime	YY} Ö
)
YYÖ Ü
.
YYÜ á
Select
YYá ç
(
YYç é
e
YYé è
=>
YYê í
new
YYì ñ)
StrippedDownEncryptedPacket
YYó ≤
(
YY≤ ≥
e
YY≥ ¥
)
YY¥ µ
)
YYµ ∂
)
YY∂ ∑
;
YY∑ ∏
}ZZ 	
[\\ 	
HttpGet\\	 
(\\ 
$str\\ !
)\\! "
]\\" #
public]] 
async]] 
Task]] 
<]] 
IActionResult]] '
>]]' ( 
GetMessagesOfContact]]) =
(]]= >
int]]> A
id]]B D
)]]D E
{^^ 	
User__ 
user__ 
=__ 
await__ 
GetUserAsync__ *
(__* +
)__+ ,
.__, -
ConfigureAwait__- ;
(__; <
false__< A
)__A B
;__B C
User`` 
contact`` 
=`` 
userRepository`` )
.``) *
GetById``* 1
(``1 2
id``2 4
)``4 5
;``5 6
ifaa 
(aa 
contactaa 
==aa 
nullaa 
)aa  
{bb 
returncc 

BadRequestcc !
(cc! "
)cc" #
;cc# $
}dd 
Listff 
<ff 
EncryptedPacketff  
>ff  !
packetsff" )
=ff* +
awaitff, 1%
encryptedPacketRepositoryff2 K
.ffK L%
GetAllPacketsBetweenUsersffL e
(ffe f
userfff j
.ffj k
Idffk m
,ffm n
contactffo v
.ffv w
Idffw y
)ffy z
.ffz {
ConfigureAwait	ff{ â
(
ffâ ä
false
ffä è
)
ffè ê
;
ffê ë
returngg 
Okgg 
(gg 
packetsgg 
.gg 
Selectgg $
(gg$ %
egg% &
=>gg' )
newgg* -'
StrippedDownEncryptedPacketgg. I
(ggI J
eggJ K
)ggK L
)ggL M
)ggM N
;ggN O
}hh 	
privatenn 
asyncnn 
Tasknn 
<nn 
Usernn 
>nn  
GetUserAsyncnn! -
(nn- .
)nn. /
{oo 	
returnpp 
awaitpp 
userManagerpp $
.pp$ %
FindByEmailAsyncpp% 5
(pp5 6
Userpp6 :
.pp: ;
	FindFirstpp; D
(ppD E

ClaimTypesppE O
.ppO P
EmailppP U
)ppU V
.ppV W
ValueppW \
)pp\ ]
;pp] ^
}qq 	
}rr 
}ss ãL
oC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Controllers\UserContactController.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Controllers! ,
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
] 
public 

class !
UserContactController &
:' (
ControllerBase) 7
{ 
private 
readonly 
UserManager $
<$ %
User% )
>) *
userManager+ 6
;6 7
private 
readonly "
IUserContactRepository /!
userContactRepository0 E
;E F
public !
UserContactController $
($ %
UserManager% 0
<0 1
User1 5
>5 6
userManager7 B
,B C"
IUserContactRepositoryD Z!
userContactRepository[ p
)p q
{ 	
this 
. 
userManager 
= 
userManager *
;* +
this 
. !
userContactRepository &
=' (!
userContactRepository) >
;> ?
} 	
[## 	
HttpPost##	 
(## 
$str## 
)## 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
IActionResult$$ '
>$$' (
AddUserContactById$$) ;
($$; <
[$$< =
FromBody$$= E
]$$E F
UserContactModel$$G W
userContactModel$$X h
)$$h i
{%% 	
User&& 
user&& 
=&& 
await&& 
GetUserAsync&& *
(&&* +
)&&+ ,
.&&, -
ConfigureAwait&&- ;
(&&; <
false&&< A
)&&A B
;&&B C
if(( 
((( 
await(( 
userManager(( !
.((! "
FindByIdAsync((" /
(((/ 0
userContactModel((0 @
.((@ A
	ContactId((A J
.((J K
ToString((K S
(((S T
)((T U
)((U V
==((W Y
null((Z ^
)((^ _
{)) 
return** 

BadRequest** !
(**! "
$str**" C
)**C D
;**D E
}++ 
try-- 
{.. !
userContactRepository// %
.//% &
Add//& )
(//) *
new//* -
UserContact//. 9
{00 
OwnerId11 
=11 
user11 "
.11" #
Id11# %
,11% &
	ContactId22 
=22 
userContactModel22  0
.220 1
	ContactId221 :
}33 
)33 
;33 
return55 
Ok55 
(55 
)55 
;55 
}66 
catch77 
(77 
ArgumentException77 $
e77% &
)77& '
{88 
return99 

BadRequest99 !
(99! "
e99" #
.99# $
Message99$ +
)99+ ,
;99, -
}:: 
};; 	
[BB 	
HttpPostBB	 
(BB 
$strBB 
)BB 
]BB  
publicCC 
asyncCC 
TaskCC 
<CC 
IActionResultCC '
>CC' (!
AddUserContactByEmailCC) >
(CC> ?
[CC? @
FromBodyCC@ H
]CCH I
UserContactModelCCJ Z
userContactModelCC[ k
)CCk l
{DD 	
UserEE 
userEE 
=EE 
awaitEE 
GetUserAsyncEE *
(EE* +
)EE+ ,
.EE, -
ConfigureAwaitEE- ;
(EE; <
falseEE< A
)EEA B
;EEB C
UserHH 
contactHH 
=HH 
awaitHH  
userManagerHH! ,
.HH, -
FindByEmailAsyncHH- =
(HH= >
userContactModelHH> N
.HHN O
ContactEmailHHO [
)HH[ \
;HH\ ]
ifII 
(II 
contactII 
==II 
nullII 
)II  
{JJ 
returnKK 

BadRequestKK !
(KK! "
$strKK" F
)KKF G
;KKG H
}LL 
tryNN 
{OO !
userContactRepositoryPP %
.PP% &
AddPP& )
(PP) *
newPP* -
UserContactPP. 9
{QQ 
OwnerIdRR 
=RR 
userRR "
.RR" #
IdRR# %
,RR% &
	ContactIdSS 
=SS 
contactSS  '
.SS' (
IdSS( *
}TT 
)TT 
;TT 
returnVV 
OkVV 
(VV 
)VV 
;VV 
}WW 
catchXX 
(XX 
ArgumentExceptionXX $
eXX% &
)XX& '
{YY 
returnZZ 

BadRequestZZ !
(ZZ! "
eZZ" #
.ZZ# $
MessageZZ$ +
)ZZ+ ,
;ZZ, -
}[[ 
}\\ 	
[cc 	
HttpPostcc	 
(cc 
$strcc 
)cc 
]cc 
publicdd 
asyncdd 
Taskdd 
<dd 
IActionResultdd '
>dd' (
RemoveUserContactdd) :
(dd: ;
[dd; <
FromBodydd< D
]ddD E
UserContactModelddF V
userContactModelddW g
)ddg h
{ee 	
Userff 
userff 
=ff 
awaitff 
GetUserAsyncff *
(ff* +
)ff+ ,
.ff, -
ConfigureAwaitff- ;
(ff; <
falseff< A
)ffA B
;ffB C
tryhh 
{ii !
userContactRepositoryjj %
.jj% &
Deletejj& ,
(jj, -
newjj- 0
UserContactjj1 <
{kk 
OwnerIdll 
=ll 
userll "
.ll" #
Idll# %
,ll% &
	ContactIdmm 
=mm 
userContactModelmm  0
.mm0 1
	ContactIdmm1 :
}nn 
)nn 
;nn 
returnpp 
Okpp 
(pp 
)pp 
;pp 
}qq 
catchrr 
(rr 
ArgumentExceptionrr $
err% &
)rr& '
{ss 
returntt 

BadRequesttt !
(tt! "
ett" #
.tt# $
Messagett$ +
)tt+ ,
;tt, -
}uu 
}vv 	
[|| 	
HttpGet||	 
(|| 
$str|| 
)|| 
]|| 
public}} 
async}} 
Task}} 
<}} 
IActionResult}} '
>}}' (
GetAll}}) /
(}}/ 0
)}}0 1
{~~ 	
List 
< 
int 
> 
ids 
= !
userContactRepository 1
.1 2!
GetUserContactsOfUser2 G
(G H
(H I
awaitI N
GetUserAsyncO [
([ \
)\ ]
.] ^
ConfigureAwait^ l
(l m
falsem r
)r s
)s t
.t u
Idu w
)w x
.x y
Selecty 
(	 Ä
u
Ä Å
=>
Ç Ñ
u
Ö Ü
.
Ü á
	ContactId
á ê
)
ê ë
.
ë í
ToList
í ò
(
ò ô
)
ô ö
;
ö õ
List
ÄÄ 
<
ÄÄ %
ContactInformationModel
ÄÄ (
>
ÄÄ( )
models
ÄÄ* 0
=
ÄÄ1 2
new
ÄÄ3 6
List
ÄÄ7 ;
<
ÄÄ; <%
ContactInformationModel
ÄÄ< S
>
ÄÄS T
(
ÄÄT U
)
ÄÄU V
;
ÄÄV W
foreach
ÇÇ 
(
ÇÇ 
int
ÇÇ 
id
ÇÇ 
in
ÇÇ 
ids
ÇÇ "
)
ÇÇ" #
{
ÉÉ 
User
ÑÑ 
other
ÑÑ 
=
ÑÑ 
await
ÑÑ "
userManager
ÑÑ# .
.
ÑÑ. /
FindByIdAsync
ÑÑ/ <
(
ÑÑ< =
id
ÑÑ= ?
.
ÑÑ? @
ToString
ÑÑ@ H
(
ÑÑH I
)
ÑÑI J
)
ÑÑJ K
;
ÑÑK L
models
ÜÜ 
.
ÜÜ 
Add
ÜÜ 
(
ÜÜ 
new
ÜÜ %
ContactInformationModel
ÜÜ 6
{
áá 
Id
àà 
=
àà 
id
àà 
,
àà 
	FirstName
ââ 
=
ââ 
other
ââ  %
.
ââ% &
	FirstName
ââ& /
,
ââ/ 0
LastName
ää 
=
ää 
other
ää $
.
ää$ %
LastName
ää% -
,
ää- .
	PublicKey
ãã 
=
ãã 
other
ãã 
.
ãã 
PublicKeyXml
ãã #
}
åå 
)
åå 
;
åå 
}
çç 
return
èè 
Ok
èè 
(
èè 
models
èè 
)
èè 
;
èè 
}
êê 	
private
ññ 
async
ññ 
Task
ññ 
<
ññ 
User
ññ 
>
ññ  
GetUserAsync
ññ! -
(
ññ- .
)
ññ. /
{
óó 	
return
òò 
await
òò 
userManager
òò $
.
òò$ %
FindByEmailAsync
òò% 5
(
òò5 6
User
òò6 :
.
òò: ;
	FindFirst
òò; D
(
òòD E

ClaimTypes
òòE O
.
òòO P
Email
òòP U
)
òòU V
.
òòV W
Value
òòW \
)
òò\ ]
;
òò] ^
}
ôô 	
}
öö 
}õõ È
cC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\ChangeKeyModel.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class 
ChangeKeyModel 
{ 
[ 	
Required	 
( 
AllowEmptyStrings #
=$ %
false& +
)+ ,
], -
public 
string 
NewKey 
{ 
get "
;" #
set$ '
;' (
}) *
}		 
}

 ∑
lC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\ContactInformationModel.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class #
ContactInformationModel (
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string	 
	PublicKey 
{ 
get 
;  
set! $
;$ %
}& '
}		 
}

 Ó
_C:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\LoginModel.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class 

LoginModel 
{ 
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
[ 	
Required	 
] 
[ 	
	MinLength	 
( 
$num 
) 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ı
gC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\LoginResponseModel.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class 
LoginResponseModel #
{ 
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ‚
gC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\MessagesAfterModel.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class 
MessagesAfterModel #
{ 
public 
DateTime 
DateTime  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
}		 ‰
lC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\NewEncryptedPacketModel.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class #
NewEncryptedPacketModel (
{ 
[ 	
Required	 
] 
public 
int 

ReceiverId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
DataType 
DataType  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
Required	 
] 
public 
byte 
[ 
] 
EncryptedSessionKey )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
[ 	
Required	 
] 
public 
byte 
[ 
] 
Iv 
{ 
get 
; 
set  #
;# $
}% &
[## 	
Required##	 
]## 
public$$ 
byte$$ 
[$$ 
]$$ 
Hmac$$ 
{$$ 
get$$  
;$$  !
set$$" %
;$$% &
}$$' (
[)) 	
Required))	 
])) 
public** 
byte** 
[** 
]** 
	Signature** 
{**  !
get**" %
;**% &
set**' *
;*** +
}**, -
[// 	
Required//	 
]// 
public00 
byte00 
[00 
]00 
EncryptedData00 #
{00$ %
get00& )
;00) *
set00+ .
;00. /
}000 1
public55 
bool55 
MeantForReceiver55 $
{55% &
get55' *
;55* +
set55, /
;55/ 0
}551 2
=553 4
true555 9
;559 :
}66 
}77 ã
fC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\RegistrationModel.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class 
RegistrationModel "
{ 
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
public		 
string		 
Email		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
[ 	
Required	 
] 
[ 	
	MinLength	 
( 
$num 
) 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
( 
AllowEmptyStrings #
=$ %
false& +
)+ ,
], -
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
Required	 
( 
AllowEmptyStrings #
=$ %
false& +
)+ ,
], -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
( 
AllowEmptyStrings #
=$ %
false& +
)+ ,
], -
public 
string 
	PublicKey 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ˙
pC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\StrippedDownEncryptedPacket.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class '
StrippedDownEncryptedPacket ,
{ 
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
public 
StrippedDownUser 
Sender  &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
StrippedDownUser 
Receiver  (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DateTime 
SendDateTime $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DataType 
DataType  
{! "
get# &
;& '
set( +
;+ ,
}- .
public$$ 
byte$$ 
[$$ 
]$$ 
EncryptedSessionKey$$ )
{$$* +
get$$, /
;$$/ 0
set$$1 4
;$$4 5
}$$6 7
public)) 
byte)) 
[)) 
])) 
Iv)) 
{)) 
get)) 
;)) 
set))  #
;))# $
}))% &
public.. 
byte.. 
[.. 
].. 
Hmac.. 
{.. 
get..  
;..  !
set.." %
;..% &
}..' (
public33 
byte33 
[33 
]33 
	Signature33 
{33  !
get33" %
;33% &
set33' *
;33* +
}33, -
public88 
byte88 
[88 
]88 
EncryptedData88 #
{88$ %
get88& )
;88) *
set88+ .
;88. /
}880 1
public:: '
StrippedDownEncryptedPacket:: *
(::* +
)::+ ,
{;; 	
}<< 	
public>> '
StrippedDownEncryptedPacket>> *
(>>* +
EncryptedPacket>>+ :
encryptedPacket>>; J
)>>J K
{?? 	
Id@@ 
=@@ 
encryptedPacket@@  
.@@  !
Id@@! #
;@@# $
ReceiverBB 
=BB 
newBB 
StrippedDownUserBB +
(BB+ ,
encryptedPacketBB, ;
.BB; <
ReceiverBB< D
)BBD E
;BBE F
SenderCC 
=CC 
newCC 
StrippedDownUserCC )
(CC) *
encryptedPacketCC* 9
.CC9 :
SenderCC: @
)CC@ A
;CCA B
SendDateTimeDD 
=DD 
encryptedPacketDD *
.DD* +
SendDateTimeDD+ 7
;DD7 8
DataTypeFF 
=FF 
encryptedPacketFF &
.FF& '
DataTypeFF' /
;FF/ 0
EncryptedSessionKeyGG 
=GG  !
encryptedPacketGG" 1
.GG1 2
EncryptedSessionKeyGG2 E
;GGE F
IvHH 
=HH 
encryptedPacketHH  
.HH  !
IvHH! #
;HH# $
EncryptedDataII 
=II 
encryptedPacketII +
.II+ ,
EncryptedDataII, 9
;II9 :
HmacJJ 
=JJ 
encryptedPacketJJ "
.JJ" #
HmacJJ# '
;JJ' (
	SignatureKK 
=KK 
encryptedPacketKK '
.KK' (
	SignatureKK( 1
;KK1 2
}LL 	
}MM 
}NN –
eC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\StrippedDownUser.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class 
StrippedDownUser !
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string		 
LastName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
	PublicKey

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
StrippedDownUser 
(  
)  !
{ 	
} 	
public 
StrippedDownUser 
(  
User  $
user% )
)) *
{ 	
Id 
= 
user 
. 
Id 
; 
	FirstName 
= 
user 
. 
	FirstName &
;& '
LastName 
= 
user 
. 
LastName $
;$ %
	PublicKey 
= 
user 
. 
PublicKeyXml )
;) *
} 	
} 
} Ø
bC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\TokenSettings.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class 
TokenSettings 
{ 
public 
string 
Audience 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int #
ExpirationTimeInMinutes *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
Issuer 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Key 
{ 
get 
;  
set! $
;$ %
}& '
}		 
}

 ≤
eC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Models\UserContactModel.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Models! '
{ 
public 

class 
UserContactModel !
{ 
public 
int 
	ContactId 
{ 
get "
;" #
set$ '
;' (
}) *
[		 	
EmailAddress			 
]		 
public

 
string

 
ContactEmail

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
} 
} π

UC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Program.cs
	namespace 	"
HybridCryptoApp_Server
  
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} §!
kC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Services\ScryptPasswordHasher.cs
	namespace 	"
HybridCryptoApp_Server
  
.  !
Services! )
{ 
public 

class  
SCryptPasswordHasher %
<% &
TUser& +
>+ ,
:- .
IPasswordHasher/ >
<> ?
TUser? D
>D E
whereF K
TUserL Q
:R S
classT Y
{ 
private		 
readonly		 
int		 
	blockSize		 &
;		& '
private

 
readonly

 
int

 
iterationCount

 +
;

+ ,
private 
readonly 
int 
threadCount (
;( )
public  
SCryptPasswordHasher #
(# $
int$ '
	blockSize( 1
,1 2
int3 6
iterationCount7 E
,E F
intG J
threadCountK V
)V W
{ 	
this 
. 
	blockSize 
= 
	blockSize &
;& '
this 
. 
iterationCount 
=  !
iterationCount" 0
;0 1
this 
. 
threadCount 
= 
threadCount *
;* +
} 	
public 
string 
HashPassword "
(" #
TUser# (
user) -
,- .
string/ 5
password6 >
)> ?
{ 	
if 
( 
string 
. 
IsNullOrEmpty $
($ %
password% -
)- .
). /
{ 
throw 
new 
ArgumentException +
(+ ,
nameof, 2
(2 3
password3 ;
); <
)< =
;= >
} 
ScryptEncoder 
scryptEncoder '
=( )
new* -
ScryptEncoder. ;
(; <
iterationCount< J
,J K
	blockSizeL U
,U V
threadCountW b
)b c
;c d
return 
scryptEncoder  
.  !
Encode! '
(' (
password( 0
)0 1
;1 2
}   	
public## &
PasswordVerificationResult## ) 
VerifyHashedPassword##* >
(##> ?
TUser##? D
user##E I
,##I J
string##K Q
hashedPassword##R `
,##` a
string##b h
providedPassword##i y
)##y z
{$$ 	
if&& 
(&& 
string&& 
.&& 
IsNullOrEmpty&& $
(&&$ %
hashedPassword&&% 3
)&&3 4
)&&4 5
{'' 
throw(( 
new(( 
ArgumentException(( +
(((+ ,
nameof((, 2
(((2 3
hashedPassword((3 A
)((A B
)((B C
;((C D
})) 
if++ 
(++ 
string++ 
.++ 
IsNullOrEmpty++ $
(++$ %
providedPassword++% 5
)++5 6
)++6 7
{,, 
throw-- 
new-- 
ArgumentException-- +
(--+ ,
nameof--, 2
(--2 3
providedPassword--3 C
)--C D
)--D E
;--E F
}.. 
ScryptEncoder11 
encoder11 !
=11" #
new11$ '
ScryptEncoder11( 5
(115 6
)116 7
;117 8
bool22 
isValid22 
=22 
encoder22 "
.22" #
Compare22# *
(22* +
providedPassword22+ ;
,22; <
hashedPassword22= K
)22K L
;22L M
if55 
(55 
isValid55 
)55 
{66 
return77 &
PasswordVerificationResult77 1
.771 2
Success772 9
;779 :
}88 
return:: &
PasswordVerificationResult:: -
.::- .
Failed::. 4
;::4 5
};; 	
}<< 
}== ¿D
UC:\Users\Jurgen\source\repos\HybridCryptoApp-Server\HybridCryptoApp-Server\Startup.cs
	namespace 	"
HybridCryptoApp_Server
  
{ 
public 

class 
Startup 
{ 
private 
const 
int 
SCryptBlockSize )
=* +
$num, -
;- .
private 
const 
int  
SCryptIterationCount .
=/ 0
$num1 5
;5 6
private 
const 
int 
SCryptThreadCount +
=, -
$num. /
;/ 0
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public   
IConfiguration   
Configuration   +
{  , -
get  . 1
;  1 2
}  3 4
public## 
void## 
ConfigureServices## %
(##% &
IServiceCollection##& 8
services##9 A
)##A B
{$$ 	
services(( 
.(( 
AddControllers(( #
(((# $
)(($ %
;((% &
services** 
.** 
AddDbContext** !
<**! ""
HybridCryptoAppContext**" 8
>**8 9
(**9 :
options**: A
=>**B D
{++ 
if,, 
(,, 
Configuration,, !
.,,! "
GetValue,," *
<,,* +
bool,,+ /
>,,/ 0
(,,0 1
$str,,1 G
,,,G H
false,,I N
),,N O
),,O P
{-- 
options.. 
... 
UseInMemoryDatabase.. /
(../ 0
Guid..0 4
...4 5
NewGuid..5 <
(..< =
)..= >
...> ?
ToString..? G
(..G H
)..H I
)..I J
;..J K
}// 
else00 
{11 
options22 
.22 
UseMySql22 $
(22$ %
Configuration22% 2
.222 3
GetValue223 ;
<22; <
string22< B
>22B C
(22C D
$str22D _
)22_ `
)22` a
;22a b
}33 
}44 
,44 
ServiceLifetime44 
.44 
	Singleton44 (
)44( )
;44) *
services66 
.66 
AddIdentity66  
<66  !
User66! %
,66% &
Role66' +
>66+ ,
(66, -
options66- 4
=>665 7
{77 
options88 
.88 
Lockout88 #
.88# $"
DefaultLockoutTimeSpan88$ :
=88; <
TimeSpan88= E
.88E F
FromMinutes88F Q
(88Q R
$num88R T
)88T U
;88U V
options99 
.99 
Lockout99 #
.99# $#
MaxFailedAccessAttempts99$ ;
=99< =
$num99> ?
;99? @
options:: 
.:: 
Lockout:: #
.::# $
AllowedForNewUsers::$ 6
=::7 8
true::9 =
;::= >
options<< 
.<< 
Password<< $
.<<$ %"
RequireNonAlphanumeric<<% ;
=<<< =
true<<> B
;<<B C
options== 
.== 
Password== $
.==$ %
RequiredLength==% 3
===4 5
$num==6 7
;==7 8
options?? 
.?? 
SignIn?? "
.??" #!
RequireConfirmedEmail??# 8
=??9 :
false??; @
;??@ A
options@@ 
.@@ 
SignIn@@ "
.@@" #'
RequireConfirmedPhoneNumber@@# >
=@@? @
false@@A F
;@@F G
}AA 
)AA 
.BB $
AddEntityFrameworkStoresBB )
<BB) *"
HybridCryptoAppContextBB* @
>BB@ A
(BBA B
)BBB C
.CC $
AddDefaultTokenProvidersCC )
(CC) *
)CC* +
;CC+ ,
servicesFF 
.FF 
	ConfigureFF 
<FF 
TokenSettingsFF ,
>FF, -
(FF- .
ConfigurationFF. ;
.FF; <

GetSectionFF< F
(FFF G
$strFFG N
)FFN O
)FFO P
;FFP Q
servicesHH 
.HH 
AddAuthenticationHH &
(HH& '
optionsHH' .
=>HH/ 1
{II 
optionsJJ 
.JJ %
DefaultAuthenticateSchemeJJ 5
=JJ6 7
JwtBearerDefaultsJJ8 I
.JJI J 
AuthenticationSchemeJJJ ^
;JJ^ _
}KK 
)KK 
.LL 
AddJwtBearerLL 
(LL 
optionsLL %
=>LL& (
{MM 
varNN 
tokenSettingsNN %
=NN& '
newNN( +
TokenSettingsNN, 9
(NN9 :
)NN: ;
;NN; <
ConfigurationOO !
.OO! "
BindOO" &
(OO& '
$strOO' .
,OO. /
tokenSettingsOO0 =
)OO= >
;OO> ?
optionsPP 
.PP %
TokenValidationParametersPP 5
=PP6 7
newPP8 ;%
TokenValidationParametersPP< U
{QQ 
ValidIssuerRR #
=RR$ %
tokenSettingsRR& 3
.RR3 4
IssuerRR4 :
,RR: ;
ValidAudienceSS %
=SS& '
tokenSettingsSS( 5
.SS5 6
AudienceSS6 >
,SS> ?
IssuerSigningKeyTT (
=TT) *
newTT+ . 
SymmetricSecurityKeyTT/ C
(TTC D
EncodingTTD L
.TTL M
UTF8TTM Q
.TTQ R
GetBytesTTR Z
(TTZ [
tokenSettingsTT[ h
.TTh i
KeyTTi l
)TTl m
)TTm n
}UU 
;UU 
}VV 
)VV 
;VV 
servicesXX 
.XX 
AddSingletonXX !
<XX! "
IPasswordHasherXX" 1
<XX1 2
UserXX2 6
>XX6 7
,XX7 8 
SCryptPasswordHasherXX9 M
<XXM N
UserXXN R
>XXR S
>XXS T
(XXT U
sXXU V
=>XXW Y
newXXZ ] 
SCryptPasswordHasherXX^ r
<XXr s
UserXXs w
>XXw x
(XXx y
SCryptBlockSize	XXy à
,
XXà â"
SCryptIterationCount
XXä û
,
XXû ü
SCryptThreadCount
XX† ±
)
XX± ≤
)
XX≤ ≥
;
XX≥ ¥
services[[ 
.[[ 
	AddScoped[[ 
<[[ &
IEncryptedPacketRepository[[ 9
,[[9 :%
EncryptedPacketRepository[[; T
>[[T U
([[U V
)[[V W
;[[W X
services\\ 
.\\ 
	AddScoped\\ 
<\\ "
IUserContactRepository\\ 5
,\\5 6!
UserContactRepository\\7 L
>\\L M
(\\M N
)\\N O
;\\O P
services]] 
.]] 
	AddScoped]] 
<]] 
IUserRepository]] .
,]]. /
UserRepository]]0 >
>]]> ?
(]]? @
)]]@ A
;]]A B
}^^ 	
publicaa 
voidaa 
	Configureaa 
(aa 
IApplicationBuilderaa 1
appaa2 5
,aa5 6
IWebHostEnvironmentaa7 J
envaaK N
)aaN O
{bb 	
ifcc 
(cc 
envcc 
.cc 
IsDevelopmentcc !
(cc! "
)cc" #
)cc# $
{dd 
appee 
.ee %
UseDeveloperExceptionPageee -
(ee- .
)ee. /
;ee/ 0
}ff 
ifhh 
(hh 
Configurationhh 
.hh 
GetValuehh &
<hh& '
boolhh' +
>hh+ ,
(hh, -
$strhh- 7
,hh7 8
falsehh9 >
)hh> ?
)hh? @
{ii 
appjj 
.jj 
UseHttpsRedirectionjj '
(jj' (
)jj( )
;jj) *
}kk 
appmm 
.mm 

UseRoutingmm 
(mm 
)mm 
;mm 
appoo 
.oo 
UseAuthenticationoo !
(oo! "
)oo" #
;oo# $
apppp 
.pp 
UseAuthorizationpp  
(pp  !
)pp! "
;pp" #
apprr 
.rr 
UseEndpointsrr 
(rr 
	endpointsrr &
=>rr' )
{ss 
	endpointstt 
.tt 
MapControllerstt (
(tt( )
)tt) *
;tt* +
}uu 
)uu 
;uu 
}vv 	
}ww 
}xx 