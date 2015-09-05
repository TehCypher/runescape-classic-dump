unit Unit1;

 {$R+} 

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdComponent, IdTCPServer, IdTCPConnection, IdTCPClient,
  StdCtrls, Menus, CheckLst, RSCommands, ExtCtrls, ShellAPI, IdThreadMgr,
  IdThreadMgrDefault, Buttons, IdHTTP, SynEdit, SynMemo, RzCmboBx, AppEvnts,
  Mask, RzEdit, TB2Item, TB2Dock, TB2Toolbar, Registry, SyncObjs,
  SynCompletionProposal, IdMappedPortTCP, acpuid, RSPing, GR32_Image, DIB,
  IdIntercept, IdLogBase, IdLogFile, MMSystem, ImgList, RzTray;


type
  TIdMappedPortTCPData = class
  public
    OutboundClient: TIdTCPClient;
    ReadList: TList;
    //
    constructor Create;
    destructor Destroy; override;
  end;

  TIntegerArray = array of Integer;



type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    Add1: TMenuItem;
    Remove1: TMenuItem;
    PopupMenu2: TPopupMenu;
    ShowAsHex1: TMenuItem;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    SaveDialog1: TSaveDialog;
    HTTP: TIdHTTP;
    Timer2: TTimer;
    Panel2: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    Notebook1: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    chkShowData: TCheckBox;
    chkClientSend: TCheckBox;
    btnOpen: TButton;
    SpeedButton2: TSpeedButton;
    TBToolbar1: TTBToolbar;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBSubmenuItem3: TTBSubmenuItem;
    TBSubmenuItem4: TTBSubmenuItem;
    TBItem1: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem9: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem10: TTBItem;
    miDebugInfo: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    StateButton: TSpeedButton;
    txtListenPort: TRzEdit;
    txtRedirHost: TRzEdit;
    txtRedirPort: TRzEdit;
    txtScript: TRzMemo;
    Panel5: TPanel;
    lstFilter: TCheckListBox;
    cmbOutIn: TRzComboBox;
    txtMyPos: TRzEdit;
    txtData: TRzMemo;
    txtStartLine: TRzEdit;
    txtSendData: TRzEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    TBItem11: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItem15: TTBItem;
    btnSendKeys: TSpeedButton;
    TBItem16: TTBItem;
    Panel6: TPanel;
    Panel3: TPanel;
    txtUserScript: TSynMemo;
    Panel4: TPanel;
    txtDebug: TMemo;
    Splitter1: TSplitter;
    SpeedButton11: TSpeedButton;
    TBSubmenuItem5: TTBSubmenuItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem20: TTBItem;
    SynAutoComplete: TSynCompletionProposal;
    TCPMap: TIdMappedPortTCP;
    TBItem21: TTBItem;
    TBSeparatorItem8: TTBSeparatorItem;
    FindDialog1: TFindDialog;
    TBSeparatorItem9: TTBSeparatorItem;
    TBItem22: TTBItem;
    acpuid1: Tacpuid;
    Timer3: TTimer;
    ShowAsText1: TMenuItem;
    TBItem26: TTBItem;
    Timer4: TTimer;
    TBItem24: TTBItem;
    TBItem27: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBItem28: TTBItem;
    TBSeparatorItem11: TTBSeparatorItem;
    btnItems: TSpeedButton;
    btnHats: TSpeedButton;
    TBItem29: TTBItem;
    SpeedButton5: TSpeedButton;
    Timer5: TTimer;
    CheckBox1: TCheckBox;
    Image321: TImage32;
    SpeedButton6: TSpeedButton;
    Panel7: TPanel;
    Image2: TImage;
    TBItemWildy: TTBItem;
    ServerHosts: TListBox;
    ServerPorts: TListBox;
    TBItem30: TTBItem;
    Timer6: TTimer;
    Panel8: TPanel;
    btnLaunchRS: TSpeedButton;
    Panel9: TPanel;
    btnRun: TSpeedButton;
    btnPause: TSpeedButton;
    btnStop: TSpeedButton;
    btnClear: TSpeedButton;
    Label6: TLabel;
    txtMyCoords: TRzEdit;
    TBSubmenuItem6: TTBSubmenuItem;
    TBItem31: TTBItem;
    TBSeparatorItem13: TTBSeparatorItem;
    TBSubmenuItem7: TTBSubmenuItem;
    TBItem32: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    TBItem35: TTBItem;
    TBSeparatorItem14: TTBSeparatorItem;
    TBItem36: TTBItem;
    TBSeparatorItem15: TTBSeparatorItem;
    TBItem37: TTBItem;
    TBControlItem1: TTBControlItem;
    Image3: TImage;
    TBSeparatorItem16: TTBSeparatorItem;
    TBItem38: TTBItem;
    IdConnectionIntercept: TIdConnectionIntercept;
    Label8: TLabel;
    txtColor: TEdit;
    Label5: TLabel;
    txtMousePos: TEdit;
    SpeedButton9: TSpeedButton;
    TBSubmenuItem8: TTBSubmenuItem;
    TBSubmenuItem9: TTBSubmenuItem;
    RzTrayIcon: TRzTrayIcon;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure txtListenPortChange(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure FilterTheCommand(var S: String; Outgoing: Boolean; Thread: TIdPeerThread);
    function CanDisplayCommand(S: String; Outgoing: Boolean):Boolean;
    procedure ShowAsHex1Click(Sender: TObject);
    function ProcessScriptLine(S: String; var ImmediateLines: Integer; var DontEncrypt: Boolean):String;
    procedure Timer1Timer(Sender: TObject);
    procedure ExecuteScript(var CP: Integer);
    procedure btnRunClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure ResetScriptStats;
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure txtDebugKeyPress(Sender: TObject; var Key: Char);
    procedure Exit1Click(Sender: TObject);
    procedure RunfromLine1Click(Sender: TObject);
    procedure DebugInfo1Click(Sender: TObject);
    procedure btnLaunchRSClick(Sender: TObject);
    procedure LogOut1Click(Sender: TObject);
    procedure txtMyPosChange(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure SaveScript1Click(Sender: TObject);
    procedure LogIn1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure txtUserScriptSpecialLineColors(Sender: TObject; Line: Integer;
      var Special: Boolean; var FG, BG: TColor);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DargMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StateButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TBItem11Click(Sender: TObject);
    procedure TBItem14Click(Sender: TObject);
    procedure TBItem15Click(Sender: TObject);
    procedure btnSendKeysClick(Sender: TObject);
    procedure TBItem16Click(Sender: TObject);
    procedure txtDebugChange(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure TBItem17Click(Sender: TObject);
    procedure TBItem20Click(Sender: TObject);
    procedure txtUserScriptKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SynAutoCompleteExecute(Kind: SynCompletionType;
      Sender: TObject; var AString: String; var x, y: Integer;
      var CanExecute: Boolean);
    procedure SynAutoCompleteCancelled(Sender: TObject);
    procedure txtUserScriptChange(Sender: TObject);
    procedure TCPMapConnect(AThread: TIdMappedPortThread);
    procedure TCPMapBeforeConnect(AThread: TIdMappedPortThread);
    procedure TCPMapOnEveryCycle(AThread: TIdMappedPortThread);
    procedure TCPMapExecute(AThread: TIdMappedPortThread);
    procedure TCPMapOutboundData(AThread: TIdMappedPortThread);
    procedure TCPMapDisconnect(AThread: TIdMappedPortThread);
    procedure TCPMapOutboundDisconnect(AThread: TIdMappedPortThread);
    procedure TCPMapException(AThread: TIdPeerThread;
      AException: Exception);
    procedure TBItem21Click(Sender: TObject);
    procedure TBItem22Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure TCPMapListenException(AThread: TIdListenerThread;
      AException: Exception);
    procedure TCPMapOutboundConnect(AThread: TIdMappedPortThread;
      AException: Exception);
    procedure Map2Connect(AThread: TIdMappedPortThread);
    procedure Map2Execute(AThread: TIdMappedPortThread);
    procedure ShowAsText1Click(Sender: TObject);
    procedure TBItem26Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure SendFEClickingToLastClient;
    procedure Label5DblClick(Sender: TObject);
    procedure TBItem28Click(Sender: TObject);
    procedure btnItemsClick(Sender: TObject);
    procedure btnHatsClick(Sender: TObject);
    procedure TBItem29Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure TBItem31Click(Sender: TObject);
    procedure TBItem32Click(Sender: TObject);
    procedure TBItem33Click(Sender: TObject);
    procedure TBItem34Click(Sender: TObject);
    procedure Image3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    CS: TCriticalSection;
    PingThread: TPingThread;
  public
    { Public declarations }
//    procedure ProcessAllData;
//    procedure AppearsItem;
    procedure ProcessNextEvent;
    procedure SaveCPUStats;
    procedure RestoreCPUStats;
//    procedure AddNewEvent(num, param1, param2, param3, param4, param5: Integer);
    procedure CreatePingThread(User, Pass, Vers, CPU: String);
//    function CommandLength(AllCommand: string): Integer;
    procedure SaveBigMap;
    procedure WMHotKey(var Msg : TWMHotKey); message WM_HOTKEY;
    procedure MyInterceptReceive(ASender: TIdConnectionIntercept; AStream: TStream);
    procedure MyInterceptSend(ASender: TIdConnectionIntercept; AStream: TStream);
  end;

type Coordinates = Record
                     X, Y: Integer;
                   End;
     ItemRecord = Record
                     Coord: Coordinates;
                     Item: Integer;
                   End;
     ObjRecord =   Record
                     Coord: Coordinates;
                     Obj: Integer;
                   End;

type StringArrayC = array[1..295]of String;

const LongString: string = 'All RuneScape code and data. including this message, are copyright 2003 Jagex Ltd. Unauthorised reproduction in any form is strictly prohibited.  The RuneScape network-pro'+
                           'tocol is copyright 2003 Jagex Ltd and is protected by international copyright laws. The RuneScape network-protocol also incorporates a copy protection mechanism to prevent'+
                           ' unauthorised access or use of our servers. Attempting to break, bypass or duplicate this mechanism is an infringement of the Digital Millienium Copyright Act and may lead'+
                           ' to prosecution. Decompiling, or reverse-engineering the RuneScape code in any way is strictly prohibited. RuneScape and Jagex are registered trademarks of Jagex Ltd. You '+
                           'should not be reading this message, you have been warned...';
const MyString: string = 'Reverse engeneering this software is prohibited. If you are reading '+
                         'this, you have been performing illegal actions and could be sued. '+
                         'AutoRune is private test software and should not be available '+
                         'anywhere free or commercial. Since you do have it, it''s most probably'+
                         'stolen from a private computer and stealing leads to prosecution. '+
                         'Thank you!';


      XShift = -48;
      YShift = 0;

type array256 = array[0..255]of Integer;
const WeirdArrayClient: array256 = (
      419, 426, 714, 445, 530, 473, 434, 962, 438, 613, 
        861, 27, 601, 281, 430, 982, 601, 678, 157, 540, 
        586, 526, 237, 946, 147, 477, 200, 88, 600, 68, 
        596, 794, 32, 3, 4, 5, 6, 7, 8, 9, 
        40, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        50, 984, 52, 3, 4, 5, 6, 7, 8, 9, 
        60, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        70, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        80, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        90, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        100, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        110, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        120, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        130, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        140, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        150, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        160, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        170, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        180, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
        655, 526, 545, 816, 947, 121, 584, 375, 976, 83, 
        194, 312, 779, 811, 318, 117, 475, 108, 634, 622, 
        446, 192, 91, 502, 925, 319, 288, 882, 790, 413, 
        544, 688, 502, 13, 461, 619, 373, 475, 55, 692, 
        794, 729, 165, 755, 613, 454, 163, 951, 841, 954, 
        128, 936, 106, 870, 555, 852, 210, 393, 305, 989, 
        271, 128, 407, 210, 63, 193

    );
  WeirdArrayServer:array256 = (
          624, 809, 640, 161, 28, 112, 856, 402, 851,0,0,0,0,0,0,0,0, 150,0, 851,0,0,0,0,0, 775, 905, 133, 554, 915, 827, 69,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 330,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 738, 643, 836, 662, 55, 493, 392, 44, 529, 80, 817, 381, 490, 242, 75, 948,0,0, 262, 167, 712, 25, 248, 816, 345, 783, 400, 89, 48, 704, 989, 582, 527, 783, 641, 590, 195, 888, 657, 640, 518, 960, 153, 181, 25, 407, 194, 547, 751, 607, 930, 542, 562, 443, 562, 446, 944, 928, 629, 350, 137, 306, 0
    );


const server_crypt_e: Integer = 0;
      server_crypt_d: Integer = 0;
      server_crypt_c: Integer = 0;
      server_crypt_b: Integer = 0;
      client_crypt_e: Integer = 0;
      client_crypt_d: Integer = 0;
      client_crypt_c: Integer = 0;
      client_crypt_b: Integer = 0;
      init_c: Integer = 0;
      Init_e: Integer = 0;


const Commands:StringArrayC = (#13#10,
                               'MoveTo',
                               'MoveToVarVar',
                               'MoveToRandomly',
                               'MoveToNoWait',
                               'MoveToNoWaitVarVar',
                               'MapMoveTo',
                               'MapMoveToNoWait',
                               'MapMoveToVars',
                               'MapMoveToNoWaitVars',
                               'MapAction',
                               'MapActionVar',
                               'Action',
                               'ActionVarVar',
                               'AtObject',
                               'AtObjectVar',
                               'AtObject2',
                               'AtObjectWithItem',
                               'AtObjectWithItemByID',
                               'MineNearest',
                               'MineNearestIn',
                               'FarActionAtObject',
                               'FarAction',
                               'FarActionNoReach',
                               'FarMoveTo',
                               'FarActionVar',
                               'FarMoveToVar',
                               'TalkToNPC',
                               'TalkToNPCVar',
                               'FleeFromNPC',
                               'AttackPlayer',
                               'AttackPlayerVar',
                               'TradePlayer',
                               'TradePlayerVar',
                               'Accept1',
                               'Accept2',
                               'Decline',
                               'PutTrade',
                               'PutTradeVar',
                               'AttackNPC',
                               'AttackNPCVar',
                               'ThieveNPC',
                               'ThieveNPCVar',
                               'MagicPlayer',
                               'MagicNPC',
                               'MagicNPCVar',
                               'Magic',
                               'Wield',
                               'Unwield',
                               'WieldByID',
                               'UnwieldByID',
                               'WieldByVar',
                               'UnwieldByVar',
                               'Deposit',
                               'Withdraw',
                               'WithdrawVar',
                               'Answer',
                               'UseItem',
                               'UseItemByID',
                               'CloseShop',
                               'CloseBank',
                               'LogOut',
                               'RedirectDest',
                               'DropItem',
                               'DropItemByID',
                               'TakeItem',
                               'TakeItemVarVar',
                               'TakeItemVarVarVar',
                               'PickItemWithItem',
                               'PickItemWithItemID',
//                               'SmeltOre',
//                               'ForgeBar',
//                               'Cook',
                               'DepositEverything',
                               'SellItem',
                               'BuyItem',
                               'MagicOnItemByPos',
                               'MagicOnItemByID',
                               'SetFire',
                               'SetFireAtCoords',
                               'SetFireTinderPos',
                               'UseItemWithItem',
                               'UseItemWithItemByID',
                               'OpenDoor',
                               'CloseDoor',
                               'WithItemAtDoor',
                               'PrayerOn',
                               'PrayerOff',
                               'FightMode',

                               'Wait',
                               'Sleep',
                               'WaitForQuestMenu',
                               'WaitForServerMessage',
                               'WaitForBankWindow',
                               'WaitForShopWindow',
                               'WaitForCoordChange',
                               'RepeatNextCommandUntilQuestMenu',
                               'GoTo',
                               'ResetLastItemGained',
                               'ResetLastItemLost',
                               'GoToIfLastItem',
                               'GoToIfLastItemLost',
                               'GoToIfBagFull',
                               'GoToIfItemGained',
                               'GoToIfItemLost',
                               'GoToIfInInventory',
                               'GoToIfCountInInventoryEqual',
                               'GoToIfCountInInventoryGreater',
                               'GoToIfVarEqual',
                               'GoToIfVarNotEqual',
                               'GoToIfVarAbove',
                               'GoToIfVarBelow',
                               'GoToIfVarEqualNum',
                               'GoToIfVarNotEqualNum',
                               'GoToIfVarAboveNum',
                               'GoToIfVarBelowNum',
                               'GoToIfVarBetween',
                               'GoToIfVarBetweenNum',
                               'SetVarNum',
                               'SetVar',
                               'SetVarRandom',
                               'SetVarRandomVar',
                               'AddVarNum',
                               'AddVar',
                               'SubVar',
                               'SetVarItemPosByID',
                               'SetVarItemCount',
                               'SetVarCountInBank',
                               'SetVarIDInBank',
                               'SetVarCountInBankVar',
                               'SetVarIDInBankVar',
                               'SetVarItemsInBank',
                               'SetVarCountInShop',
                               'SetVarCountInShopVar',
                               'SetVarMyX',
                               'SetVarMyY',
                               'SetVarFatigue',
                               'SetVarMyHP',
                               'SetVarMyID',
                               'SetCoordsNearer',
                               'GoToIfCoordsCloserThan',
                               'GoToIfCoordsIn',
                               'GoToIfCoordsCloserThanVars',
                               'GoToIfCoordsInVars',
{                               'GoToIfNearItem',
                               'SetVarsItemXY',}
                               'SetVarLastPlayerID',
                               'SetVarsPlayer',
                               'SetVarPlayerSkulled',
                               'SetVarPlayerByName',
                               'SetVarNearestPlayer',
                               'GoToIfPlayerVisibleVar',
                               'SetVarsNearestNPC',
                               'SetVarsRandomNPC',
                               'GoToIfNPCNear',
                               'SetVarsNearestNPCIn',
                               'SetVarsNearestNPCInVar',
                               'SetVarsRandomNPCIn',
                               'GoToIfNPCNearIn',
                               'GoToIfNPCNearInVar',
                               'GoToIfFighting',
                               'SetVarDistanceToNPC',
                               'SetVarNPCType',
                               'SetVarNPCTypeVar',
                               'SetVarNPCCoords',
                               'SetVarNPCCoordsVar',
                               'GoToIfNPCVisible',
                               'SetVarObject',
                               'SetVarObjectVar',
                               'SetVarsNearestObjectXY',
                               'GoToIfObjectNear',
                               'SetObject',
                               'SetObjectVar',
                               'SetVarTime',
                               'PutVarInArray',
                               'PutNumInArray',
                               'GetVarFromArray',
                               'GoToIfIsVarInArray',
                               'GoToIfIsNumInArray',
                               'Push',
                               'PushNum',
                               'Pop',
                               'RetrieveNPCList',
                               'GoToRandom',
                               'GoToCase',
                               'GoSub',
                               'GoSubRandom',
                               'GoSubNext',
                               'Ret',
                               'ERet',
                               'ERetToRet',
                               'NoRet',
                               'EnableEvents',
                               'Stop',
                               'StopAndLogOut',
                               'Say',
                               'SayInt',
                               'SetPMReceiver',
                               'SetPMReceiverByID',
                               'SetPMReceiverLastPMer',
                               'PM',
                               'PMInt',
                               'Hex',
                               'HexInt',
                               'HTTPGet',
                               'HTTPGetParamVar',
                               'Debug',
                               'DebugVar',
                               'DebugRS',
                               'DebugRSVar',
                               'DebugLastHTTPResponse',
                               'DebugLastServerMessage',
                               'DebugLastChatMessage',
                               'DebugLastPM',
                               'DebugLastPMer',
                               'DebugPlayerName',
                               'SetTraceMode',
                               'CheckFighters',
                               'SetTimeSinceMovingToDest',
                               'SaveScreenshot',
                               'MessageBox',
                               'PlaySound',
                               'GoToIfQuestion',
                               'GoToIfLastServerMessageIs',
                               'GoToIfLastServerMessageIsNot',
                               'GoToIfInLastServerMessageIs',
                               'GoToIfInLastServerMessageIsNot',
                               'GoToIfLastHTTPResponseIs',
                               'GoToIfLastHTTPResponseIsNot',
                               'GoToIfInLastHTTPResponseIs',
                               'GoToIfInLastHTTPResponseIsNot',
                               'GoToIfLastChatMessageIs',
                               'GoToIfLastChatMessageIsNot',
                               'GoToIfInLastChatMessageIs',
                               'GoToIfInLastChatMessageIsNot',
                               'GoToIfLastPMIs',
                               'GoToIfLastPMIsNot',
                               'GoToIfInLastPMIs',
                               'GoToIfInLastPMIsNot',
                               'ResetLastServerMessage',
                               'ResetLastHTTPResponse',
                               'ResetLastChatMessage',
                               'ResetLastPM',
                               'GoToIfQuestMenu',
                               'ResetQuestMenu',
                               'SetOnPlaceTime',
                               'SetSkipDestTime',
                               'SetCheatDestTime',
                               'SetRetryDestTime',
                               'SetSkipDestMode',
                               'SetCheatDestMode',
                               'SetRetryDestMode',
                               'SetLagSafe',
                               'SetNoMouseMovement',
                               'ForgetItems',
                               'WatchObjects',
                               'Click',
                               'ClickVar',
                               'ClickR',
                               'ClickRVar',
                               'MoveMouse',
                               'MoveMouseVar',
                               'GetColor',
                               'GetColorVar',
                               'ClickColor',
                               'ClickColorVar',
                               'ClickColorAt',
                               'ClickColorSpiralAt',
                               'SendKeys',
                               'SendArrow',
                               'FindColor',
                               'FindColorVar',
                               'FindColorSpiralAt',
                               'ClearDebug',
                               'OnItemLost',
                               'OnItemGained',
                               'OnServerMessage',
                               'OnPrivateMessage',
                               'OnCoordsChanged',
                               'OnDestinationReached',
                               'OnIdle',
                               'OnHPChanged',
                               'OnStatsChanged',
                               'OnChatMessage',
                               'OnShopClosed',
                               'OnNPCAppeared',
                               'OnItemAppeared',
                               'OnNPCMoved',
                               'OnObject',
                               'OnRetryDest',
                               'OnSkipDest',
                               'OnCheatDest',
                               'OnQuestMenuAppeared',
                               'OnTradeClosed',
                               'OnTrade1',
                               'OnTrade2',
                               'OnTradeAccepted',
                               'OnTimer',
                               'OnLogin',
                               'OnItemDisappeared'


                               );

const CommandDescs:StringArrayC =
                              (#9'Nothing selected',
                               #9'MoveTo'#9'(x,y[,x1,y1,...])',
                               #9'MoveToVarVar'#9'(%x,%y)',
                               #9'MoveToRandomly'#9'(x1,y1[,x2,y2,...])',
                               #9'MoveToNoWait'#9'(x,y[,x1,y1,...])',
                               #9'MoveToNoWaitVarVar'#9'(%x,%y)',
                               #9'MapMoveTo'#9'(x,y)',
                               #9'MapMoveToNoWait'#9'(x,y)',
                               #9'MapMoveToVars'#9'(%x,%y)',
                               #9'MapMoveToNoWaitVars'#9'(%x,%y)',
                               #9'MapAction'#9'(x,y)',
                               #9'MapActionVar'#9'(%x,%y)',
                               #9'Action'#9'(x,y)',
                               #9'ActionVarVar'#9'(%x,%y)',
                               #9'AtObject'#9'(x,y)',
                               #9'AtObjectVar'#9'(%x,%y)',
                               #9'AtObject2'#9'(x,y)',
                               #9'AtObjectWithItem'#9'(x,y,pos)',
                               #9'AtObjectWithItemByID'#9'(x,y,ID)',
                               #9'MineNearest'#9'(Type[,Type2,...])',
                               #9'MineNearestIn'#9'(x1,y1,x2,y2,Type[,Type2,...])',
                               #9'FarActionAtObject'#9'(x,y)',
                               #9'FarAction'#9'(x,y)',
                               #9'FarActionNoReach'#9'(x,y)',
                               #9'FarMoveTo'#9'(x,y)',
                               #9'FarActionVar'#9'(%x,%y)',
                               #9'FarMoveToVar'#9'(%x,%y)',
                               #9'TalkToNPC'#9'(ID1[,ID2,...])',
                               #9'TalkToNPCVar'#9'(%ID1[,%ID2,...])',
                               #9'FleeFromNPC'#9'(dist,x,y)',

                               #9'AttackPlayer'#9'(ID)',
                               #9'AttackPlayerVar'#9'(%ID)',
                               #9'TradePlayer'#9'(ID)',
                               #9'TradePlayerVar'#9'(%ID)',
                               #9'Accept1'#9'()',
                               #9'Accept2'#9'()',
                               #9'Decline'#9'()',
                               #9'PutTrade'#9'(ID,count[,ID,count,...])',
                               #9'PutTradeVar'#9'(%ID,%count[,%ID,%count,...])',
                               #9'AttackNPC'#9'(ID)',
                               #9'AttackNPCVar'#9'(%ID)',
                               #9'ThieveNPC'#9'(ID1[,ID2,...])',
                               #9'ThieveNPCVar'#9'(%ID1[,%ID2,...])',
                               #9'MagicPlayer'#9'(%ID,num)',
                               #9'MagicNPC'#9'(ID,num)',
                               #9'MagicNPCVar'#9'(%ID,num)',
                               #9'Magic'#9'(num)',
                               #9'Wield'#9'(pos)',
                               #9'Unwield'#9'(pos)',
                               #9'WieldByID'#9'(ID)',
                               #9'UnwieldByID'#9'(ID)',
                               #9'WieldByVar'#9'(%ID)',
                               #9'UnwieldByVar'#9'(%ID)',
                               #9'Deposit'#9'(ID,count)',
                               #9'Withdraw'#9'(ID,count)',
                               #9'WithdrawVar'#9'(%ID,%count)',
                               #9'Answer'#9'(choice)',
                               #9'UseItem'#9'(pos)',
                               #9'UseItemByID'#9'(ID)',
                               #9'CloseShop'#9'()',
                               #9'CloseBank'#9'()',
                               #9'LogOut'#9'()',
                               #9'RedirectDest'#9'(times,secs[,ip1,ip2,ip3,ip4[,port]])',
                               #9'DropItem'#9'(pos)',
                               #9'DropItemByID'#9'(ID)',
                               #9'TakeItem'#9'(x,y,ID)',
                               #9'TakeItemVarVar'#9'(%x,%y,ID)',
                               #9'TakeItemVarVarVar'#9'(%x,%y,%ID)',
                               #9'PickItemWithItem'#9'(x,y,ID,pos)',
                               #9'PickItemWithItemID'#9'(x,y,ID,ID2)',
//                               #9'SmeltOre'#9'(x,y,ox,oy,ID)',
//                               #9'ForgeBar'#9'(x,y,ox,oy,ID)',
//                               #9'Cook'#9'(x,y,ox,oy,ID)',
                               #9'DepositEverything'#9'()',
                               #9'SellItem'#9'(ID,base)',
                               #9'BuyItem'#9'(ID,base)',
                               #9'MagicOnItemByPos'#9'(pos,num)',
                               #9'MagicOnItemByID'#9'(ID,num)',
                               #9'SetFire'#9'()',
                               #9'SetFireAtCoords'#9'(x,y)',
                               #9'SetFireTinderPos'#9'(pos)',
                               #9'UseItemWithItem'#9'(pos1,pos2)',
                               #9'UseItemWithItemByID'#9'(ID1,ID2)',
                               #9'OpenDoor'#9'(x,y,dir)',
                               #9'CloseDoor'#9'(x,y,dir)',
                               #9'WithItemAtDoor'#9'(x,y,dir,ID)',
                               #9'PrayerOn'#9'(num)',
                               #9'PrayerOff'#9'(num)',
                               #9'FightMode'#9'(0-3)',

                               #9'Wait'#9'(time[,time2,...])',
                               #9'Sleep'#9'(time*100[,time2*100,...])',
                               #9'WaitForQuestMenu'#9'(time)',
                               #9'WaitForServerMessage'#9'(time)',
                               #9'WaitForBankWindow'#9'(time)',
                               #9'WaitForShopWindow'#9'(time)',
                               #9'WaitForCoordChange'#9'()',
                               #9'RepeatNextCommandUntilQuestMenu'#9'(time,count)',
                               #9'GoTo'#9'(@label)',
                               #9'ResetLastItemGained'#9'()',
                               #9'ResetLastItemLost'#9'()',
                               #9'GoToIfLastItem'#9'(@label,ID)',
                               #9'GoToIfLastItemLost'#9'(@label,ID)',
                               #9'GoToIfBagFull'#9'(@label)',
                               #9'GoToIfItemGained'#9'(@label)',
                               #9'GoToIfItemLost'#9'(@label)',
                               #9'GoToIfInInventory'#9'(@label,ID[,ID2,...])',
                               #9'GoToIfCountInInventoryEqual'#9'(@label,num,ID[,ID2,...])',
                               #9'GoToIfCountInInventoryGreater'#9'(@label,num,ID[,ID2,...])',
                               #9'GoToIfVarEqual'#9'(@label,%var1,%var2)',
                               #9'GoToIfVarNotEqual'#9'(@label,%var1,%var2)',
                               #9'GoToIfVarAbove'#9'(@label,%var1,%var2)',
                               #9'GoToIfVarBelow'#9'(@label,%var1,%var2)',
                               #9'GoToIfVarEqualNum'#9'(@label,%var,num)',
                               #9'GoToIfVarNotEqualNum'#9'(@label,%var,num)',
                               #9'GoToIfVarAboveNum'#9'(@label,%var,num)',
                               #9'GoToIfVarBelowNum'#9'(@label,%var,num)',
                               #9'GoToIfVarBetween'#9'(@label,%var,%varMin,%varMax)',
                               #9'GoToIfVarBetweenNum'#9'(@label,%var,Min,Max)',
                               #9'SetVarNum'#9'(%var,num)',
                               #9'SetVar'#9'(%var1,%var2)',
                               #9'SetVarRandom'#9'(%var,num)',
                               #9'SetVarRandomVar'#9'(%var,%num)',
                               #9'AddVarNum'#9'(%var,num)',
                               #9'AddVar'#9'(%var1,%var2)',
                               #9'SubVar'#9'(%var1,%var2)',
                               #9'SetVarItemPosByID'#9'(%pos,ID)',
                               #9'SetVarItemCount'#9'(%var,ID)',
                               #9'SetVarCountInBank'#9'(%Count,pos)',
                               #9'SetVarIDInBank'#9'(%ID,pos)',
                               #9'SetVarCountInBankVar'#9'(%Count,%pos)',
                               #9'SetVarIDInBankVar'#9'(%ID,%pos)',
                               #9'SetVarItemsInBank'#9'(%c)',
                               #9'SetVarCountInShop'#9'(%var,ID)',
                               #9'SetVarCountInShopVar'#9'(%var,%ID)',
                               #9'SetVarMyX'#9'(%var)',
                               #9'SetVarMyY'#9'(%var)',
                               #9'SetVarFatigue'#9'(%var)',
                               #9'SetVarMyHP'#9'(%var)',
                               #9'SetVarMyID'#9'(%var)',
                               #9'SetCoordsNearer'#9'(%x,%y)',
                               #9'GoToIfCoordsCloserThan'#9'(@label,x1,y1,x2,y2)',
                               #9'GoToIfCoordsIn'#9'(@label,x1,y1,x2,y2)',
                               #9'GoToIfCoordsCloserThanVars'#9'(@label,%x1,%y1,%x2,%y2)',
                               #9'GoToIfCoordsInVars'#9'(@label,%x1,%y1,%x2,%y2)',
{                               #9'GoToIfNearItem'#9'(@label,ID,Distance)',
                               #9'SetVarsItemXY'#9'(%x,%y,ID,Distance)',}
                               #9'SetVarLastPlayerID'#9'(%ID)',
                               #9'SetVarsPlayer'#9'(%ID,%x,%y,%lvl,%HP)',
                               #9'SetVarPlayerSkulled'#9'(ID,%v)',
                               #9'SetVarPlayerByName'#9'(%ID,"name")',
                               #9'SetVarNearestPlayer'#9'(%ID)',
                               #9'GoToIfPlayerVisibleVar'#9'(@label,%ID)',
                               #9'SetVarsNearestNPC'#9'(%x,%y,%ID,type[,type2,...])',
                               #9'SetVarsRandomNPC'#9'(%x,%y,%ID,type[,type2,...])',
                               #9'GoToIfNPCNear'#9'(@label,type[,type2,...])',
                               #9'SetVarsNearestNPCIn'#9'(%x,%y,%ID,x1,y1,x2,y2,type[,type2,...])',
                               #9'SetVarsNearestNPCInVar'#9'(%x,%y,%ID,%x1,%y1,%x2,%y2,%type[,%type2,...])',
                               #9'SetVarsRandomNPCIn'#9'(%x,%y,%ID,x1,y1,x2,y2,type[,type2,...])',
                               #9'GoToIfNPCNearIn'#9'(@label,x1,y1,x2,y2,type[,type2,...])',
                               #9'GoToIfNPCNearInVar'#9'(@label,%x1,%y1,%x2,%y2,%type[,%type2,...])',
                               #9'GoToIfFighting'#9'(@label)',
                               #9'SetVarDistanceToNPC'#9'(%dist)',
                               #9'SetVarNPCType'#9'(%type,ID)',
                               #9'SetVarNPCTypeVar'#9'(%type,%ID)',
                               #9'SetVarNPCCoords'#9'(%x,%y,ID)',
                               #9'SetVarNPCCoordsVar'#9'(%x,%y,%ID)',
                               #9'GoToIfNPCVisible'#9'(@label,%ID)',
                               #9'SetVarObject'#9'(%type,x,y)',
                               #9'SetVarObjectVar'#9'(%type,%x,%y)',
                               #9'SetVarsNearestObjectXY'#9'(%x,%y,dist,type[,type2,...])',
                               #9'GoToIfObjectNear'#9'(@label,dist,type[,type2,...])',
                               #9'SetObject'#9'(x,y,type)',
                               #9'SetObjectVar'#9'(%x,%y,%type)',
                               #9'SetVarTime'#9'(%var)',
                               #9'PutVarInArray'#9'(%var,%index,%a1[,%a2,...])',
                               #9'PutNumInArray'#9'(num,%index,%a1[,%a2,...])',
                               #9'GetVarFromArray'#9'(%var,%index,%a1[,%a2,...])',
                               #9'GoToIfIsVarInArray'#9'(@label,%var,%a1[,%a2,...])',
                               #9'GoToIfIsNumInArray'#9'(@label,num,%a1[,%a2,...])',
                               #9'Push'#9'(%var)',
                               #9'PushNum'#9'(num)',
                               #9'Pop'#9'(%var)',
                               #9'RetrieveNPCList'#9'([%type,...])',
                               #9'GoToRandom'#9'(@label[,@label2,...])',
                               #9'GoToCase'#9'(%var,@label1[,@label2,...])',
                               #9'GoSub'#9'(@label)',
                               #9'GoSubRandom'#9'(@label[,@label2,...])',
                               #9'GoSubNext'#9'()',
                               #9'Ret'#9'()',
                               #9'ERet'#9'()',
                               #9'ERetToRet'#9'()',
                               #9'NoRet'#9'()',
                               #9'EnableEvents'#9'()',
                               #9'Stop'#9'()',
                               #9'StopAndLogOut'#9'()',
                               #9'Say'#9'(Heximal Data)',
                               #9'SayInt'#9'(num[,num2,...])',
                               #9'SetPMReceiver'#9'("text")',
                               #9'SetPMReceiverByID'#9'(ID)',
                               #9'SetPMReceiverLastPMer'#9'()',
                               #9'PM'#9'(Heximal Data)',
                               #9'PMInt'#9'(num[,num2,...])',
                               #9'Hex'#9'(Heximal Data)',
                               #9'HexInt'#9'(num[,num2,...])',
                               #9'HTTPGet'#9'("text")',
                               #9'HTTPGetParamVar'#9'(%var[,%var2,...])',
                               #9'Debug'#9'("text")',
                               #9'DebugVar'#9'(%var[,%var2,...])',
                               #9'DebugRS'#9'("text")',
                               #9'DebugRSVar'#9'(%var[,%var2,...])',
                               #9'DebugLastHTTPResponse'#9'()',
                               #9'DebugLastServerMessage'#9'()',
                               #9'DebugLastChatMessage'#9'()',
                               #9'DebugLastPM'#9'()',
                               #9'DebugLastPMer'#9'()',
                               #9'DebugPlayerName'#9'(%ID)',
                               #9'SetTraceMode'#9'(0-2)',
                               #9'CheckFighters'#9'(0-1)',
                               #9'SetTimeSinceMovingToDest'#9'(num)',
                               #9'SaveScreenshot'#9'()',
                               #9'MessageBox'#9'("text")',
                               #9'PlaySound'#9'("text")',
                               #9'GoToIfQuestion'#9'(@label,"text")',
                               #9'GoToIfLastServerMessageIs'#9'(@label,"text")',
                               #9'GoToIfLastServerMessageIsNot'#9'(@label,"text")',
                               #9'GoToIfInLastServerMessageIs'#9'(@label,"text")',
                               #9'GoToIfInLastServerMessageIsNot'#9'(@label,"text")',
                               #9'GoToIfLastHTTPResponseIs'#9'(@label,"text")',
                               #9'GoToIfLastHTTPResponseIsNot'#9'(@label,"text")',
                               #9'GoToIfInLastHTTPResponseIs'#9'(@label,"text")',
                               #9'GoToIfInLastHTTPResponseIsNot'#9'(@label,"text")',
                               #9'GoToIfLastChatMessageIs'#9'(@label,"text")',
                               #9'GoToIfLastChatMessageIsNot'#9'(@label,"text")',
                               #9'GoToIfInLastChatMessageIs'#9'(@label,"text")',
                               #9'GoToIfInLastChatMessageIsNot'#9'(@label,"text")',
                               #9'GoToIfLastPMIs'#9'(@label,"text")',
                               #9'GoToIfLastPMIsNot'#9'(@label,"text")',
                               #9'GoToIfInLastPMIs'#9'(@label,"text")',
                               #9'GoToIfInLastPMIsNot'#9'(@label,"text")',
                               #9'ResetLastHTTPResponse'#9'()',
                               #9'ResetLastServerMessage'#9'()',
                               #9'ResetLastChatMessage'#9'()',
                               #9'ResetLastPM'#9'()',
                               #9'GoToIfQuestMenu'#9'(@label)',
                               #9'ResetQuestMenu'#9'()',
                               #9'SetOnPlaceTime'#9'(time)',
                               #9'SetSkipDestTime'#9'(time)',
                               #9'SetCheatDestTime'#9'(time)',
                               #9'SetRetryDestTime'#9'(time)',
                               #9'SetSkipDestMode'#9'(0-1)',
                               #9'SetCheatDestMode'#9'(0-1)',
                               #9'SetRetryDestMode'#9'(0-1)',
                               #9'SetLagSafe'#9'(0-1)',
                               #9'SetNoMouseMovement'#9'(0-1)',
                               #9'ForgetItems'#9'()',
                               #9'WatchObjects'#9'(0-1)',
                               #9'Click'#9'(x,y)',
                               #9'ClickVar'#9'(%x,%y)',
                               #9'ClickR'#9'(x,y)',
                               #9'ClickRVar'#9'(%x,%y)',
                               #9'MoveMouse'#9'(x,y)',
                               #9'MoveMouseVar'#9'(%x,%y)',
                               #9'GetColor'#9'(x,y,%color)',
                               #9'GetColorVar'#9'(%x,%y,%color)',
                               #9'ClickColor'#9'(color)',
                               #9'ClickColorVar'#9'(%color)',
                               #9'ClickColorAt'#9'(color,x1,y1,x2,y2)',
                               #9'ClickColorSpiralAt'#9'(color,x,y,x1,y1,x2,y2)',
                               #9'SendKeys'#9'("text")',
                               #9'SendArrow'#9'(0-3)',
                               #9'FindColor'#9'(color,%x,%y,x1,y1,x2,y2)',
                               #9'FindColorVar'#9'(%color,%x,%y,x1,y1,x2,y2)',
                               #9'FindColorSpiralAt'#9'(color,%x,%y,x1,y1,x2,y2)',
                               #9'ClearDebug'#9'()',
                               #9'OnItemLost'#9'(@label,%ItemID,%ItemPos)',
                               #9'OnItemGained'#9'(@label,%ItemID,%ItemPos)',
                               #9'OnServerMessage'#9'(@label)',
                               #9'OnPrivateMessage'#9'(@label)',
                               #9'OnCoordsChanged'#9'(@label,%LastX,%LastY)',
                               #9'OnDestinationReached'#9'(@label)',
                               #9'OnIdle'#9'(@label,time)',
                               #9'OnHPChanged'#9'(@label,%HP)',
                               #9'OnStatsChanged'#9'(@label,%StatsNum)',
                               #9'OnChatMessage'#9'(@label)',
                               #9'OnShopClosed'#9'(@label)',
                               #9'OnNPCAppeared'#9'(@label,%ID,%x,%y,%type)',
                               #9'OnItemAppeared'#9'(@label,%ID,%x,%y)',
                               #9'OnNPCMoved'#9'(@label,%ID,%x,%y,%type)',
                               #9'OnObject'#9'(@label,%type,%x,%y)',
                               #9'OnRetryDest'#9'(@label)',
                               #9'OnSkipDest'#9'(@label)',
                               #9'OnCheatDest'#9'(@label)',
                               #9'OnQuestMenuAppeared'#9'(@label)',
                               #9'OnTradeClosed'#9'(@label)',
                               #9'OnTrade1'#9'(@label)',
                               #9'OnTrade2'#9'(@label)',
                               #9'OnTradeAccepted'#9'(@label)',
                               #9'OnTimer'#9'(@label,1-10,time)',
                               #9'OnLogin'#9'(@label)',
                               #9'OnItemDisAppeared'#9'(@label,%ID,%x,%y)'



                               );



const SecretWord = 'admin';
      BotVers = '280';

const CommentChars = [';', '-', '''', '/', '#'];
      MyServerName:string = 'kaitnieks.serveris.lv';

const PlaceTimeout:Integer = 2400;
      RetryDestTime:Integer = 30;
      SkipDestTime: Integer = 2000;
      CheatDestTime: Integer = 800;
      RetryDestMode: Boolean = True;
      SkipDestMode: Boolean = True;
      CheatDestMode: Boolean = True;
      CollectObjInfo: Boolean = True;
      ControlSafeMode: Boolean = False;
      CheckFighters: Boolean = False;
      objDisC: Integer = 50;
      MapMoving: Boolean = False;

const CheatCoords = False;
      CheatCoordX: Integer = 100;
      CheatCoordY: Integer = 100;

      MustShowMinimap: Boolean = False;

type CharArray61 = array[0..60]of Char;
type CharArray5 = array[0..4]of Char;

const Burti:CharArray61 = (
        ' ', 'e', 't', 'a', 'o', 'i', 'h', 'n', 's', 'r',
        'd', 'l', 'u', 'm', 'w', 'c', 'y', 'f', 'g', 'p',
        'b', 'v', 'k', 'x', 'j', 'q', 'z', '0', '1', '2',
        '3', '4', '5', '6', '7', '8', '9', ' ', '!', '?',
        '.', ',', ':', ';', '(', ')', '-', '&', '*', '\',
        '''', '@', '#', '+', '=', '�', '$', '%', '"', '[',
        ']');



var iib:array of string;





var RSUserName : String;
    RSPass : String;
    ReconnectAfterDisconnects : Boolean;
    ReconnectTime: Integer;
    ReconnectTimes: Integer;
    TriesLeft: Integer;
    DynReconnectTime: Integer;

//For events
type TSingleEvent = record
                      num: Integer;
                      params: array[1..5]of Integer;
                    end;

type TSingleMonster = record
                        X, Y: Integer;
                        ID, Tips: Integer;
                        Fighting: Boolean;
                      end;

type TSinglePlayer = record
                        X, Y: Integer;
                        ID: Integer;
                        Fighting: Boolean;
                        Dir: Byte;
                        Skull: Boolean;
                      end;

type TPlayerData = record
                     Name: string;
                     Lvl: Integer;
                     HP: Integer;
                     MaxHP: Integer;
                     X, Y: Integer;
                     LastRequest: Integer;
                   end;

type TBankItem = record
                   ID: Word;
                   Count: Cardinal;
                 end;

type BigMapArray = array[0..400,0..4000]of Byte;
     SmallMapArray = array[-20..20,-20..20]of Byte;
     BigWordArray = array[0..400,0..4000]of Word;
     SmallWordArray = array[-20..20,-20..20]of Integer;
type TPointArray = array of TPoint;

type IntegerArray16 = array[1..16]of Integer;

{type
  TMyIntercept = class(TIdLogBase)
public
  procedure Receive(ABuffer: TStream); override;
  procedure Send(ABuffer: TStream); override;
end; }


var
  InEvent: Boolean;
  EventQueue: array of TSingleEvent;
  OnItemLost, OnItemLostItem, OnItemLostPos: Integer;
  OnItemGained, OnItemGainedItem, OnItemGainedPos: Integer;
  OnServerMessage: Integer;
  OnPrivateMessage: Integer;
  OnCoordsChanged, OnCoordsChangedLastX, OnCoordsChangedLastY: Integer;
  OnDestinationReached: Integer;
  OnIdle, OnIdleTime: Integer;
  OnHPChanged, OnHPChangedHP: Integer;
  OnStatsChanged, OnStatsChangedStat: Integer;
  OnChatMessage: Integer;
  OnShopClosed: Integer;
  OnNPCAppeared, OnNPCAppearedID, OnNPCX, OnNPCY, OnNPCType: Integer;
  OnItemAppeared, OnItemID, OnItemX, OnItemY: Integer;
  OnItemDisAppeared, OnItemDisID, OnItemDisX, OnItemDisY: Integer;
  OnNPCMoved, OnNPCNewX, OnNPCNewY, OnNPCMovedID, OnNPCMovedTips: Integer;
  OnObject, OnObjectType, OnObjectX, OnObjectY: Integer;
  OnRetryDest: Integer;
  OnSkipDest: Integer;
  OnCheatDest: Integer;
  OnQuestMenuAppeared: Integer;
  OnTradeClosed: Integer;
  OnTrade1: Integer;
  OnTrade2: Integer;
  OnTradeAccept: Integer;
  OnLogin: Integer;



{type  TRecvThread = class(TIdPeerThread)
  private
    procedure ProcessAllData(var S:String; Outgoing:Boolean);
    procedure DoSynchronize(var S: String);
  end;}



var
  Form1: TForm1;
  MyIntercept: TIdConnectionIntercept;
  LastClient: TIdTCPConnection;
  LastThread: TIdPeerThread;
  Items, ItemCounts: array[0..29] of Integer;
  ShopItems, ShopItemCounts, ShopItemMod: array[0..260] of Integer;
  Bank: array[0..255]of TBankItem;
  BankItemsCount: Integer;
//  VisibleItems: array[1..40]of ItemRecord;
  VisibleObjects: array[1..300]of ObjRecord;
  SelObj: Integer;
  UpdateObjs: Boolean;
  Vars: array[0..100]of integer;
  BagFull, QuestMenuAppeared, BankWindow, ShopWindow, LoggedIn, ServerMessageAppeared: Boolean;
  Stopped: Boolean;
  LastX, LastY: Integer;
  MyX, MyY, MyDir, LastMapX, LastMapY, LastFightTime: Integer;
  DestX, DestY, _DestX, _DestY: Integer;
  WaitTime, _WaitTime: Integer;
  WaitForQuestMenu, _WaitForQuestMenu: Boolean;
  WaitForServerMessage, _WaitForServerMessage: Boolean;
  TimeOnPlace: Integer;
  TimeSincePing: Integer;
  TimeSinceRSPing: Integer;
  PreviousCommand, LastCommand, SplitCommand: String;
  SplitLength: Integer;
  ChangedCoords: Boolean;
  WaitForCoordChange, _WaitForCoordChange: Boolean;
  WaitForBankWindow, _WaitForBankWindow: Boolean;
  WaitForShopWindow, _WaitForShopWindow: Boolean;
  SkipLines: Integer;
  LastItemGained, LastItemLost: Integer;
  AltDest, _AltDest:array of Coordinates;
  HowFar: Integer;
  DebugInfo: Boolean;
  DataSent: Integer;
  LastFreeItem: Integer;
  TimeSinceMouseMoved, ScriptIdle, _ScriptIdle: Integer;
  DontMoveMouse: Boolean;
  TimeSinceMovingToDest, _TimeSinceMovingToDest: Integer;
  TimeSinceDisconnect: Integer;
  CipherKey1, CipherKey2: Byte;
  CipherString: String;
  CanUseThisBot: Boolean;
  WasOnWhenDisconnected: Boolean;
  RetStack, ERetStack, VarStack: array[1..50]of Integer;
  SPRet, SPERet, SPVar: Integer;
  LastServerResponse, LastServerMessage, LastChatMessage, LastPM, LastPMer, NextPMrec: String;
  NextPMee: Int64;
  MyID, MyHP, Fatigue: Integer;
  OutGoing: Boolean;
  ConnectionData: String;
  NewItem, NewItemX, NewItemY: Integer;
  MembersServer: Boolean;
  Monsters: array[1..50] of TSingleMonster;
  Players: array of TSinglePlayer;
  PlayerData: array [0..$FFFF] of TPlayerData;
  LastMonst: Integer;
  Fight0, Fight1, Fight2: String;
  //Fig0, Fig1, Fig2: String;
  WindowTitle: String;
  Timers, TJumps: array[1..10]of Integer;
  LastRSWindowH, UserHandle: THandle;
  xt: Integer;
  RedirectPort, RedirectPortOnce: Integer;
  RedirectHost, RedirectHostOnce: string;
  CreateAFScript: Boolean;
  CreateAFFightMode, CreateAFMinHP: Integer;
  CreateAFPickBones, CreateAFPickCoins: Boolean;
  xbb, ybb: Byte;
  OutgoingData, IncomingData: string;
  DeleteIncomingBytes, DeleteOutgoingBytes: Integer;
  LastAttackedPlayer: Cardinal;
  BigMap: BigMapArray;
  LastFileAge: Integer;
  HttpGetParams: string;


  CP, RepeatCP, _RepeatCP: Integer;
  ProcessingScriptLine, ProcessingOutgoingCommand: Boolean;


procedure FillBigMapWithDistanceNumbers(var BigMap: BigMapArray; var A: BigWordArray; Sx, Sy, Ex, Ey: Integer; MaxStep: Integer);
procedure MakePath(var A: BigWordArray; var Path: TPointArray; Sx, Sy: Integer);
procedure MakeMoveToCoordList(Path: TPointArray; var A: TIntegerArray);
function EncryptCommandForServerF2(S: string): string;
procedure DebugTextAdd(S: String);


implementation

{$R *.DFM}

uses IDStack, IDGlobal, FormAuth, Unit3, FormRelogin, FormAF, MapProcessUnit,
  MapForm;

const DefaultCaption = 'AutoRune 2.8 by Kaitnieks';


procedure DebugTextAdd(S: String);
var T: TextFile;
Begin
  If(not ControlSafeMode)Then Begin
    Form1.txtData.Lines.Add(S);
    Form1.txtDebug.Lines.Add(S);
  End;
  if(Form1.TBItem36.Checked)then
  begin
    AssignFile(T, ExtractFilePath(Application.ExeName) + 'log.txt');
    If(FileExists( ExtractFilePath(Application.ExeName) + 'log.txt'))Then Begin
      Append(T);
    End Else Begin
      Rewrite(T);
    End;
    Writeln(T, '[' + TimeToStr(Time()) + '] ' + S);
    CloseFile(T);
  end;
End;

function Hexy(S: String):String;
var f: Integer;
Begin
  result:='';
  For f:=1 to Length(S) Do Begin
    result:= result + IntToHex(Ord(S[f]), 2) + ' ';
  End;
End;




procedure TForm1.MyInterceptReceive(ASender: TIdConnectionIntercept; AStream: TStream);
//var s: string;
begin
{  if(ABuffer.Size > 0)then
  begin
    SetLength(S, ABuffer.Size);
    ABuffer.Read(S[1], Length(S));
    DebugTextAdd(S);
  end;}
end;


function CommandLength(AllCommand: string): Integer;
var l : Integer;
begin
  if(Length(AllCommand)<1)then
    l:= 100 //doesn;t really matter how much
  else
    l:= Ord(AllCommand[1]);
  if(l>=160)then
  begin
    if(Length(AllCommand)>1)then
      l:= (l-160)*256 + Ord(AllCommand[2]) + 1;
  end;
  result:= l;
end;

function CmdPos(S: string): Integer;
begin
  result:= -1;
  If(Length(S)>1)and(CommandLength(S) = Length(S)-1)Then
  begin
    if(Length(S) > 2)then
          result:= 3
    else
          result:= 2;
  end;
end;



procedure EncryptCommandForServerI(var S: string);
var c1, i1, j1: Integer;
    position: Integer;
begin
      If(Length(S)>1)and(CommandLength(S) = Length(S)-1)Then
      begin
        position:= CmdPos(S);
        i1 := Ord(S[position]);
//        DebugTextAdd('cmd out, cmd='+IntToStr(i1)+', F=' + IntToStr(server_crypt_c));

        S[position] := Chr(byte(i1 + server_crypt_c));
        j1 := WeirdArrayServer[i1];
        server_crypt_b := (server_crypt_b + j1) mod Length(LongString);
        c1 := Ord(LongString[server_crypt_b + 1]);
        server_crypt_c := (server_crypt_c * 3 + c1 + j1) and $ffff;
//        DebugTextAdd('-------, cmd='+IntToStr(i1)+', F=' + IntToStr(server_crypt_c));
      end else begin
        DebugTextAdd('!!!!!!!Wrong S='+Hexy(S)+', all is lost!!!');
        TIdMappedPortThread(LastThread).Connection.Disconnect;
        LastThread:= nil;
      end;
end;


procedure TForm1.MyInterceptSend(ASender: TIdConnectionIntercept; AStream: TStream);
var
  s, O, cmd: string;
  i: Integer;
begin
  if(AStream.Size > 0)then
  begin
    O:= '';
    SetLength(S, AStream.Size);
    AStream.Read(S[1], Length(S));
    repeat
      i:= CommandLength(S);
      //DebugTextAdd('>> '+IntToStr(i)+': '+Hexy(S));
      if(Length(S)<i+1)then
        DebugTextAdd('Error, shorter command!!! '+IntToStr(i)+': '+Hexy(S));
      ASender.Disconnect;
      Cmd:= Copy(S, 1, i+1);
      EncryptCommandForServerI(Cmd);
      O:= O + Cmd;
      Delete(S, 1, i+1);
    until(S = '');
    AStream.Seek(0, soFromBeginning);
    AStream.Write(O[1], Length(O));
  end;
end;


procedure SendKeys(h: THandle; S: String; WaitTime: Integer = 0);
var f: Integer;

begin
 // h:= Form1.txtSendText.Handle;
  SendMessage(h, WM_SETFOCUS, 0, 0);
  for f:=1 to Length(S) do Begin

    SendMessage(h, WM_KEYDOWN, ord(UpCase(S[f])), $1E0001);
    SendMessage(h, WM_CHAR, ord(UpCase(S[f])), $1E0001);
    SendMessage(h, WM_CHAR, ord(UpCase(S[f])), $1E0001);
    SendMessage(h, WM_KEYUP, ord(UpCase(S[f])), $1E0001);
    Sleep(WaitTime);
  End;
end;

procedure SendArrows(h: THandle; a: Integer);
var f: Integer;
begin
  SendMessage(h, WM_SETFOCUS, 0, 0);
  f:= 0;
  if(a=0)then f:= $14B0001; //Left
  if(a=1)then f:= $1480001; //Up
  if(a=2)then f:= $14D0001; //Right
  if(a=3)then f:= $1500001; //Down
  SendMessage(h, WM_KEYDOWN, $25+a, f);
  SendMessage(h, WM_KEYUP, $25+a, Integer(LongWord(f) or $C0000000));
end;


procedure LoadSettingsFromReg;
var Reg: TRegistry;
begin
    Reg:= TRegistry.Create;
    with Reg do
    try
      RootKey:= HKEY_CURRENT_USER;
      if OpenKey('\Software\AutoRune\', False) then
      begin
        if ValueExists('ReconnectAfterDisconnects') then
          ReconnectAfterDisconnects := ReadBool('ReconnectAfterDisconnects');
        Form1.TBItem16.Checked:= ReconnectAfterDisconnects;
        if ValueExists('RSusername') then
          RSUserName := ReadString('RSusername');
        if ValueExists('RSpass') then
          RSPass := ReadString('RSpass');
        if ValueExists('WinTitle') then
          WindowTitle := ReadString('WinTitle');
        if ValueExists('ReconnectTime') then
          ReconnectTime := ReadInteger('ReconnectTime');
        if ValueExists('ReconnectTimes') then
          ReconnectTimes := ReadInteger('ReconnectTimes');
        if ValueExists('RSPath') then
          Form1.OpenDialog2.InitialDir:= Application.ExeName;
        If ValueExists('TraceMode') then begin
          Case ReadInteger('TraceMode') of
            0: Form1.TBItem17Click(Form1.TBItem17);
            1: Form1.TBItem17Click(Form1.TBItem18);
            2: Form1.TBItem17Click(Form1.TBItem19);
          end;
        end;
        if(ValueExists('ShowMinimap'))then
        begin
          MustShowMinimap:= ReadBool('ShowMinimap');
        end;

      end;
    finally
      Free;
    end;
end;

procedure SaveSettingsToReg;
var Reg: TRegistry;
begin
    Reg:= TRegistry.Create;
    with Reg do
    try
      RootKey:= HKEY_CURRENT_USER;
      if OpenKey('\Software\AutoRune\', True) then
      begin
        WriteBool('ReconnectAfterDisconnects', ReconnectAfterDisconnects);
        WriteString('RSusername', RSUserName);
        WriteString('RSpass', RSPass);
        WriteString('WinTitle', WindowTitle);
        WriteInteger('ReconnectTime', ReconnectTime);
        WriteInteger('ReconnectTimes', ReconnectTimes);
        WriteString('RSPath', Form1.OpenDialog2.InitialDir);
        If(Form1.TBItem17.Checked)Then WriteInteger('TraceMode', 0);
        If(Form1.TBItem18.Checked)Then WriteInteger('TraceMode', 1);
        If(Form1.TBItem19.Checked)Then WriteInteger('TraceMode', 2);
        WriteBool('ShowMinimap', frmMap.Visible);
      end;
    finally
      Free;
    end;
end;

procedure SaveScreenshot(FileName: String; Handle: Cardinal);
var DCDesk: HDC; // hDC of Desktop
  bmp: TBitmap;
begin
  {Create a bitmap}
  bmp := TBitmap.Create;


  {Set a bitmap sizes}
  bmp.Height := 345;
  bmp.Width := 525;

  {Get a desktop DC handle - handle of a display device context}
  DCDesk := GetWindowDC(Handle);

  {Copy to any canvas, here canvas of an image}
  BitBlt(bmp.Canvas.Handle, 0, 0, Screen.Width, Screen.Height,
         DCDesk, 0, 0, SRCCOPY);

  {Save the bitmap}
  bmp.SaveToFile(FileName);

  {Release desktop DC handle}
  ReleaseDC(GetDesktopWindow, DCDesk);

  {Release a bitmap}
  bmp.Free;
end;

function NextFreeFile(Name, Ext: String):String;
var f: Integer;
begin
  f:= 0;
  While(FileExists(Name + IntToStr(f) + Ext))do
    Inc(f);
  result:= Name + IntToStr(f) + Ext;
end;


function FindRSWindow(WindowItself: Boolean = false): Cardinal;
var h, h1, hs: Cardinal;
    WindowClass: string;
    f: Integer;
Begin
  if(UserHandle<>0)then
  begin
    h:= UserHandle;
  end else If(WindowTitle<>'')Then Begin
    h := FindWindow(nil, PChar(WindowTitle));
  End Else Begin
    h := FindWindow(nil, 'RuneScape - by Jagex Limited');
  End;
  h1:= h;
  if(not WindowItself)then
  begin
    While(h<>0)Do Begin
        h1:= h;
        h:= GetWindow(h, GW_Child);
        //Go through all children, see if there is Shell DocObject View
        hs:= h;
        while(hs <> 0)do
        begin
          SetLength(WindowClass,255);
          f:= GetClassName(hs, @WindowClass[1], 255);
          WindowClass:= Copy(WindowClass, 1, f);
          if(WindowClass = 'Shell DocObject View')then
          begin
            h:= hs;
            hs:= 0;
          end else begin
            hs:= GetWindow(hs, GW_HWNDNEXT);
          end;
        end;
    End;
  end;
  LastRSWindowH:= h1;
  result:= h1;
  If(h1 = 0)Then Begin
    If(WindowTitle<>'')Then Begin
      DebugTextAdd('--(error)-- AutoRune was unable to find RS client window with title '+WindowTitle);
    End Else Begin
      DebugTextAdd('--(error)-- AutoRune was unable to find RS client window');
    End;

  End;
End;


procedure ClickRSWindow(X, Y: Integer; Left: Boolean = True);
var f: Integer;
    h: THandle;
    R: TRect;
begin
  f:= y;
  f:= f shl 16;
  f:= f or x;
  h:= FindRSWindow;
  if(Form1.TBItem27.Checked)then
  begin
    if(Left)then
    begin
      SendMessage(h, WM_LBUTTONDOWN, 1, f);
      SendMessage(h, WM_LBUTTONUP, 0, f);
    end else
    begin
      SendMessage(h, WM_RBUTTONDOWN, 2, f);
      SendMessage(h, WM_RBUTTONUP, 0, f);
    end;
  end else
  begin
    GetWindowRect(h, R);
    Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE, Round((R.Left + X)* (65535 / Screen.Width)), Round((R.Top + Y) * (65535 / Screen.Height)), 0, 0);
    if(Left)then
    begin
      Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN,
        Round((R.Left + X)* (65535 / Screen.Width)), Round((R.Top + Y) * (65535 / Screen.Height)), 0, 0);
      Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP,
        Round((R.Left + X)* (65535 / Screen.Width)), Round((R.Top + Y) * (65535 / Screen.Height)), 0, 0);
    end else
    begin
      Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTDOWN,
        Round((R.Left + X)* (65535 / Screen.Width)), Round((R.Top + Y) * (65535 / Screen.Height)), 0, 0);
      Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTUP,
        Round((R.Left + X)* (65535 / Screen.Width)), Round((R.Top + Y) * (65535 / Screen.Height)), 0, 0);
    end;    
  end;
end;

procedure MoveRSMouse(X, Y: Integer);
var h: THandle;
    R: TRect;
begin
  h:= FindRSWindow;
  if(Form1.TBItem27.Checked)then
  begin
    SendMessage(h, WM_MOUSEMOVE, 0, MakeLong(X,Y));
    SendMessage(h, WM_SETCURSOR, h, $02000001);
  end else
  begin
    GetWindowRect(h, R);
    Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE, Round((R.Left + X)* (65535 / Screen.Width)), Round((R.Top + Y) * (65535 / Screen.Height)), 0, 0)
  end;
end;


function GetRSColorAt(X, Y: Integer):TColor;
var h: THandle;
    d: HDC;
begin
  h:= FindRSWindow;
  d:= GetWindowDC(h);
  result:= GetPixel(d, X, Y);
  ReleaseDC(h, d);
end;


function GetScreenColorAt(X, Y: Integer):TColor;
var h: THandle;
    d: HDC;
begin
  h:= GetDesktopWindow;
  d:= GetWindowDC(h);
  result:= GetPixel(d, X, Y);
  ReleaseDC(h, d);
end;


procedure SearchColorNormal(c: TColor; var x, y: Integer; d: HDC; xs, ys, xe, ye: Integer);
var
  x1, y1: Integer;
begin
  x:= -1;
  y:= -1;
  for x1:= xs to xe do
  begin
    for y1:= ys to ye do
    begin
      if(c = TColor(GetPixel(d, x1, y1)))then
      begin
        X:= x1;
        Y:= y1;
        Exit;
      end;
    end;
  end;
end;

procedure SearchColorSpiral(c: TColor; var x, y: Integer; d: HDC; xs, ys, xe, ye: Integer);
var
  dir, len, cur: Integer;
begin
  dir:= 0;
  len:= 1;
  if(c = TColor(GetPixel(d, x, y)))then
    Exit;
  repeat
    for cur:= 1 to len do
    begin
      case dir of
        0: y:= y - 1;
        1: x:= x + 1;
        2: y:= y + 1;
        3: x:= x - 1;
      end;
      if(c = TColor(GetPixel(d, x, y)))then
        Exit;
    end;
    dir:= (dir + 1) mod 4;
    if(dir mod 2 = 0) then
      inc(len);
  until(x<xs)or(y<ys)or(x>xe)or(y>ye);
  if(c <> TColor(GetPixel(d, x, y)))then
  begin
    x:= -1;
    y:= -1;
  end else
  begin
  end;
end;


procedure FindRSColor(c: TColor; var X, Y: Integer; how: Integer; xs:Integer = -1; xe:Integer = -1; ys:Integer = -1; ye:Integer = -1);
var h: THandle;
    d: HDC;
    R: TRect;
 //   B: TBitmap;

begin
  h:= FindRSWindow;
  d:= GetWindowDC(h);
  GetWindowRect(h, R);
  if(xs = -1)then
    xs:= 0;
  if(ys = -1)then
    ys:= 0;
  if(xe = -1)then
    xe:= R.Right-R.Left + 1;
  if(ye = -1)then
    ye:= R.Bottom - R.Top + 1;
  if(how=0)then
  begin
    SearchColorNormal(c, x, y, d, xs, ys, xe, ye);
  end else
  begin
    SearchColorSpiral(c, x, y, d, xs, ys, xe, ye);
  end;
  ReleaseDC(h, d);
{  B:= TBitmap.Create;
  B.Width:= R.Right-R.Left + 1;
  B.Height:= R.Top - R.Bottom + 1;
  BitBlt(B.Canvas.Handle, 0, 0, B.Width, B.Height, d, 0, 0, SRCCOPY);
  B.Free;}
end;


procedure LogInRSClient(User, Pass: String);
var h: THandle;
begin
  h:= FindRSWindow;
  If(h<>0)Then Begin
    SendMessage(h, WM_SETFOCUS, 0, 0);
    SendMessage(h, WM_LBUTTONDOWN, 1, $011501D1);
    SendMessage(h, WM_LBUTTONUP, 0, $011501D1);
    Sleep(1000);
    SendMessage(h, WM_LBUTTONDOWN, 1, $01130131);
    SendMessage(h, WM_LBUTTONUP, 0, $01130131);
    Sleep(1000);
    SendKeys(h, User + #9 + Pass + #13, 20);
  End;
end;

function EncipherKaitMeth(k1, k2: Byte; S: String):String;
var f: Integer;
    c: Char;
    OldS: String;
    b: Byte;
begin
  OldS:= S;

  result:= '';
  if(k1 = 0)and(k2 = 0)and(k1 = k2)Then Exit;

  For f:=1 To 8 do begin
    if(f*2 < Length(S))then Begin
      b:= (k1 shr (f-1));
      if(( b and 1) = 1)Then Begin
        c:= S[f*2-1];
        S[f*2-1]:= S[f*2];
        S[f*2]:= c;
      End;
    End;
  end;

  For f:=1 To 8 do begin
    if(f*2+1 < Length(S))then Begin
      b:= (k2 shr (f-1));
      if((b and 1) = 1)Then Begin
        c:= S[f*2+1];
        S[f*2+1]:= S[f*2];
        S[f*2]:= c;
      End;
    End;
  end;

  For f:= 1 to Length(S) do Begin
    S[f]:= Chr(Ord(S[f]) xor k1 xor k2);
  End;

  Result:= S;
end;

function EncipherKaitMethDummy(k1, k2: Byte; S: String):String;
var f: Integer;
    c: Char;
    OldS: String;
    b: Byte;
begin
  OldS:= S;

  result:= '';
  if(k1 = 0)and(k2 = 0)and(k1 = k2)Then Exit;

  For f:=1 To 8 do begin
    if(f*2 < Length(S))then Begin
      b:= (k1 shr (f-1));
      if(( b and 1) = 1)Then Begin
        c:= S[f*2-1];
        S[f*2-1]:= S[f*2];
        S[f*2]:= c;
      End;
    End;
  end;

  For f:=1 To 8 do begin
    if(f*2+1 < Length(S))then Begin
      b:= (k2 shr (f-1));
      if((b and 1) = 1)Then Begin
        c:= S[f*2+1];
        S[f*2+1]:= S[f*2];
        S[f*2]:= c;
      End;
    End;
  end;

  For f:= 1 to Length(S) do Begin
    S[f]:= Chr(Ord(S[f]) xor k1 xor k2);
  End;

  Result:= S;
end;


function ChecksumKaitMeth2(k: Word; S: String): Word;
var f: Integer;
begin
  result:= 0;
  for f:= 1 to length(S) do begin
    result:= Word(result + sqr(Ord(S[f]) + k));
  end;
end;

function EncipherKaitMeth2(k: Word; S: String): String;
var f: Integer;
begin
  result:= '';
  for f:= 1 to Length(S) do begin
    result:= result + char(sqr(Ord(S[f]) + k));
  end;
  

end;




Function SaXoro(s, key: String):String;
var n, f: Integer;
Begin
    n := 1;
    For f := 1 to length(s) do begin
        if(s[f]<>key[n])Then
        Begin
            s[f]:= Chr(ord(s[f]) Xor ord(key[n]));
        End;
        n := n + 1;
        If (n > Length(key)) Then
        Begin
             n := 1;
        End;
    end;
    result:= s;
End;

//Function that encrypts everything to ASCII
Function Encrypt(S: String):String;
Const chars = 'KECTDPOSWNMFGQHL';
Var s1, s2: String;
    F, ff, f1, f2: Integer;
Begin

    s1 := '';
    s2 := '';
    For F := 1 To Length(S) Do Begin
        ff := ord(S[F]);

        f1 := ff and 15;

        f2 := ff and (255-15);
        f2 := f2 shr 4;
        s1 := s1 + chars[f1+1];
        s2 := s2 + chars[f2+1];

    End;
    result:=  s2[2] + s1 + s2;
End;


//Decrypt what is encrypted with Encrypt()
Function Decrypt(S: String): String;
Const chars = 'KECTDPOSWNMFGQHL';
Var S1: String;
    f, f1, f2, ff: Integer;
Begin

    S := Copy(S, 2, Length(S));
    s1 := '';
    For F := 1 To Length(S) div 2 do
    Begin
        f1 := Pos( S[F], chars) - 1;
        f2 := Pos( S[Length(S) div 2 + F], chars) - 1;

        f2 := f2 shl 4;
        ff := f1 or f2;
        s1 := s1 + Chr(ff);

    End;
    result:= s1;
End;

function EncryptEx(k1, k2: Byte; key, S: String):String;
Begin
  S:= EncipherKaitMeth(k1, k2, S);
  S:= SaXoro(S, key);
  S:= Encrypt(S);
  result:= S;
End;




function MakeWord(a, b:Byte):Word;
Begin
  result:= a;
  result:= result shl 8;
  result:= result or b;
End;

function MakeLong(a, b, c, d:Byte):Cardinal;
Begin
  result:= a;
  result:= result shl 8;
  result:= result or b;
  result:= result shl 8;
  result:= result or c;
  result:= result shl 8;
  result:= result or d;
End;

function MakeLongLong(a, b, c, d, e, f, g, h:Byte):Int64;
Begin
  result:= a;
  result:= result shl 8;
  result:= result or b;
  result:= result shl 8;
  result:= result or c;
  result:= result shl 8;
  result:= result or d;
  result:= result shl 8;
  result:= result or e;
  result:= result shl 8;
  result:= result or f;
  result:= result shl 8;
  result:= result or g;
  result:= result shl 8;
  result:= result or h;
End;


function MakeWordC(a, b:Char):Word;
Begin
  result:= MakeWord(ord(a), ord(b));
End;

function MakeLongC(a, b, c, d:Char):Cardinal;
Begin
  result:= MakeLong(ord(a), ord(b), ord(c), ord(d));
End;

function MakeLongLongC(a, b, c, d, e, f, g, h: Char):Int64;
begin
  result:= MakeLongLong(ord(a), ord(b), ord(c), ord(d), ord(e), ord(f), ord(g), ord(h));
end;

function CorrectCase(var S, cmd:String):Boolean;
var f: Integer;
begin
  result:= False;
  for f:=Low(Commands) to High(Commands) do begin
    if(Copy(lowercase(S),1,Length(Commands[f])) = lowercase(Commands[f]))and(S[Length(Commands[f])+1] = '(')Then Begin
      S:= Commands[f] + Copy(S, Length(Commands[f])+1, Length(S));
      cmd:= Commands[f];
      result:= true;
      Break;
    End;
  end;
end;


function DecompressCoords(a, b, c: Byte):String;
var X, Y: Word;
Begin
  X:= a;        //aaaaaaaa bbbbbbbb cccccccc
  X:= X shl 3;  //xxxxxxxx xxxyyyyy yyyyyyyy
  X:= X or Byte((b and $E0) shr 5);
  Y:= b and $1F;
  Y:= Y shl 8;
  Y:= Y or c;
  MyX:= X;
  MyY:= Y;
  if(MyX <> LastX)or(MyY <> LastY)then
    TimeOnPlace:= 0;
  result:= IntToStr(X) + ',' + IntToStr(Y);
End;

procedure ChangeToCheatCoords(var a, b, c: Char);
begin
  c:= Chr(CheatCoordY and $FF);
  b:= Chr((CheatCoordY shr 8) and $1F);
  a:= Chr((CheatCoordX shr 3) and $FF);
  b:= Chr(Ord(b) or ((CheatCoordX and $07) shl 5));
end;

Procedure PutInVarStack(X: Integer);
Begin
  If(not Stopped)Then Begin
    SPVar:= SPVar + 1;
    If(SPVar>High(VarStack))Then Begin
      SPVar:= Low(VarStack);
    End;
    VarStack[SPVar]:= X;
  End;
End;


Procedure PutInRetStack(X: Integer);
Begin
  If(not Stopped)Then Begin
    SPRet:= SPRet + 1;
    If(SPRet > High(RetStack))Then Begin
      SPRet:= Low(RetStack);
    End;
    RetStack[SPRet]:= X;
  End;
End;

Procedure PutInERetStack(X: Integer);
Begin
  If(not Stopped)Then Begin
    SPERet:= SPERet + 1;
    If(SPERet > High(ERetStack))Then Begin
      SPERet:= Low(ERetStack);
    End;
    ERetStack[SPERet]:= X;
  End;
End;

procedure ResetVarsEvents;
Begin
    FillChar(Vars, SizeOf(Vars), 0);
    FillChar(Timers, SizeOf(Timers), 0);
    OnItemLost:= -1;
    OnItemGained:= -1;
    OnServerMessage:= -1;
    OnPrivateMessage:= -1;
    OnCoordsChanged:= -1;
    OnDestinationReached:= -1;
    OnIdle:= -1;
    OnHPChanged:= -1;
    OnStatsChanged:= -1;
    OnChatMessage:= -1;
    OnShopClosed:= -1;
    OnNPCAppeared:= -1;
    OnItemAppeared:= -1;
    OnItemDisAppeared:= -1;
    OnNPCMoved:= -1;
    OnObject:= -1;
    OnRetryDest:= -1;
    OnSkipDest:= -1;
    OnCheatDest:= -1;
    OnQuestMenuAppeared:= -1;
    OnTradeClosed:= -1;
    OnTrade1:= -1;
    OnTrade2:= -1;
    OnTradeAccept:= -1;
//K - OnLogin is special, never gets resetted    OnLogin:= -1;
    InEvent:= False;
    EventQueue:= nil;
End;

procedure MakeMoveToCoordList(Path: TPointArray; var A: TIntegerArray);
var dir, f, olddir: Integer;
begin
  A:= nil;
  dir:= -1;
//  A[0]:= Path[0].x;
//  A[1]:= Path[0].y;
  for f:= 0 to Length(Path) - 1 do
  begin
    olddir:= dir;
    if(f < Length(Path) - 1)then
    begin
      if(Path[f+1].x - Path[f].x = 1)and(Path[f+1].y - Path[f].y = 1)then
        dir := 1
      else if(Path[f+1].x - Path[f].x = 1)and(Path[f+1].y - Path[f].y = -1)then
        dir := 2
      else if(Path[f+1].x - Path[f].x = -1)and(Path[f+1].y - Path[f].y = 1)then
        dir := 3
      else if(Path[f+1].x - Path[f].x = -1)and(Path[f+1].y - Path[f].y = -1)then
        dir := 4
      else if(Path[f+1].x - Path[f].x = 1)and(Path[f+1].y - Path[f].y = 0)then
        dir := 5
      else if(Path[f+1].x - Path[f].x = -1)and(Path[f+1].y - Path[f].y = 0)then
        dir := 6
      else if(Path[f+1].x - Path[f].x = 0)and(Path[f+1].y - Path[f].y = 1)then
        dir := 7
      else if(Path[f+1].x - Path[f].x = 0)and(Path[f+1].y - Path[f].y = -1)then
        dir := 8;
    end;

    if((dir <> olddir)and(olddir<>-1))or(f>= Length(Path)-1)then
    begin
      if(Abs(Path[f].x-Path[0].x)<120)and(Abs(Path[f].y-Path[0].y)<120)then
      begin
        SetLength(A, Length(A) + 2);
        if(Length(A)<=2)then
        begin
          Path[0].x:= Path[f].x;
          Path[0].y:= Path[f].y;
          A[Length(A)-2]:= Path[f].x;
          A[Length(A)-1]:= Path[f].y;
        end else
        begin
          A[Length(A)-2]:= Path[f].x;// - ;
          A[Length(A)-2]:= A[Length(A)-2] - Path[0].x;
          A[Length(A)-1]:= Path[f].y;
          A[Length(A)-1]:= A[Length(A)-1] - Path[0].y;
        end;
      end else
      begin
        Exit;
      end;
    end;
  end;

end;


procedure MakePath(var A: BigWordArray; var Path: TPointArray; Sx, Sy: Integer);
const Directions: IntegerArray16 = (-1,-1, 1,-1, 1,1, -1,1, 0,-1, 1,0, 0,1, -1,0);
var x,y,Step,f,newx,newy: Integer;
    MonsterMap: Array[-20..20,-20..20]of Integer;
    Max: Integer;

begin

  FillChar(MonsterMap, SizeOf(MonsterMap), 0);
  for x:= Low(Monsters) to LastMonst do
  begin
    if(abs(Monsters[x].X-MyX)<20)and(abs(Monsters[x].Y-MyY)<20)then
      MonsterMap[Monsters[x].X-MyX, Monsters[x].Y-MyY]:= 1;
  end;
  for Step:= 2 to 8 do
    for x:= -19 to 19 do
    begin
      for y:= -19 to 19 do
      begin
        if(MonsterMap[x,y] = 0)and(A[x+MyX, x+MyY]>0)then
          if(MonsterMap[x-1,y-1]=Step-1)or
            (MonsterMap[x,y-1]=Step-1)or
            (MonsterMap[x+1,y-1]=Step-1)or
            (MonsterMap[x+1,y]=Step-1)or
            (MonsterMap[x+1,y+1]=Step-1)or
            (MonsterMap[x,y+1]=Step-1)or
            (MonsterMap[x-1,y+1]=Step-1)or
            (MonsterMap[x-1,y]=Step-1)then
              MonsterMap[x,y]:= Step;
      end;
    end;
  x:= Sx;
  y:= Sy;
  Step := A[x,y];
  SetLength(Path, 1);
  Path[0].x:= x;
  Path[0].y:= y;
  while(A[x,y]> 1)do
  begin
    Max:= -1;
    newx:= x;
    newy:= y;
    for f:= 0 to 7 do
    begin
      if(A[x + directions[f*2+1], y + directions[f*2+2]] = Step - 1)and
        ((((Abs(x + directions[f*2+1] - (MyX+XShift))>=20)or(Abs(y + directions[f*2+2] - (MyY+YShift))>=20))and(max<=0))or(MonsterMap[x + directions[f*2+1] - (MyX+XShift), y + directions[f*2+2] - (MyY+YShift)]>=max))
      then
      begin
        if((Abs(x + directions[f*2+1] - (MyX+XShift))>=20)or(Abs(y + directions[f*2+2] - (MyY+YShift))>=20))then
          max:= 0
        else
          max:= MonsterMap[x + directions[f*2+1] - (MyX+XShift), y + directions[f*2+2] - (MyY+YShift)];
        newx:= x + directions[f*2+1];
        newy:= y + directions[f*2+2];
      end;
    end;
    x:= newx;
    y:= newy;

    Step:= Step - 1;
    SetLength(Path, Length(Path) + 1);
    Path[Length(Path)-1].x:= x-XShift;
    Path[Length(Path)-1].y:= y-YShift;
//    DebugTextAdd('Path: ' + IntToStr(x-XShift) + ':' + IntToStr(y-YShift));
  end;
end;



procedure MakeSmallPath(var A: SmallWordArray; var Path: TPointArray; Sx, Sy: Integer);
const Directions: IntegerArray16 = (-1,-1, 1,-1, 1,1, -1,1, 0,-1, 1,0, 0,1, -1,0);
var x,y,Step,f,newx,newy: Integer;
    Max: Integer;
    MonsterMap: Array[-20..20,-20..20]of Integer;
    
begin

  FillChar(MonsterMap, SizeOf(MonsterMap), 0);
  for Step:= 2 to 8 do
    for x:= -19 to 19 do
    begin
      for y:= -19 to 19 do
      begin
        if(MonsterMap[x,y] = 0)and(A[x, x]>0)then
          if(MonsterMap[x-1,y-1]=Step-1)or
            (MonsterMap[x,y-1]=Step-1)or
            (MonsterMap[x+1,y-1]=Step-1)or
            (MonsterMap[x+1,y]=Step-1)or
            (MonsterMap[x+1,y+1]=Step-1)or
            (MonsterMap[x,y+1]=Step-1)or
            (MonsterMap[x-1,y+1]=Step-1)or
            (MonsterMap[x-1,y]=Step-1)then
              MonsterMap[x,y]:= Step;
      end;
    end;
  x:= Sx;
  y:= Sy;
  Step := A[x,y];
  SetLength(Path, 1);
  Path[0].x:= x;
  Path[0].y:= y;
  while(A[x,y]> 1)do
  begin
    Max:= -1;
    newx:= x;
    newy:= y;
    for f:= 0 to 7 do
    begin
      if(A[x + directions[f*2+1], y + directions[f*2+2]] = Step - 1)and
        ((((Abs(x + directions[f*2+1] - (0))>=20)or(Abs(y + directions[f*2+2] - (0))>=20))and(max<=0))or(MonsterMap[x + directions[f*2+1] - (0), y + directions[f*2+2] - (0)]>=max))
      then
      begin
        if((Abs(x + directions[f*2+1] - (0))>=20)or(Abs(y + directions[f*2+2] - (0))>=20))then
          max:= 0
        else
          max:= MonsterMap[x + directions[f*2+1] - (0), y + directions[f*2+2] - (0)];
        newx:= x + directions[f*2+1];
        newy:= y + directions[f*2+2];
      end;
    end;
    x:= newx;
    y:= newy;

    Step:= Step - 1;
    SetLength(Path, Length(Path) + 1);
    Path[Length(Path)-1].x:= x;
    Path[Length(Path)-1].y:= y;
//    DebugTextAdd('Path: ' + IntToStr(x-XShift) + ':' + IntToStr(y-YShift));
  end;

end;



procedure FillBigMapWithDistanceNumbers(var BigMap: BigMapArray; var A: BigWordArray; Sx, Sy, Ex, Ey: Integer; MaxStep: Integer);
var
  UR, BR, LR, RR: TRect;
  Step, x, y: Integer;
  DestReached: Boolean;
  Rec: TRect;
begin
  UR:= Rect(Ex, Ey, Ex, Ey);
  BR:= UR;
  LR:= UR;
  RR:= UR;
  Rec:= UR;
  DestReached:= False;
  Step:= 1;
  FillChar(A, SizeOf(A), 0);
  A[Ex, Ey]:= Step;
  if(Ex = SX)and(Ey = SY)then
    Exit;

//  DebugTextAdd('bigmapstart='+IntToStr(BigMap[sx, sy]));
  repeat
    Step:= Step + 1;
{    if(LR.Left > Low(BigMap))then
      LR.Left:= LR.Left - 1;
    if(LR.Right < High(BigMap))then
      LR.Right:= LR.Right + 1;
    if(RR.Left > Low(BigMap))then
      RR.Left:= RR.Left - 1;
    if(RR.Right < High(BigMap))then
      RR.Right:= RR.Right + 1;
    if(UR.Top > Low(BigMap[0]))then
      UR.Top:= UR.Top - 1;
    if(UR.Bottom < High(BigMap[0]))then
      UR.Bottom:= UR.Bottom + 1;
    if(BR.Top > Low(BigMap[0]))then
      BR.Top:= UR.Top - 1;
    if(BR.Bottom < High(BigMap[0]))then
      BR.Bottom:= UR.Bottom + 1;
    if(LR.Right >= RR.Left)then
    begin
      LR.Right:= LR.Left + (RR.Right - LR.Left) div 2;
      RR.Left:= LR.Right + 1;
    end;
    if(UR.Bottom >= BR.Top)then
    begin
      UR.Bottom:= UR.Top + (BR.Bottom - UR.Top) div 2;
      BR.Top:= UR.Bottom + 1;
    end;
    LR.Top:= UR.Bottom;
    LR.Bottom:= BR.Top;
    RR.Top:= UR.Bottom;
    RR.Bottom:= BR.Top;
    UR.Left:= LR.Right;
    UR.Right:= RR.Left;
    BR.Left:= LR.Right;
    BR.Right:= RR.Left; }


    if(Rec.Left > Low(BigMap))then
      Rec.Left:= Rec.Left - 1;
    if(Rec.Right < High(BigMap))then
      Rec.Right:= Rec.Right + 1;
    if(Rec.Top > Low(BigMap[0]))then
      Rec.Top:= Rec.Top - 1;
    if(Rec.Bottom < High(BigMap[0]))then
      Rec.Bottom:= Rec.Bottom + 1;

    for x:= Rec.Left to Rec.Right do
    begin
      for y:= Rec.Top to Rec.Bottom do
      begin
        if(A[x,y] = 0)and(BigMap[x,y]=$FF)then
        begin
          if(A[x-1,y] = Step - 1)or
            (A[x+1,y] = Step - 1)or
            ((A[x-1,y-1] = Step - 1)and((BigMap[x-1,y]=$FF)and(BigMap[x,y-1]=$FF)))or
            ((A[x+1,y-1] = Step - 1)and((BigMap[x+1,y]=$FF)and(BigMap[x,y-1]=$FF)))or
            (A[x,y+1] = Step - 1)or
            (A[x,y-1] = Step - 1)or
            ((A[x-1,y+1] = Step - 1)and((BigMap[x-1,y]=$FF)and(BigMap[x,y+1]=$FF)))or
            ((A[x+1,y+1] = Step - 1)and((BigMap[x+1,y]=$FF)and(BigMap[x,y+1]=$FF)))
          then
          begin
            A[x,y]:= Step;
            if(x = Sx)and(y = Sy)then
              DestReached:= True;
          end;
        end else
        if(Step > MaxStep)then
        begin
          DebugTextAdd('Dest was not reached');
          Exit;
        end;
      end;
    end;
  until(DestReached);
  DebugTextAdd('Dest reached in ' + IntToStr(Step) + ' steps');
end;


procedure FillSmallMapWithDistanceNumbers(var SmallMap: SmallMapArray; var A: SmallWordArray; Sx, Sy, Ex, Ey: Integer; MaxStep: Integer; MustReach: Boolean);
var
  UR, BR, LR, RR: TRect;
  Step, x, y: Integer;
  DestReached: Boolean;
  Rec: TRect;
begin
  UR:= Rect(Ex, Ey, Ex, Ey);
  BR:= UR;
  LR:= UR;
  RR:= UR;
  Rec:= UR;
  DestReached:= False;
  Step:= 1;
  FillChar(A, SizeOf(A), 0);
  A[Ex, Ey]:= Step;
  if(Ex = SX)and(Ey = SY)then
    Exit;

  repeat
    Step:= Step + 1;


    if(Rec.Left > Low(SmallMap))then
      Rec.Left:= Rec.Left - 1;
    if(Rec.Right < High(SmallMap))then
      Rec.Right:= Rec.Right + 1;
    if(Rec.Top > Low(SmallMap[0]))then
      Rec.Top:= Rec.Top - 1;
    if(Rec.Bottom < High(SmallMap[0]))then
      Rec.Bottom:= Rec.Bottom + 1;

    for x:= Rec.Left to Rec.Right do
    begin
      for y:= Rec.Top to Rec.Bottom do
      begin
        if(A[x,y] = 0)and(SmallMap[x,y]=$FF)then
        begin
          if(A[x-1,y] = Step - 1)or
            (A[x+1,y] = Step - 1)or
            ((A[x-1,y-1] = Step - 1)and((SmallMap[x-1,y]=$FF)and(SmallMap[x,y-1]=$FF)))or
            ((A[x+1,y-1] = Step - 1)and((SmallMap[x+1,y]=$FF)and(SmallMap[x,y-1]=$FF)))or
            (A[x,y+1] = Step - 1)or
            (A[x,y-1] = Step - 1)or
            ((A[x-1,y+1] = Step - 1)and((SmallMap[x-1,y]=$FF)and(SmallMap[x,y+1]=$FF)))or
            ((A[x+1,y+1] = Step - 1)and((SmallMap[x+1,y]=$FF)and(SmallMap[x,y+1]=$FF)))
          then
          begin
            A[x,y]:= Step;
            if(x = Sx)and(y = Sy)then
              DestReached:= True;
            if(not MustReach)and((x= Sx)and(Abs(y-Sy)<=1))or((y= Sy)and(Abs(x-Sx)<=1))then
              DestReached:= True;
          end;
        end else
        if(Step > MaxStep)then
        begin
          DebugTextAdd('Dest was not reached');
          Exit;
        end;
      end;
    end;
  until(DestReached);
//  DebugTextAdd('Dest reached in ' + IntToStr(Step) + ' steps');
end;



procedure FleeFromNPC(var Path: TPointArray; var Distance: Integer; JustCalculateDistance: Boolean; DestX, DestY: Integer);

const
  Directions: IntegerArray16 = (-1,-1, 0,-1, 1,-1, 1,0, 1,1, 0,1, -1,1, -1,0);
var
  Lauk: array[0..20,0..20]of Integer;
  k, i, x, y, f, max: Integer;

begin
  fillchar(Lauk, SizeOf(Lauk), 0);
  for x:= 0 to 20 do
  begin
    for y:= 0 to 20 do
    begin
      if(BigMap[MyX+XShift+x-10, MyY+YShift+y-10]<>$FF)then
        Lauk[x,y]:= -1;
    end;
  end;
  for f:= Low(Monsters) to LastMonst do
  begin
    if(Abs(Monsters[f].X-MyX)<10)and(Abs(Monsters[f].Y-MyY)<10)then
    begin
      Lauk[Monsters[f].X-MyX+10,Monsters[f].Y-MyY+10]:= 1;
    end;
  end;
  if(JustCalculateDistance)then
    Distance:= 255;
  //now we have objects and monsters marked on map
  try
  for f:= 2 to 30 do
  begin
    for x:= 1 to 19 do
    begin
      for y:= 1 to 19 do
      begin
        if(Lauk[x,y] = 0)then
        begin
          if((Lauk[x-1,y-1]=f-1)and((JustCalculateDistance)or((Lauk[x-1,y]<>-1)and(Lauk[x,y-1]<>-1))))or
            (Lauk[x,y-1]=f-1)or
            ((Lauk[x+1,y-1]=f-1)and((JustCalculateDistance)or((Lauk[x+1,y]<>-1)and(Lauk[x,y-1]<>-1))))or
            (Lauk[x+1,y]=f-1)or
            ((Lauk[x+1,y+1]=f-1)and((JustCalculateDistance)or((Lauk[x+1,y]<>-1)and(Lauk[x,y+1]<>-1))))or
            (Lauk[x,y+1]=f-1)or
            ((Lauk[x-1,y+1]=f-1)and((JustCalculateDistance)or((Lauk[x-1,y]<>-1)and(Lauk[x,y+1]<>-1))))or
            (Lauk[x-1,y]=f-1)then
          begin
            Lauk[x,y]:= f;
            if(JustCalculateDistance)and(x=10)and(y=10)then
              Distance:= f-1;
          end;
        end;
      end;
    end;
  end;
  except
    DebugTextAdd('Range error in filling with nums');
  end;
  Path:= nil;
  SetLength(Path, distance);
  x:= 10;
  y:= 10;
  if(not JustCalculateDistance)then
  begin
    for f:= 0 to distance-1 do
    begin
      max:= -1;
      i:= 0;
      if(destx<= MyX)and(desty <= MyY)then
        i:= 7;
      if(destx>= MyX)and(desty <= MyY)then
        i:= 1;
      if(destx>= MyX)and(desty >= MyY)then
        i:= 3;
      if(destx<= MyX)and(desty >= MyY)then
        i:= 5;
//      DebugTextAdd('i = ' + IntToStr(i));

      try
      for k:= 0 to 7 do
      begin
        if(x+directions[i*2+1] >= 0)and(y+directions[i*2+2] >= 0)and(x+directions[i*2+1] <= 20)and(y+directions[i*2+2] <= 20)then
          if(Lauk[x+directions[i*2+1],y+directions[i*2+2]]>max)then
          begin
            if(directions[i*2+1] = 0)or(directions[i*2+2]=0)
              or((Lauk[x+directions[i*2+1],y]>0)and(Lauk[x,y+directions[i*2+2]]>0))
            then
            begin
              Path[f].x:= x+directions[i*2+1];
              Path[f].y:= y+directions[i*2+2];
              max:= Lauk[x+directions[i*2+1],y+directions[i*2+2]];
            end;
          end;
        i:= i + 1;
        if(i > 7)then
          i:= 0;
      end;

      x:= Path[f].x;
      y:= Path[f].y;
      Path[f].x:= Path[f].x + MyX - 10;
      Path[f].y:= Path[f].y + MyY - 10;
      except
        DebugTextAdd('Range error in extracting path');
      end;
    end;
  end;
end;



function IsInInventory(i: Integer):Boolean;
var
  f: Integer;
Begin
  result:= False;
  For f:= Low(Items) To High(Items) Do Begin
    if(i = Items[f])Then result:= true;
  End;
End;

function CountInInventory(i: Integer):Integer;
var
  f: Integer;
Begin
  result:= 0;
  For f:= Low(Items) To High(Items) Do Begin
    if(i = Items[f])Then result:= result + ItemCounts[f];
  End;
End;

function CountInShop(i: Integer):Integer;
var f: Integer;
Begin
  result:= 0;
  For f:= Low(ShopItems) To High(ShopItems) Do Begin
    if(i = ShopItems[f])Then result:= result + ShopItemCounts[f];
  End;
End;


function ModInShop(i: Integer):Integer;
var f: Integer;
Begin
  result:= 0;
  For f:= Low(ShopItems) To High(ShopItems) Do Begin
    if(i = ShopItems[f])Then result:= ShopItemMod[f];
  End;
End;

function InventoryPos(i: Integer):Integer;
var
  f: Integer;
Begin
  result:= -1;
  For f:= Low(Items) To High(Items) Do Begin
    if(i = Items[f])Then result:= f;
  End;
End;

procedure ClearItems;
var f: Integer;
begin
  For f:=Low(Items) To High(Items) Do Begin
    Items[f]:= -1;
    ItemCounts[f]:= 0;
  End;
end;

procedure ClearShop;
var f: Integer;
begin
  For f:=Low(ShopItems) To High(ShopItems) Do Begin
    ShopItems[f]:= -1;
    ShopItemCounts[f]:= 0;
  End;
end;


function FindObj(X, Y: Integer):Integer;
var f: Integer;
begin
  result:= 0;
  For f:= Low(VisibleObjects) To High(VisibleObjects) Do Begin
    If(VisibleObjects[f].Coord.X = X)and(VisibleObjects[f].Coord.Y = Y)and(VisibleObjects[f].Obj>0)and(VisibleObjects[f].Obj<3000) Then
    Begin
      result:= VisibleObjects[f].Obj;
    End;
  End;
end;

procedure NewObj(Obj, X, Y: Integer; Params: array of Integer);
var
  f: Integer;
  Found, Alt: Integer;
  b: Boolean;
begin
  Found:= -1;
  Alt:= -1;
  If(SelObj < 1) Then SelObj:= 1;
  For f:= Low(VisibleObjects) To High(VisibleObjects) Do Begin
    If(VisibleObjects[f].Coord.X = X)and(VisibleObjects[f].Coord.Y = Y) Then
    Begin
      Found:= f;
    end else if(VisibleObjects[f].Obj=0)then
    begin
      if(Alt = -1)then
        Alt:= f;
    End Else If(Abs(VisibleObjects[f].Coord.X - MyX)>objDisC)or(Abs(VisibleObjects[f].Coord.Y - MyY)>objDisC)Then
    Begin
      VisibleObjects[f].Coord.X:= -60;
      VisibleObjects[f].Obj:= 0;
    End;
  End;

  if(Found = -1)then
    Found:= Alt;

  If(Found = -1)Then Begin
    SelObj:= SelObj + 1;
    If(SelObj > High(VisibleObjects))Then SelObj:= 1;
    Found:= SelObj;
  End;
  If(Obj < 3000)and(Obj>=0)Then Begin
    b:= False;
    if(Length(Params) > 3)then
    begin
      for f:= 2 to High(Params) do
      begin
        if(VisibleObjects[Found].Obj = Params[f])then
          b:= True;
      end;
    end;
    if(not b)then
      VisibleObjects[Found].Obj:= Obj;
    VisibleObjects[Found].Coord.X:= X;
    VisibleObjects[Found].Coord.Y:= Y;
  End;
end;

function ObjAt(x, y: Integer): Integer;
var
  f: Integer;
begin
  result:= 0;
  For f:= Low(VisibleObjects) to High(VisibleObjects)Do Begin
    If(X=VisibleObjects[f].Coord.X)and(Y=VisibleObjects[f].Coord.Y)and(VisibleObjects[f].Obj>0)and(VisibleObjects[f].Obj<$8000)Then Begin
      result:= VisibleObjects[f].Obj;
      break;
    End;
  End;
end;


procedure DisplayObjs(Act: TIntegerArray; Dx, Dy: Integer);
var T: array[1..20]of String[20];
    f: Integer;
    x, y, Ax, Ay: Integer;
Begin
  For f:= 1 to 20 Do Begin
    T[f]:= '                    ';
  End;
  T[10,10]:= 'X';
  If(Length(Act)>0)Then Begin
    For f:= 0 to (Length(Act)-1) div 2 Do
    Begin
      Ax:= Act[f*2];
      Ay:= Act[f*2+1];
      If(Abs(Ax)<10)and(Abs(Ay)<10)Then
        T[10-Ay][10-Ax]:= '.';
    End;
  End;
  Dx:= Dx - MyX;
  Dy:= Dy - MyY;
  For f:= Low(VisibleObjects) to High(VisibleObjects)Do Begin
    x:= VisibleObjects[f].Coord.X - MyX;
    y:= VisibleObjects[f].Coord.Y - Myy;
    If(Abs(X)<10)and(Abs(Y)<10)and(VisibleObjects[f].Obj>0)and(VisibleObjects[f].Obj<$8000)Then Begin
      If(VisibleObjects[f].Obj = 110)Then
        T[10-y][10-x]:= 'o'
      Else
        T[10-y][10-x]:= 'q';
    End;
  End;
  If(Abs(Dx)<10)and(Abs(Dy)<10)Then
    T[10-Dy][10-Dx]:= 'D';
  For f:= 20 downto 1 Do Begin
    DebugTextAdd(T[f]);
  End;
End;

Function InArray(x: Integer; A: Array of Integer):Boolean;
Var
  f: Integer;
Begin
  result:= false;
  For f:= Low(A) To High(A) Do
    result:= result or (x = A[f]);
End;

procedure FindNearestRock(var X,Y: Integer; RockType: array of Integer; MaxDistance: Integer);
var
  f: Integer;
  dist, maxdist: Integer;
begin
  x:= 0;
  y:= 0;
  maxdist:= 2000;
  For f:= Low(VisibleObjects) to High(VisibleObjects)Do Begin
    If(Abs(VisibleObjects[f].Coord.X - MyX)>objDisC)or(Abs(VisibleObjects[f].Coord.Y - MyY)>objDisC)Then
    Begin
      VisibleObjects[f].Coord.X:= -60;
    End;
    If(Abs(VisibleObjects[f].Coord.X - MyX)<=MaxDistance)or(Abs(VisibleObjects[f].Coord.Y - MyY)<=MaxDistance)Then
    Begin
      If(InArray(VisibleObjects[f].Obj, RockType))Then Begin
        dist:= Max(Abs(VisibleObjects[f].Coord.X - MyX),Abs(VisibleObjects[f].Coord.Y - MyY));
        If(dist < maxdist)Then Begin
          X:= VisibleObjects[f].Coord.X;
          Y:= VisibleObjects[f].Coord.Y;
          maxdist:= dist;
        End;
      End;
    End;
  End;
end;

procedure ApproachCoords(var X, Y: Integer; MyX, MyY: Integer; CanBeMyCoords: Boolean);
Var NewX, NewY: Integer;
Begin
  NewX:= X;
  NewY:= Y;
  If(X<>MyX)Then Begin
    NewX:= NewX + (MyX - X) div Abs(MyX - X);
  End;
  If(Y<>MyY)Then Begin
    NewY:= NewY + (MyY - Y) div Abs(MyY - Y);
  End;
  If(MyX <> NewX) or (MyY <> NewY) or (CanBeMyCoords) Then Begin
    X:=  NewX;
    Y:=  NewY;
  End;
End;


function FindNPCTypeByID(ID: Integer):Integer;
var f: Integer;
begin
  result:= -1;
  For f:= Low(Monsters) To LastMonst Do Begin
    if(Monsters[f].ID = ID)Then Begin
      result:= Monsters[f].tips;
      break;
    End;
  End;
end;

procedure FindNPCCoordsByID(var x,y: Integer; ID: Integer);
var f: Integer;
begin
  x:= 0;
  y:= 0;
  For f:= Low(Monsters) To LastMonst Do Begin
    if(Monsters[f].ID = ID)Then Begin
      x:= Monsters[f].X;
      y:= Monsters[f].Y;
      break;
    End;
  End;
end;


procedure LoadWords;
var f, r, c: Integer;
    t: file of byte;
    a: array[0..30000]of byte;
begin
  iib:= nil;
  AssignFile(t, 'RSwords.txt');
  Reset(t);
  BlockRead(t, a, sizeof(a), r);
  CloseFile(t);
  c:= 0;
  SetLength(iib, 1);
  for f:= 0 to r-1 do
  begin
    if(a[f] = 0)then
    begin
      c:= c + 1;
      SetLength(iib, c + 1);
    end else begin
      iib[c]:= iib[c] + Chr(a[f]);
    end;
  end;
end;



procedure FindNearestNPC(var x,y,ID: Integer; x1,y1,x2,y2: Integer; Aid: TIntegerArray; NonFighting: Boolean; Rand: Boolean);
var f: Integer;
    lastdist: Integer;
begin
  x:= 0;
  y:= 0;
  ID:= -1;
  lastDist:= 200;
  If(not Rand)Then Begin
    For f:= Low(Monsters) To LastMonst Do Begin
      If(InArray(Monsters[f].tips, Aid))or(Aid=nil)Then Begin
        If((Abs(Monsters[f].x-MyX)<lastDist)and(Abs(Monsters[f].y-MyY)<lastDist))and((not NonFighting)or(not Monsters[f].Fighting))Then Begin

          If(Monsters[f].X >= Min(x1,x2))and(Monsters[f].X <= Max(x1,x2))and(Monsters[f].Y >= Min(y1,y2))and(Monsters[f].Y <= Max(y1,y2))Then
          Begin
            lastDist:= Max(Abs(Monsters[f].x-MyX),Abs(Monsters[f].y-MyY));
            x:= Monsters[f].X;
            y:= Monsters[f].Y;
            ID:= Monsters[f].ID;
          End;
        End;
      End;
    End;
  End Else Begin
    lastdist:= 0;
    While(lastdist<5*LastMonst)and(ID=-1)do begin
      lastdist:= lastdist + 1;
      f:= Random(LastMonst - Low(Monsters)) + Low(Monsters);
      If(InArray(Monsters[f].tips, Aid))Then Begin
        If((not NonFighting)or(not Monsters[f].Fighting))Then Begin
          x:= Monsters[f].X;
          y:= Monsters[f].Y;
          ID:= Monsters[f].ID;
        End;
      End;
    End;
  End;
end;





procedure NormalizeActionArray(var Act: TIntegerArray);
var NewA: TIntegerArray;
    f: Integer;
    firstX, firstY: Integer;
    x, y, lx, ly: Integer;
begin
  NewA:= nil;
  firstX:= 0;
  firstY:= 0;
  x:= 0;
  y:= 0;
  LastServerMessage:= 'Act: ';
  for x:= 0 to Length(Act)-1 do
    LastServerMessage:= LastServerMessage + IntToStr(Act[x]) + ' ';
  DebugTextAdd(LastServerMessage);
  x:= 0;

  If(Length(act)>0)Then Begin
    For f:= (Length(Act)-1) div 2 downto 0 do begin
      lx:= x;
      ly:= y;
      If(firstX=0)Then Begin
        firstX:= Act[f*2] + MyX;
        firstY:= Act[f*2+1] + MyY;
        x:= firstX;
        y:= firstY;
      End Else Begin
        x:= Act[f*2] + MyX - firstX;
        y:= Act[f*2+1] + MyY - firstY;
      End;
      If(x <> lx) or (y <> ly)Then Begin
        if(X<>0)or(Y<>0)then
        begin
          SetLength(NewA, Length(NewA) + 2);
          NewA[Length(NewA)-2]:= X;
          NewA[Length(NewA)-1]:= Y;
        end;
      End;
    end;
  End;
  If(Length(NewA) = 0)Then Begin
    SetLength(NewA, Length(NewA) + 2);
    NewA[Length(NewA)-2]:= MyX;
    NewA[Length(NewA)-1]:= MyY;
  End;
  Act:= NewA;
  LastServerMessage:= 'NeA:';
  for x:= 0 to Length(NewA)-1 do
    LastServerMessage:= LastServerMessage + IntToStr(NewA[x]) + ' ';
  DebugTextAdd(LastServerMessage);

end;


Procedure GetActionPoint(MyX, MyY: Integer; Var Act: TIntegerArray; Dx, Dy: Integer;
                         MaxDistance: Integer; MustReach: Boolean);
Var A: array[-20..20,-20..20]of Boolean;
    f, f1: Integer;
    x, y, lx, ly: Integer;
    Sx, Sy, lsx, lsy: Integer;
    SmallMap: SmallMapArray;
    firstMove: Boolean;
    DistNums: SmallWordArray;
    MapPath: TPointArray;
    S: string;

Begin

  for x:= -20 to 20 do
  begin
    for y:= -20 to 20 do
    begin
      if(ObjAt(x+MyX,y+MyY)>0)then
        SmallMap[x,y]:= 1
      else
        SmallMap[x,y]:= $FF;
    end;
  end;
  FillSmallMapWithDistanceNumbers(SmallMap, DistNums, 0, 0, Dx - MyX, Dy - MyY, 30, MustReach);

  MakeSmallPath(DistNums, MapPath, 0, 0);
  for x:= 0 to Length(MapPath)-1 do
  begin
    MapPath[x].x:= MapPath[x].x + MyX;
    MapPath[x].y:= MapPath[x].y + MyY;
  end;

  Act:= nil;
  MakeMoveToCoordList(MapPath, Act);

//  DisplayObjs(Act, Dx, Dy);
End;

{procedure DisappearsItem(Item: Integer; X, Y: Integer);
var f: Integer;
begin
  f:= 0;
  While(f>0)and(not ((X=VisibleItems[f].Coord.X)and(Y=VisibleItems[f].Coord.Y)and(Item=VisibleItems[f].Item)))Do Begin
    f:= f + 1;
    if(f>=High(VisibleItems))then Begin
        Exit;
    End;
  End;

  If(f>0)and(f<=High(VisibleItems))Then Begin
    VisibleItems[f].Item:= -1;
    If(f<LastFreeItem)Then LastFreeItem:= f;
  End;
end;}


{procedure TForm1.AppearsItem;
var f: Integer;
    Item, X, Y: Integer;
Begin
  Item:= NewItem;
  X:= NewItemX;
  Y:= NewItemY;
  f:= LastFreeItem;
  LastFreeItem:= LastFreeItem + 1;
  If(f>=High(VisibleItems))Then f:=0;
  if(f<0)Then f:=0;
  While(f>0)and(f<High(VisibleItems))and(VisibleItems[f].Item<>-1)Do Begin
    If(Abs(X-MyX) > objDisC)or(Abs(Y-MyY)>objDisC)Then Begin
      VisibleItems[f].Item:= -1;
    End Else Begin
      f:= f+1;
      if(f>=High(VisibleItems))then Begin
        f:= 0;
        LastFreeItem:= 1;
        Break;
      End;
    End;
  End;

  if(f>=High(VisibleItems))or(f<0)then Begin
        f:= 0;
        LastFreeItem:= 1;
  End;

  If(f<High(VisibleItems))and(f>0)Then Begin
    LastFreeItem:= f;

    VisibleItems[f].Item:= Item;
    VisibleItems[f].Coord.X:= X;
    VisibleItems[f].Coord.Y:= Y;
  End;


End;}

{function IsNearItem(Item: Integer; Distance: Integer):Boolean;
var f: Integer;
Begin
  f:= 0;
  result:= false;
  While(not result)Do Begin
    if(f>=0)and(f<High(VisibleItems))Then Begin
      result:= (VisibleItems[f].Item = Item) and (Abs(MyX - VisibleItems[f].Coord.X)<= Distance)
                                             and (Abs(MyY - VisibleItems[f].Coord.Y)<= Distance);
    End;
    f:= f+1;
    if(f>=High(VisibleItems))or(f<0)Then Begin
      Exit;
    End;
  End;
End;}


{function GetNearestItem(Item: Integer; Distance: Integer; var X, Y: Integer):Boolean;
var f: Integer;
Begin
  f:= 0;
  result:= false;
  While(f<High(VisibleItems))Do Begin
    If(VisibleItems[f].Item = Item) and (Abs(MyX - VisibleItems[f].Coord.X)<= Distance)
       and (Abs(MyY - VisibleItems[f].Coord.Y)<= Distance)Then Begin
      Distance:= Max(Abs(MyY - VisibleItems[f].Coord.Y), Abs(MyX - VisibleItems[f].Coord.X));
      X:= VisibleItems[f].Coord.X;
      Y:= VisibleItems[f].Coord.Y;
      result:= True;
    End;
    f:= f+1;
  End;
End;}






procedure DecryptCommandIn(var S: string);
var i_18_, i_19_, i_20_, i: Integer;
    position: Integer;
begin
      If(Length(S)>1)and(CommandLength(S) = Length(S)-1)Then
      begin

        position:= CmdPos(S);
        i:= Ord(S[position]);
        i_18_ := (i - server_crypt_e) and $ff;
	i_19_ := WeirdArrayClient[i_18_];
//	DebugTextAdd('In, C='+IntToStr(server_crypt_d)+', x='+IntToStr(server_crypt_e)+', k1='+intToStr(i_19_)+', i='+intToStr(i)+', v='+IntToStr(Length(LongString)));
	server_crypt_d := (server_crypt_d + i_19_) mod Length(LongString);
	i_20_:= Ord(LongString[server_crypt_d + 1]);
	server_crypt_e := (server_crypt_e * 3 + i_20_ + i_19_) and $ffff;
	S[position]:= Chr(i_18_);
//        DebugTextAdd('In, C='+IntToStr(server_crypt_d)+', x='+IntToStr(server_crypt_e)+', k1='+intToStr(i_19_)+', j1='+intToStr(i_18_)+', c1='+LongString[server_crypt_d + 1]+LongString[server_crypt_d + 2]+LongString[server_crypt_d + 3]+' '+IntToStr(i_20_));
      end else begin
        DebugTextAdd('!!!!!!!Wrong S='+Hexy(S)+', all is lost!!!');
        TIdMappedPortThread(LastThread).Connection.Disconnect;
        LastThread:= nil;
      end;
end;

procedure DecryptCommandOut(var S: string);
var i_18_, i_19_, i_20_, i: Integer;
    position: Integer;
begin
      If(Length(S)>1)and(CommandLength(S) = Length(S)-1)Then
      begin
        position:= CmdPos(S);
        i:= Ord(S[position]);
	i_18_ := (i - client_crypt_c) and $ff;
	i_19_ := WeirdArrayServer[i_18_];
	client_crypt_b := (client_crypt_b + i_19_) mod Length(LongString);
	i_20_:= Ord(LongString[client_crypt_b + 1]);
	client_crypt_c := (client_crypt_c * 3 + i_20_ + i_19_) and $ffff;
	S[position]:= Chr(i_18_);
//        DebugTextAdd('Incoming cmd ' + IntToStr(i_18_) + ', j1 = ' + IntToStr(i_19_));
      end else begin
        DebugTextAdd('!!!!!!!Wrong S='+Hexy(S)+', all is lost!!!');
        TIdMappedPortThread(LastThread).Connection.Disconnect;
        LastThread:= nil;
      end;
end;


procedure EncryptCommandForServer2(var S: string);
var c1, i1, j1: Integer;
    position: Integer;
begin
      If(Length(S)>1)and(CommandLength(S) = Length(S)-1)Then
      begin
        DebugTextAdd('cmd out, F=' + IntToStr(server_crypt_c));
        position:= CmdPos(S);
        i1 := Ord(S[position]);
        S[position] := Chr(byte(i1 + server_crypt_c));
        j1 := WeirdArrayServer[i1];
        server_crypt_b := (server_crypt_b + j1) mod Length(LongString);
        c1 := Ord(LongString[server_crypt_b + 1]);
        server_crypt_c := (server_crypt_c * 3 + c1 + j1) and $ffff;
        DebugTextAdd('-------, F=' + IntToStr(server_crypt_c));

      end else begin
        DebugTextAdd('!!!!!!!Wrong S='+Hexy(S)+', all is lost!!!');
        TIdMappedPortThread(LastThread).Connection.Disconnect;
        LastThread:= nil;
      end;
end;

function EncryptCommandForServerF2(S: string): string;
begin
  //EEE EncryptCommandForServer(S);
  result:= S;
end;

procedure EncryptCommandForClient(var S: string);
var c1, i1, j1: Integer;
    position: Integer;
begin
      If(Length(S)>1)and(CommandLength(S) = Length(S)-1)Then
      begin
        position:= CmdPos(S);
        i1 := Ord(S[position]);

        S[position] := Chr(byte(i1 + client_crypt_e));
        j1 := WeirdArrayClient[i1];
        client_crypt_d := (client_crypt_d + j1) mod Length(LongString);
        c1 := Ord(LongString[client_crypt_d + 1]);
        client_crypt_e := (client_crypt_e * 3 + c1 + j1) and $ffff;
      end else begin
        DebugTextAdd('!!!!!!!Wrong S='+Hexy(S)+', all is lost!!!');
        TIdMappedPortThread(LastThread).Connection.Disconnect;
        LastThread:= nil;
      end;
end;



function DepositEverything:String;
var ItemTypes:array[0..29]of Integer;
    ItemC: array[0..29]of Integer;
    f, x: Integer;
Begin

    result:= '';
    FillChar(ItemTypes, SizeOf(ItemTypes), -1);
    FillChar(ItemC, SizeOf(ItemC), 0);

    for f:= Low(Items) to High(Items) Do Begin
      x:= 0;
      While(ItemTypes[x]<>-1)and(ItemTypes[x]<>Items[f])Do Begin
        x:= x + 1;
      End;
      ItemTypes[x]:= Items[f];
      ItemC[x]:= ItemC[x] + ItemCounts[f];
    End;

    x:= 0;
    While(ItemTypes[x]<>-1)and(x<=High(ItemTypes))Do Begin
      repeat
        f:= 1;
        if(ItemC[x]>=2500)Then Begin
          f:= 2500;
        End Else If(ItemC[x]>=500)Then Begin
          f:= 500;
        End Else If(ItemC[x]>=100)Then Begin
          f:= 100;
        End Else If(ItemC[x]>=25)Then Begin
          f:= 25;
        End Else If(ItemC[x]>=5)Then Begin
          f:= 5;
        End Else If(ItemC[x]>=1)Then Begin
          f:= 1;
        End;
        ItemC[x]:= ItemC[x] - f;
        //EEE result:= result + EncryptCommandForServerF(WordWordCommand(ItemTypes[x], f,  #$CD));
        result:= result + WordWordCommand(ItemTypes[x], f,  #$CD);
      until(ItemC[x]=0);
      x:= x + 1;
    End;
End;


function EmptyMemo(S: TStrings): Boolean;
var f: Integer;
Begin
  result:= True;
  For f:=0 To S.Count - 1 do Begin
    If(Trim(S[f])<>'')Then Begin
      result:= False;
      Exit;
    End;
  End;
End;

Procedure CompileScript(S1: TStrings; var S2: TStrings);
var Labels, Varns: array of String;
    LabelNums, Varnums: array of Integer;
    f: Integer;
    lab, varn: Integer;
    st, len: Integer;
    lName, vName, S, cmd: String;

function ExtractLabelFromLine(S: String; var st, len: Integer):Boolean;
var f: Integer;
Begin
  f:= Pos('@', S);
  If(f < 2)Then Begin
    result:= False;
  End Else Begin
    result:= S[f-1] in [',','('];
    st:= f;
    len:= 0;
    If(result)Then Begin
      result:= False;
      while(f<Length(S))Do Begin
        len:= len + 1;
        f:= f + 1;
        If(S[f] in [',',')'])Then Begin
          result:= True;
          f:= Length(S);
        End;
      End;
    End;
  End;
End;


function ExtractVariableFromLine(S: String; var st, len: Integer):Boolean;
var f: Integer;
Begin
  f:= Pos('%', S);
  If(f < 2)Then Begin
    result:= False;
  End Else Begin
    result:= S[f-1] in [',','('];
    st:= f;
    len:= 0;
    If(result)Then Begin
      result:= False;
      while(f<Length(S))Do Begin
        len:= len + 1;
        f:= f + 1;
        If(S[f] in [',',')'])Then Begin
          result:= True;
          f:= Length(S);
        End;
      End;
    End;
  End;
End;

Function LabelNum(S: String):Integer;
var f: Integer;
Begin
  result:= -1;
  for f:= 0 to lab - 1 do begin
    if(Labels[f] = S)Then Begin
      result:= LabelNums[f];
    End;
  end;
End;

Function VariableNum(S: String):Integer;
var f: Integer;
Begin
  result:= -1;
  for f:= 0 to varn - 1 do begin
    if(Varns[f] = S)Then Begin
      result:= Varnums[f];
    End;
  end;
  if(result = -1)Then Begin
    SetLength(Varns,Length(Varns)+1);
    SetLength(Varnums,Length(Varnums)+1);
    varn:= Length(Varns)-1;
    Varns[varn]:= S;
    Varnums[varn]:= varn;
    result:= varn;
    varn:= varn + 1;
  End;
End;

procedure ChangeStringsToInts(var S: String);
var f: Integer;
    IsString, First: Boolean;
    S1: String;
begin
  IsString:= False;
  S1:= '';
  First:= True;
  For f:= 1 To Length(S) Do Begin
    If(S[f] = '"')Then Begin
      IsString:= not IsString;
    End Else If(IsString)Then Begin
      If(not First)Then Begin
        S1:= S1 + ',';
      End;
      S1:= S1 + IntToStr(Ord(S[f]));
      First:= False;
    End Else Begin
      S1:= S1 + S[f]; 
    End;
  End;
  S:= S1;
end;


Begin
  lab:= 0;
  varn:= 0;
  Labels:= nil;
  LabelNums:= nil;
  S2.Clear;
  for f:=0 To S1.Count-1 Do Begin
    S:= Trim(S1[f]);
    If(not CorrectCase(S,cmd))and(S<>'')and(not (S[1] in CommentChars))and(S[1]<>'@')Then Begin
      DebugTextAdd('---(debug)--- Unknown command '+S+' at line '+intToStr(f));
    End;
    S1[f]:= S;

    if(cmd = 'Debug')or(cmd= 'MessageBox')
    or(cmd= 'DebugRS')
    or(cmd= 'HTTPGet')
    or(cmd= 'PlaySound')
    or(cmd='SetPMReceiver')
    or(cmd='GoToIfLastServerMessageIs')
    or(cmd='GoToIfLastServerMessageIsNot')
    or(cmd='GoToIfQuestion')
    or(cmd='GoToIfInLastServerMessageIs')
    or(cmd='GoToIfInLastServerMessageIsNot')
    or(cmd='GoToIfLastChatMessageIs')
    or(cmd='GoToIfLastChatMessageIsNot')
    or(cmd='GoToIfInLastChatMessageIs')
    or(cmd='GoToIfInLastChatMessageIsNot')
    or(cmd='GoToIfLastHTTPResponseIs')
    or(cmd='GoToIfLastHTTPResponseIsNot')
    or(cmd='GoToIfInLastHTTPResponseIs')
    or(cmd='GoToIfInLastHTTPResponseIsNot')
    or(cmd='GoToIfLastPMIs')
    or(cmd='GoToIfLastPMIsNot')
    or(cmd='GoToIfInLastPMIs')
    or(cmd='GoToIfInLastPMIsNot')
    or(cmd='SetVarPlayerByName')
    or(cmd='SendKeys')Then Begin
      ChangeStringsToInts(S);
    End;
    if(cmd = 'Say')Then Begin
      S:= '"' + HexToStr(Copy(S,5,Length(S)-5)) + '"';
      ChangeStringsToInts(S);
      S:= 'SayInt(' + S + ')';
    End;
    if(cmd = 'PM')Then Begin
      S:= '"' + HexToStr(Copy(S,5,Length(S)-5)) + '"';
      ChangeStringsToInts(S);
      S:= 'PMInt(' + S + ')';
    End;
    if(cmd = 'Hex')Then Begin
      S:= '"' + HexToStr(Copy(S,5,Length(S)-5)) + '"';
      ChangeStringsToInts(S);
      S:= 'HexInt(' + S + ')';
    End;

    S2.Add(S);
    If(S2[f]<>'')Then Begin
      If(S2[f][1] = '@')and(S2[f][Length(S2[f])] = ':')Then Begin
        //It's a label, let's remember its line number
        SetLength(Labels, lab + 1);
        SetLength(LabelNums, lab + 1);
        Labels[lab]:= Copy(S2[f], 1, Length(S2[f]) - 1);
        LabelNums[lab]:= f;
        S2[f]:= '-' + S2[f];
        lab:= lab + 1;
      End;
    End;
  End;
  for f:= 0 To S2.Count - 1 Do Begin
    If(S2[f]<>'')Then Begin
      //Convert labels to number of lines to skip
      While(ExtractLabelFromLine(S2[f],st,len))Do Begin
        lName:= Copy(S2[f], st, len);
        S:= S2[f];
        Delete(S,st,len);
        If(LabelNum(lName) = -1)Then Begin
          DebugTextAdd('---(debug)--- Invalid label ' + lName + ' at line ' + IntToStr(f));
        End;
        If(Length(S)>1)and(S[1]='O')and(S[2]='n')Then Begin
          Insert(IntToStr(LabelNum(lName)),S,st);
        End Else Begin
          Insert(IntToStr(LabelNum(lName) - f - 1),S,st);
        End;
        S2[f]:= S;
      End;
      
      //Convert variable names to variable numbers
      While(ExtractVariableFromLine(S2[f],st,len))Do Begin
        vName:= Copy(S2[f], st, len);
        S:= S2[f];
        Delete(S,st,len);
        Insert('v'+IntToStr(VariableNum(vName)),S,st);
        S2[f]:= S;
      End;
    End;
  End;
  If(not EmptyMemo(S2))Then Begin
    S2.Add('--- End');
  End;
End;

procedure AddNewEvent(num, param1, param2, param3, param4, param5: Integer);
var f: Integer;
begin
  f:= Length(EventQueue);
  SetLength(EventQueue, f + 1);
  EventQueue[f].num:= num;
  EventQueue[f].params[1]:= param1;
  EventQueue[f].params[2]:= param2;
  EventQueue[f].params[3]:= param3;
  EventQueue[f].params[4]:= param4;
  EventQueue[f].params[5]:= param5;
end;



Procedure SetLoggedIn(b: Boolean);
Begin
  LoggedIn:= b;
  if(b)Then Begin
    DebugTextAdd('---(connection)--- Logged In '+ TimeToStr(Time));
    If(WasOnWhenDisconnected)Then Begin
      //In case script was stopped, we should fire it up again
      If(WaitTime=0)and(DestX=0)Then Begin
        WaitTime:=1;
      End;
    End;
    TimeSincePing:= 0;
    TriesLeft:= ReconnectTimes;
    DynReconnectTime:= ReconnectTime * 60;
    LastMonst:= 0;
    EventQueue:= nil;
    if(Form1.TBItem37.Checked)then
    begin
      Form1.btnRunClick(nil);
    end;
    If(OnLogin<>-1)Then Begin
      AddNewEvent(21,0,0,0,0,0);
    End;
  End Else Begin
    DebugTextAdd('---(connection)--- Logged Out '+ TimeToStr(Time));
    If(not Stopped)Then Begin
      WasOnWhenDisconnected:= True;
    End;
    LastMonst:= 0;
  End;
End;


procedure TForm1.CreatePingThread(User, Pass, Vers, CPU: String);
begin

    PingThread := TPingThread.Create(true);
    with PingThread do
    begin
      FreeOnTerminate := true;
      AutorizationName:= User;
      AutorizationPass:= Pass;
      BotVers:= Vers;
      CPU:= CPU;
      Resume;
    end;
    TimeSincePing:= 0;
end;


procedure TForm1.SendFEClickingToLastClient;
//var a,b: Char;
//    i: Integer;
begin
//  i:= Random($3FF);
//  i:= i + 1600;
//  a:= Chr(Hi(i));
//  b:= Chr(Lo(i));
//(Disabled)  LastClient.Write(#7#1#$FE#0#1 + a + b + #0);
end;


function ExtractMessage3(abyte0: string; i, j: Integer): string;
var
  k, l, i1, l1, j1, k1: Integer;
  b_f: string;
  Flag: Boolean;
  c: Char;
begin
  result:= '';
  k:= 0;
  l:= -1;
  i1:= 0;
  SetLength(b_f, 255);
  while(true)do
  begin
    if(i1 < j)then
    begin
      j1:= Byte(abyte0[i]);
      i:= i + 1;
      k1:= (j1 shr 4) and $f;
      if(l = -1)then
      begin
        if(k1 < 13)then
        begin
          b_f[k+1]:= burti[k1];
        end else
        begin
          l:= k1;
        end;
      end else
      begin
        b_f[k+1]:= burti[(l shl 4) + k1 - 195];
        k:= k +1;
        l:= -1;
      end;
      k1:= j1 and $f;
      if(l = -1)then
      begin
        if(k1 < 13)then
        begin
          b_f[k+1]:= burti[k1];
          k:= k + 1;
        end else
        begin
          l:= k1;
        end;
      end else
      begin
        b_f[k+1]:= burti[(l shl 4)+k1-195];
        k:= k + 1;
        l:= -1;
      end;
      i1:= i1 + 1;
    end else
    begin
      break;
    end;
  end;
  flag:= True;
  l1:= 0;
  while(true)do
  begin
    if(l1 < k)then
    begin
      c:= b_f[l1+1];
      if(l1 > 4)and(c = '@')then
        b_f[l1+1]:= ' ';
      if(c = '%')then
        b_f[l1+1]:= ' ';
      if(flag)and(c in ['a'..'z'])then
      begin
        //b_f[l1+1]:= b_f[l1+1] - 32;
        flag:= false;
      end;
      if(c = '.')or(c = '!')then
        flag:= True;
      l1:= l1 + 1;
    end else
    begin
      result:= Copy(b_f,1,k);
      break;
    end;
  end;


end;


function ExtractMessage2(S: string; i: Integer; j: Integer): string;
var
  b: string;
  l, i1, j1, k1, m: integer;
  let13: Boolean;
begin
  l:= -1;
  m:= 0;
  Let13:= False;
  for i1:= 1 to j do
  begin
    j1:= Ord(S[i]);
    i:= i + 1;
    k1:= (j1 shr 4) and $0f;
    if(l = -1)then
    begin
//      b:= b + '[' + inttostr(k1) + ']';
      if(k1 < 13)or((k1=13)and(Let13))then
      begin
        b:= b + Burti[k1+m];
      end;
      l:= k1;
    end;

    begin
      Let13:= True;
      m:= (l shl 4)+k1-195;
  //    b:= b + '(' + inttostr(m) + ')';
      if(m = 26)then
        m:= 13
      else if(m = 43)then
        m:= 29
      else if(m = 60)then
        m:= 45
      else begin
        m:= 0;
        Let13:= False;
      end;
    end;
      //b:= b + '('+inttostr(((l shl 4)+k1)-195)+')';
    l:= -1;

    k1:= j1 and $0f;
    if(l = -1)then
    begin
//      b:= b + '[' + inttostr(k1) + ']';
      if(k1 < 13)or((k1=13)and(Let13))then
      begin
        b:= b + Burti[k1+m];
      end;
      l:= k1;
    end;

    begin
      m:= (l shl 4)+k1-195;
//      b:= b + '(' + inttostr(m) + ')';

      Let13:= True;
      if(m = 26)then
        m:= 13
      else if(m = 43)then
        m:= 29
      else if(m = 60)then
        m:= 45
      else
      begin
        m:= 0;
        Let13:= False;
      end;
    end;
      //b:= b + '('+inttostr(((l shl 4)+k1)-195)+')';
    l:= -1;
  end;
  result:= b;

end;

function ExtractMessage(S: string; f: Integer; l: Integer):String;
var
  sz: string;
  i: Integer;
  len: Integer;
begin
  sz:= '';
  len:= f + l;
  while (f < len) and (f <= Length(S)) do
   begin

     i:= Ord(s[f]);
     if(i<50)then
       SZ:= SZ + LowerCase(Burti[i])
     else
     if(i<70)then
     begin
       f:= f + 1;
       if((i-50)*256 + Ord(s[f]) < Length(iib))then
         sz:= sz + iib[(i-50)*256 + Ord(s[f])] + ' '
       else
         sz:= sz + '<ERROR>';

     end else
     if(i < 90)then
     begin
       f:= f + 1;
       if((i-70)*256 + Ord(s[f]) < Length(iib))then
         sz:= sz + iib[(i-70)*256 + Ord(s[f])]
       else
         sz:= sz + '<ERROR>';
     end else
     if(i < 255)then
     begin
       sz:= sz + iib[(i-90)] + ' ';
     end else
     begin
       f:= f + 1;
       case Ord(s[f]) of
         0: sz:= sz + '@red@';
         1: sz:= sz + '@gre@';
         2: sz:= sz + '@blu@';
         3: sz:= sz + '@cya@';
         4: sz:= sz + '@ran@';
         5: sz:= sz + '@whi@';
         6: sz:= sz + '@bla@';
         7: sz:= sz + '@ora@';
         8: sz:= sz + '@yel@';
         9: sz:= sz + '@mag@';
       end;
     end;
     f:= f+1;
  end;
  result:= sz;
end;



procedure HCPic2Array(S: string);
var
  ai: array[0..10200]of Integer;
  j1, k1, l1, k2, i2, i3, j3, j2, l2, f: Integer;
  B: TBitmap;
  Err: Boolean;
begin
  FillChar(ai, SizeOf(ai), 0);
  j1:= 0;
  k1:= 3;
  l1:= 0;
  while(l1 < 255)do
  begin
    i2:= Ord(S[k1]);
    k1:= k1 + 1;
    k2:= 0;
    repeat
      ai[l1]:= j1;
      l1:= l1 + 1;
      k2:= k2 + 1;
    until(k2 >= i2);
    j1:= $FFFFFF - j1;
  end;
  j2:= 1;
  repeat
    l2:= 0;
    repeat
      i3:= Ord(S[k1]);
      k1:= k1 + 1;
      j3:= 0;
      while(j3 < i3)do
      begin
        ai[l1]:= ai[l1-255];
        l1:= l1 + 1;
        l2:= l2 + 1;
        j3:= j3 + 1;
      end;
      if(l2 < 255)then
      begin
        ai[l1]:= $FFFFFF - ai[l1 - 255];
        l1:= l1 + 1;
        l2:= l2 + 1;
      end;
    until(l2 >= 255);
    j2:= j2 + 1;
  until(j2 >= 40);

  B:= TBitmap.Create;
  B.Width:= 255;
  B.Height:= 40;
  for i3:= 0 to 39 do
  begin
    for j3:= 0 to 254 do
    begin
      B.Canvas.Pixels[j3,i3]:= ai[i3*255+j3];
    end;
  end;
  form1.image2.Picture.Bitmap.Assign(B);
//  form1.Panel7.Visible:= True;
  f:= 0;
  repeat
    f:= f + 1;
    Err:= False;
    try
      B.SaveToFile(ExtractFilePath(Application.ExeName) + 'HC.bmp');
    except
      Err:= True;
    end;
  until(not Err)or(f > 10);
  B.Free;
end;






function DangerousName(s: string): Boolean;
begin
  s:= UpperCase(s);
  result:= (s = 'ANDREW');
  result:= result or (s = 'PAUL');
  result:= result or (s = 'IAN');
  result:= result or (copy(s,1,4) = 'MOD ');
end;


function UserHash(s: string): Int64;
var
  s1: string;
  i: Integer;
begin
  result:= 0;
  s1:= '';
  for i:= 1 to Length(s) do
  begin
    if(s[i] in ['a'..'z','0'..'9'])then
      s1:= s1 + s[i]
    else
    if(s[i] in ['A'..'Z'])then
      s1:= s1 + chr((ord(s[i])+97)-65)
    else
      s1:= s1 + ' ';
  end;
  s1:= trim(s1);
  if(Length(s1)>12)then s1:= copy(s1,1,12);
  for i:= 1 to length(s1) do
  begin
    result:= result * 37;
    if(s[i] in ['a'..'z'])then
      result:= result + ord(s[i])+1-97
    else
    if(s[i] in ['0'..'9'])then
      result:= result + ord(s[i])+27-48;

  end;

end;

function LongToName(l: Int64): string;
var i: Integer;
begin

  if(l < 0)then
    result:= 'invalid_name'
  else
  begin
    result:= '';
    while(l <> 0)do
    begin
      i:= l mod 37;
      l:= l div 37;
      if(i = 0)then
        result:= ' ' + result
      else if(i < 27)then
      begin
        if(l mod 37 = 0)then
          result:= chr(i + 65 - 1) + result
        else
          result:= chr(i + 97 - 1) + result;
      end else
        result:= chr(i + 48 - 27) + result;
    end;
  end;
end;



procedure FilterTheCommand(var S: String; Outgoing: Boolean; Thread: TIdPeerThread);
var cmd, b: Byte;
    S1: String;
    f, i, l, wildlvl: Integer;
    c: Char;
    ID, RelX, RelY, Tips: Integer;
    KnownNPCs: Integer;
    part: Cardinal;
    bitcount, state: Integer;

procedure NextBit(bit: byte);
begin
  If(bitcount=0)Then Begin
    part:= 0;
    state:= state + 1;
  End;
  part:= (part shl 1) or bit;
  bitcount:= bitcount + 1;
  If(KnownNPCs>0)Then Begin
    If(state = 1)Then Begin
      if(part=0)and(bitcount=1)Then Begin
        KnownNPCs:= KnownNPCs - 1;
        bitcount:= 0;
        state:= 0;
      End;
      if((bitcount = 5)and(part and 16 = 16)and(part and 24 <> 24))or
        ((bitcount = 9)and(part = 256))or
        ((bitcount = 4)and(part = $F))or
        ((bitcount = 6)and(part and 48 = 48))
      Then
      Begin
        KnownNPCs:= KnownNPCs - 1;
        state:= 0;
        If(bitcount = 4)and(part = $F)Then Begin //Izdzeesh monstru
          If(LastMonst-KnownNPCs > 0)and(LastMonst-KnownNPCs <= 51)Then Begin
            Monsters[LastMonst-KnownNPCs].ID:= -1;
//            Fig0:= Fig0 + ' Monster'+IntToStr(LastMonst-KnownNPCs)+'disappears ';
          End Else Begin
//            DebugTextAdd('--(test)-- Couldnt delete monster: ' + Hexy(S));
          End;
        End Else If(bitcount = 5)and (part in [18,20,16,22,17,23,19,21])Then Begin
//          SZ:= Hexy(S);

          If(LastMonst-KnownNPCs > 0)and(LastMonst-KnownNPCs <= 51)Then Begin
            Monsters[LastMonst-KnownNPCs].Fighting:= False;
            Case part of
              18: begin //west
                    Monsters[LastMonst-KnownNPCs].X:= Monsters[LastMonst-KnownNPCs].X + 1;
                  end;
              20: begin //south
                    Monsters[LastMonst-KnownNPCs].Y:= Monsters[LastMonst-KnownNPCs].Y + 1;
                  end;
              16: begin //north
                    Monsters[LastMonst-KnownNPCs].Y:= Monsters[LastMonst-KnownNPCs].Y - 1;
                  end;
              22: begin //east
                    Monsters[LastMonst-KnownNPCs].X:= Monsters[LastMonst-KnownNPCs].X - 1;
                  end;
              17: begin //northwest
                    Monsters[LastMonst-KnownNPCs].Y:= Monsters[LastMonst-KnownNPCs].Y - 1;
                    Monsters[LastMonst-KnownNPCs].X:= Monsters[LastMonst-KnownNPCs].X + 1;
                  end;
              23: begin //northeast
                    Monsters[LastMonst-KnownNPCs].Y:= Monsters[LastMonst-KnownNPCs].Y - 1;
                    Monsters[LastMonst-KnownNPCs].X:= Monsters[LastMonst-KnownNPCs].X - 1;
                  end;
              19: begin //southwest
                    Monsters[LastMonst-KnownNPCs].Y:= Monsters[LastMonst-KnownNPCs].Y + 1;
                    Monsters[LastMonst-KnownNPCs].X:= Monsters[LastMonst-KnownNPCs].X + 1;
                  end;
              21: begin //southeast
                    Monsters[LastMonst-KnownNPCs].Y:= Monsters[LastMonst-KnownNPCs].Y + 1;
                    Monsters[LastMonst-KnownNPCs].X:= Monsters[LastMonst-KnownNPCs].X - 1;
                  end;
            end;
            If(OnNPCMoved>-1)Then Begin
              AddNewEvent(14, Monsters[LastMonst-KnownNPCs].ID, Monsters[LastMonst-KnownNPCs].X, Monsters[LastMonst-KnownNPCs].Y, Monsters[LastMonst-KnownNPCs].Tips, 0);
            End;
          end else begin
//            DebugTextAdd('--(test)-- Couldnt move monster: ' + Hexy(S));
          end;

        End Else If(bitcount = 6)and(part = 56)Then Begin
          Monsters[LastMonst-KnownNPCs].Fighting:= True;
        End;
        bitcount:= 0;
      End;
    End;
  End Else Begin  //New NPCs appear
    if(state = 1)and(bitcount = 12)Then Begin
      ID:= part;    //New Monster ID
      bitcount:= 0;
    End Else If(state = 2)and(bitcount = 5)Then Begin
      RelX:= part;  //New monster relative X
      If(RelX>16)Then RelX:= -(32 - RelX);
      bitcount:= 0;
    End Else If(state = 3)and(bitcount = 5)Then Begin
      RelY:= part;  //New monster relative Y
      If(RelY>16)Then RelY:= -(32 - RelY);
      bitcount:= 0;
    End Else If(state = 4)and(bitcount = 5)Then Begin
      bitcount:= 0;  //New monster direction
    End Else if(state = 5)and(bitcount = 9)Then Begin
      Tips:= part;
      bitcount:= 0;
      State:= 0;
      LastMonst:= LastMonst + 1;
      If(LastMonst<=50)and(LastMonst>0)Then begin
//        Fig0:= Fig0 + ' Monster'+IntToStr(LastMonst)+'appears ';
        Monsters[LastMonst].X:= MyX + RelX;
        Monsters[LastMonst].Y:= MyY + RelY;
        Monsters[LastMonst].ID:= ID;
        Monsters[LastMonst].Tips:= Tips;
        Monsters[LastMonst].Fighting:= False;
        If(OnNPCAppeared>-1)Then Begin
          AddNewEvent(12, ID, MyX+RelX, MyY+RelY, Tips, 0);
        End;
      End Else Begin
//        DebugTextAdd('--(test)-- Couldnt add monster: ' + Hexy(S));
      End;
//      DebugTextAdd('A monster appears! ID='+IntToStr(ID) + ', X=' + IntToStr(RelX) + ', Y=' + IntToStr(RelY) + ', Type=' + IntToStr(Tips) + ', Extra=' + IntToStr(Extra));
    End;
  End;
end;

function ExtractBits(s: string; var f: Integer; count: Integer): Integer;
var bnum, bit, a, i: Integer;
begin
  bnum:= f div 8 + 1;
  bit:= f mod 8;
  result:= 0;
  for i:= 1 to count do
  begin
    if(bnum > Length(S))then
      a:= 0
    else
      a:= ((Byte(S[bnum]) and ($80 shr bit)) shl bit) shr 7;
    result:= result shl 1;
    result:= result or a;
    bit:= bit + 1;
    if(bit >= 8)then
    begin
      bit:= 0;
      bnum:= bnum + 1;
    end;
  end;
  f:= f + count;
end;



var
  ccmd: Integer;
  namehash: Int64;
  PlLen, SkipNum: Integer;
  TempS: string;
  k: Integer;
  uhash: Int64;

begin

  S1:= S;


  //---------------- Process the data before filtering -------
  If(Length(S)>1)and(CommandLength(S) = Length(S)-1)Then Begin

    //Move the parameter back to the end
    //RS chunk structure - Length LastParamByte CommandByte Params...
    for f:=2 To Length(S)-1 Do Begin
      c:= S[f];
      S[f]:= S[f+1];
      S[f+1]:= c;
    End;
    cmd:= Ord(S[2]);
    If(not Outgoing)Then Begin
      Case cmd of
          $FF: Begin

                 if(MyID>0)and(PlayerData[MyID].Lvl = 0)then
                 begin
                   if(PlayerData[MyID].LastRequest > 0)then
                   begin
                     PlayerData[MyID].LastRequest:= PlayerData[MyID].LastRequest - 1;
                   end else
                   begin
                     PlayerData[MyID].LastRequest:= 20;

                     TempS:= #7#0#$FE#0#1 + Chr(Hi(MyID)) + Chr(Lo(MyID)) + #0;
                     LastClient.Write(TempS);
                     //EEE EncryptCommandForServer(TempS);
                     DebugTextAdd('Requesting player data for myself: ' + IntToStr(MyID));
                   end;
                 end;

                 //My coords
                 If(Length(S) > 4)Then Begin
                   if(CheatCoords)then
                   begin
                     ChangeToCheatCoords(S[3], S[4], S[5]);
                     MyX:= CheatCoordX;
                     MyY:= CheatCoordY;
                     //Too evil?
                     S1:= S;
                   end else
                   begin
                     DecompressCoords(Ord(S[3]), Ord(S[4]), Ord(S[5]));
                   end;
                 End;

                 f:= 40;


                 MyDir:= ExtractBits(S, f, 4);
                 if(MyDir and $8 = $8)then
                 begin
//                   DebugTextAdd('I am fighting!');
                     LastFightTime:= 70;
                 end else
                 begin
//                   DebugTextAdd('I am not fighting');
                 end;
                 l:= ExtractBits(S, f, 8);
                 if(l <> Length(Players))then
                 begin
                   SetLength(Players, l);
                   DebugTextAdd('Reseting array of other players, probably because of lag');
                 end;
                 //Label7.Caption:= IntToStr(l);
                 try
                 for i:= 0 to l-1 do
                 begin
                   if(ExtractBits(S, f, 1) <> 0)then
                   begin
                     Players[i].Fighting:= False;
                     if(ExtractBits(S, f, 1) = 0)then
                     begin
                       ccmd:= ExtractBits(S, f, 3);
                       if(ccmd in [1,2,3])then Players[i].X:= Players[i].X + 1;
                       if(ccmd in [6,7,5])then Players[i].X:= Players[i].X - 1;
                       if(ccmd in [3,4,5])then Players[i].Y:= Players[i].Y + 1;
                       if(ccmd in [0,1,7])then Players[i].Y:= Players[i].Y - 1;
                       PlayerData[Players[i].ID].X:= Players[i].X;
                       PlayerData[Players[i].ID].Y:= Players[i].Y;



                     end else
                     begin
                       Players[i].Dir:= ExtractBits(S, f, 4);
                       Players[i].Fighting:= True;
                       if ((Players[i].Dir and $0C) = $0C)then
                       begin
//                         TempS:= Hexy(S);
//                         DebugTextAdd('Player DISappears, ID=' + IntToStr(Players[i].ID));
                         Players[i].ID:= -1;
                         f:= f - 2;
                       end;
                     end;
                   end;
                   if(Form1.TBItemWildy.Checked)and(Abs(Players[i].X - MyX) <= 10)and(Abs(Players[i].Y - MyY) <= 10)and(Players[i].ID >= 0)then
                   begin
//                     DebugTextAdd('Someone is close to me (ID = ' + IntToStr(Players[i].ID) + ', Level='+IntToStr(PlayerData[Players[i].ID].Lvl)+')');
                     wildlvl:= (427 - MyY) div 6 + 1;
                     if(wildlvl>0)and(Abs(PlayerData[Players[i].ID].Lvl - PlayerData[MyID].lvl) <= wildlvl)then
                     begin
                       DebugTextAdd('Dangerous player nearby!!! (wildy=' + IntToStr(wildlvl) + ', lvl='+IntToStr(PlayerData[Players[i].ID].Lvl)+')');
                       if(MyDir and $8 <> $8)and(LastFightTime=0)and(Form1.ServerHosts.Items.Count > 0)then
                       begin
                         //Choose random server
                         repeat
                           k:= Random(Form1.ServerHosts.Items.Count);
                         until(Form1.TCPMap.MappedHost <> Form1.ServerHosts.Items[k])or(Form1.TCPMap.MappedPort <> StrToInt(Form1.ServerPorts.Items[k]));
                         RedirectHostOnce:= Form1.ServerHosts.Items[k];
                         RedirectPortOnce:= StrToInt(Form1.ServerPorts.Items[k]);
                         TIdMappedPortThread(LastThread).OutboundClient.Disconnect;
                       end;
                     end;
                   end;
                   if(Players[i].ID > 0)then
                   begin
                     if(PlayerData[Players[i].ID].Lvl = 0)then
                     begin
                       if(PlayerData[Players[i].ID].LastRequest > 0)then
                       begin
                         PlayerData[Players[i].ID].LastRequest:= PlayerData[Players[i].ID].LastRequest - 1;
                       end else
                       begin
                         PlayerData[Players[i].ID].LastRequest:= 100;
                         TempS:= #7#0#$FE#0#1 + Chr(Hi(Players[i].ID)) + Chr(Lo(Players[i].ID)) + #0;
                         if(Form1.TBItem38.Checked)then
                           DebugTextAdd('>> ' + Hexy(TempS));
                         //EEE EncryptCommandForServer(TempS);
                         LastClient.Write(TempS);

//                         DebugTextAdd('Requesting player data for ' + IntToStr(Players[i].ID));
                       end;
                     end;
                   end;
                 end;
                 except
                   DebugTextAdd('Error in player moving');
                 end;
                 PlLen:= Length(Players);
                 SkipNum:= 0;
                 i:= 0;
                 try
                 while i < Length(Players) do
                 begin
                   if(Players[i].Id = -1)then
                   begin
                     SkipNum:= SkipNum + 1;
                     PlLen:= PlLen - 1;
                   end else
                     i:= i + 1;
                   if(SkipNum <> 0)and(i + SkipNum < Length(Players))and(i < Length(Players))then
                   begin
                     Players[i]:= Players[i + SkipNum];
                     Players[i + SkipNum].ID:= 0;
                   end
                   else if(SkipNum<>0)then
                     i:= i + 1;
                 end;
                 except
                   DebugTextAdd('Error while deleting players');
                 end;
                 try
                 SetLength(Players, PlLen);
                 while(f+24<(Length(S)+1)*8)do
                 begin
                   i:= Length(Players);
                   SetLength(Players, i + 1);
//                   DebugTextAdd(Hexy(S));
                   Players[i].ID:= Word(ExtractBits(S, f, 11));
                   Players[i].X:= ExtractBits(S, f, 5);
                   if(Players[i].X > 15)then
                     Players[i].X:= Players[i].X - 32;
                   Players[i].Y:= ExtractBits(S, f, 5);
                   if(Players[i].Y > 15)then
                     Players[i].Y:= Players[i].Y - 32;
                   Players[i].X:= Players[i].X + MyX;
                   Players[i].Y:= Players[i].Y + MyY;
                   PlayerData[Players[i].ID].X:= Players[i].X;
                   PlayerData[Players[i].ID].Y:= Players[i].Y;
                   Players[i].Dir:= ExtractBits(S, f, 4);
                   Players[i].Skull:= (ExtractBits(S, f, 1) = 1);
                   //PlayerData[Players[i].Id].Name:= '';
                   //PlayerData[Players[i].Id].Lvl:= 0;
                   //PlayerData[Players[i].Id].HP:= 0;
                   PlayerData[Players[i].ID].LastRequest:= 20;
//                   DebugTextAdd('Player appears, ID='+IntToStr(Players[i].ID)+', x=' + IntToStr(Players[i].X)+', y=' + IntToStr(Players[i].Y));
                 end;
                 except
                   DebugTextAdd('Error while adding player');
                 end;
               end;
          $D4: Begin //lose item
                 LastItemLost:= Items[Ord(S[3])];
                 If(LastItemLost = -1)Then Begin
                   LastItemLost:= -2;
                 End;
                 If(OnItemLost>-1)or(OnItemLost=-2)Then Begin
                   AddNewEvent(1, LastItemLost, Ord(S[3]), 0, 0, 0);
                 End;

                 For f:= Ord(S[3]) to High(Items)-1 do begin
                   Items[f]:= Items[f+1];
                   ItemCounts[f]:= ItemCounts[f+1];
                 end;
                 Items[High(Items)]:= -1;
                 ItemCounts[High(Items)]:= 0;
                 BagFull:= False;
               End;
          $D5: Begin  //gain item
                 LastItemGained:= MakeWordC(S[4], S[5]);
                 Items[Ord(S[3])]:= LastItemGained;
                 If(OnItemGained>-1)Then Begin
                   AddNewEvent(2, LastItemGained, Ord(S[3]), 0, 0, 0);
                 End;
                 if(S[1] = #5)Then Begin
                   ItemCounts[Ord(S[3])]:= Ord(S[6]);
                 End Else If(S[1] = #8)Then Begin
                   ItemCounts[Ord(S[3])]:= MakeLongC(Chr(Ord(S[6]) and $0F),S[7],S[8],S[9]);
                 End Else Begin
                   ItemCounts[Ord(S[3])]:= 1;
                 End;
                 If(Ord(S[3]) = High(Items))Then
                   BagFull:= True;
               End;
          $F6: Begin  //quest menu appears
                 QuestMenuAppeared:= True;
                 If(OnQuestMenuAppeared > -1)Then Begin
                   AddNewEvent(19,0,0,0,0,0);
                 End;
               End;
          $ED: begin  //trade closed
                 if(OnTradeClosed > -1)then
                   AddNewEvent(23,0,0,0,0,0);
               end;
          $EE: begin  //trade1
                 if(OnTrade1 > -1)then
                   AddNewEvent(24,0,0,0,0,0);
               end;
          $D9: begin  //trade2
                 if(OnTrade2 > -1)then
                   AddNewEvent(25,0,0,0,0,0);
               end;
          $EB: begin  //trade accepted
                 if(OnTradeAccept > -1)then
                   AddNewEvent(26,0,0,0,0,0);
               end;
          $DD: Begin  //bank window closes
                 BankWindow:= False;
               End;
          $DE: Begin  //bank window appears
                 BankWindow:= True;
                 xbb:= Ord(S[3]);
                 ybb:= Ord(S[4]);
                 f := 5;
                 FillChar(Bank, SizeOf(Bank), 0);
                 BankItemsCount:= xbb;
                 for i:= 1 to xbb do
                 begin
                   bank[i].ID:= MakeWordC(S[f], S[f+1]);
                   f:= f + 2;
                   if(Ord(S[f]) < 128)then
                   begin
                     bank[i].Count:= Ord(S[f]);
                     f:=  f + 1;
                   end else
                   begin
//((abyte0[i] & 0xff) - 128 << 24) + ((abyte0[i + 1] & 0xff) << 16) + ((abyte0[i + 2] & 0xff) << 8) + (abyte0[i + 3] & 0xff);
                     bank[i].Count:= Cardinal(Ord(S[f])-128) shl 24 + Cardinal(Ord(S[f+1])) shl 16 + cardinal(Ord(S[f+2])) shl 8 + Ord(S[f+3]);
                     f:= f + 4;
                   end;
                 end;
                { for i:= 1 to 5 do
                 begin
                   DebugTextAdd('BankItem' + IntToStr(i) + '=' + IntToStr(Bank[i].ID) + ', count=' + IntToStr(Bank[i].Count));
                 end;}

//                 DebugTextAdd('xbb='+IntToStr(xbb)+', ybb='+IntToStr(ybb));
               End;
          $E9: Begin  //shop window closes
                 ShopWindow:= False;
                 If(OnShopClosed>-1)Then Begin
                     AddNewEvent(11, 0, 0, 0, 0, 0);
                 End;
               End;
          $EA: Begin  //shop window appars
                 ShopWindow:= True;
                 ClearShop;
                 xbb:= Ord(S[5]);
                 ybb:= Ord(S[6]);
                 For f:= 1 to Ord(S[3]) do begin
                   ShopItems[f]:= MakeWordC(S[f*5+2],S[f*5+3]);
                   ShopItemCounts[f]:= MakeWordC(S[f*5 + 4], S[f*5 + 5]);
                   ShopItemMod[f]:= ShortInt(Ord(S[f*5+6]));
                 end;
               End;
          $09: Begin  //Logged out
                 If(Length(S) = 2)and(S[1]=#1)Then Begin
                   SetLoggedIn( False);
                   MyX:= -1;
                 End;
               End;
          $00, $01: Begin //Logged in, Reconnected
                 If(Length(S) = 2)Then Begin
                   SetLoggedIn( True);
                   //FillChar(VisibleObjects, SizeOf(VisibleObjects), -1);
                 End;
               End;
          $FE: Begin  //Item appears/disappears nearby
                 begin
                   f:= 3;
                   While(f<Length(S))Do Begin
                     b:= Ord(S[f]) shr 4;
                     If(b = 0)Then Begin
                       If(f+3<=Length(S))Then Begin
                         NewItem:= MakeWord(Ord(S[f])and $0F, Ord(S[f+1]));
                         NewItemX:= MyX + ShortInt(S[f+2]);
                         NewItemY:= MyY + ShortInt(S[f+3]);
  //                       AppearsItem;
                         If(OnItemAppeared>-1)Then Begin
                           AddNewEvent(13, NewItem, NewItemX, NewItemY, 0, 0);
                         End;
                       End;
                       f:= f + 4;
                     End Else If(b=$8)Then Begin
                       If(f+3<=Length(S))Then Begin
  //                       DisappearsItem(MakeWord(Ord(S[f])and $0F, Ord(S[f+1])),MyX + ShortInt(S[f+2]), MyY + ShortInt(S[f+3]));
                         NewItem:= MakeWord(Ord(S[f])and $0F, Ord(S[f+1]));
                         NewItemX:= MyX + ShortInt(S[f+2]);
                         NewItemY:= MyY + ShortInt(S[f+3]);
  //                       AppearsItem;
                         If(OnItemDisAppeared>-1)Then Begin
                           AddNewEvent(22, NewItem, NewItemX, NewItemY, 0, 0);
                         End;


                       End;
                       f:= f + 4;
                     End Else Begin
                       f:= f + 4;
                     End;
                   End;
                 end;
               End;
          $08: Begin //Server message
                 ServerMessageAppeared:= True;
                 LastServerMessage:= Copy(S,3,Length(S));
                 If(OnServerMessage>-1)Then Begin
                   AddNewEvent(3, 0, 0, 0, 0, 0);
                 End;
               End;
          $1C: Begin //Private message
                 uhash:= MakeLongC(S[3], S[4], S[5], S[6]);
                 uhash:= uhash shl 32;
                 uhash:= uhash or MakeLongC(S[7], S[8], S[9], S[10]);
                 LastPM:= ExtractMessage2(S, 11, Length(S)-10);
                 LastPMer:= LongToName(uhash);
                 DebugTextAdd('PM: <' + LastPMer + '> ' + LastPM);
                 if(DangerousName(LongToName(uhash)))and(Form1.TBItem35.Checked)and(not Stopped)then
                 begin
                   DebugTextAdd('!!!!!Eeeek, Mod PMed me!!!!!!!');
                   Form1.ResetScriptStats;
                   Stopped:= True;
                   Form1.TBItem15.Checked:= False;
                   Application.ProcessMessages;
                   Sleep(6000+Random(2000));
                   Case Random(3) of
                     0: TempS:= #$40 + #$1C + Copy(S,3,8) + #$61#$BB;
                     1: TempS:= #$65 + #$1C + Copy(S,3,8);
                     2: TempS:= #$D3 + #$1C + Copy(S,3,8) + #$61;
                   end;
                   TempS:= Chr(Length(TempS)) + TempS;
                   LastClient.Write(TempS);

                 end;
                 If(OnPrivateMessage>-1)Then Begin
                   AddNewEvent(4, 0, 0, 0, 0, 0);
                 End;

               End;
          $D3: Begin //Stats changed
                 //DebugTextAdd('Stats Changed, skill='+IntToStr(Ord(S[3]))+',value='+IntToStr(Ord(S[4]))+',max='+IntToStr(Ord(S[5])));
                 If(S[3]=#3)Then Begin
                   MyHP:= Ord(S[4]);
                   If(OnHPChanged>-1)Then Begin
                     AddNewEvent(8, Ord(S[4]), 0, 0, 0, 0);
                   End;
                 End;
               End;
          $F4: Begin
//                 DebugTextAdd('ID is '+IntToStr(MakeWordC(S[3],S[4]))+ ' ('+Hexy(S[3]+S[4])+')');
                 MyID:= MakeWordC(S[3],S[4]);
                 PlayerData[MyID].LastRequest:= 5;
               End;
          $FA: Begin
                 try
                 f:= 5;
                 i:= MakeWordC(S[3], S[4]);
                 for l:= 1 to i do begin
                   ID:= MakeWordC(S[f], S[f+1]);
                   f:= f + 2;
                   case Ord(S[f]) of
                     0: f:= f + 3;
                     1: begin  //someone is talking
                          f:= f + 1;
                          b:= Ord(S[f]);
                          f:= f + 1;
                          //New chat system kind of screwed this up
                          LastChatMessage:= ExtractMessage2(S, f, b);
                          if(Form1.TBItem24.Checked)then
                          begin
                            DebugTextAdd('Chat: <' + PlayerData[ID].Name +'> ' + LastChatMessage);
                          end;
                          If(OnChatMessage>-1)Then Begin
                            AddNewEvent(10, 0, 0, 0, 0, 0);
                          End;
                          f:= f + b;
                        end;
                     2: begin
                          f:= f + 1;
                          If(ID=MyID)Then
                          Begin
                            MyHP:= Ord(S[f+1]);
                            If(OnHPChanged>-1)Then Begin
                              AddNewEvent(8, MyHP, 0, 0, 0, 0);
                            End;
                          End;
                          PlayerData[ID].HP:= Ord(S[f+1]);
                          PlayerData[ID].MaxHP:= Ord(S[f+2]);
//                          DebugTextAdd('Data 1=' + IntToStr(Ord(S[f])) + ' HP=' + IntToStr(Ord(S[f+1])) + ' 3=' + IntToStr(Ord(S[f+2])));
                          f:= f + 3;

                        end;
                     3: begin
                          f:= f + 1;
                          //DebugTextAdd('FA(3) 1='+IntToStr(MakeWordC(S[f], S[f+1])) + ', 2='+IntToStr(MakeWordC(S[f+2], S[f+3])));
                          f:= f + 4;
                        end;
                     4: begin
                          f:= f + 1;
                          //DebugTextAdd('FA(4) 1='+IntToStr(MakeWordC(S[f], S[f+1])) + ', 2='+IntToStr(MakeWordC(S[f+2], S[f+3])));
                          f:= f + 4;
                        end;
                     5: begin
                          f:= f + 1;
                          //DebugTextAdd('FA(5), first num = ' + IntToStr(MakeWordC(S[f], S[f+1])));
                          f:= f + 2;
                          namehash:= MakeLongLongC(S[f], S[f+1], S[f+2], S[f+3], S[f+4], S[f+5], S[f+6], S[f+7]);
                          //DebugTextAdd('New player: ' + LongToName(namehash));
                          PlayerData[ID].Name:= LongToName(namehash);
                          for k:= Low(PlayerData) to High(PlayerData) do
                          begin
                            if(k <> ID)and(PlayerData[ID].Name=PlayerData[k].Name)then
                            begin
                              PlayerData[k].Name:= '';

                            end;
                          end;
                          if(DangerousName(PlayerData[ID].Name))and(Form1.TBItem35.Checked)and(not Stopped)then
                          begin
                            DebugTextAdd('!!!!!!Moderator nearby ' + PlayerData[ID].Name);
                            Form1.ResetScriptStats;
                            Stopped:= True;
                            Form1.TBItem15.Checked:= False;
                            Form1.LogOut1Click(nil);
                            Application.ProcessMessages;
                            Sleep(5000);
                            Application.ProcessMessages;
                            TIdMappedPortThread(LastThread).OutboundClient.Disconnect;

                          end;
                          f:= f + 8;
                          b:= Ord(S[f]);
                          f:= f + 1 + b;
                          PlayerData[ID].Lvl:= Ord(S[f+4]);
                          PlayerData[ID].LastRequest:= 20;
                          //DebugTextAdd('Data= 1='+IntToStr(Ord(S[f]))+' 2='+IntToStr(Ord(S[f+1]))+' 3='+IntToStr(Ord(S[f+2]))+' 4='+IntToStr(Ord(S[f+3]))+' 5='+IntToStr(Ord(S[f+4]))+' 6='+IntToStr(Ord(S[f+5])));
                          f:= f + 6;
                          
                        end;
                     6: begin
                          f:= f + 1;
                          b:= Ord(S[f]);
                          f:= f + 1;
                          //The "quiet" chat messages such as other players speaking to bankers
                        {  LastChatMessage:= ExtractMessage2(S, f, b);
                          if(TBItem24.Checked)then
                          begin
                            DebugTextAdd('Chat2: ' + LastChatMessage);
                          end;}
                          f:= f + b;
                        end;
                   end;
                 end;
                 except
                   DebugTextAdd('Error in FA processing');
                 end;


               End;
          $DC: Begin
                 If(OnStatsChanged>-1)Then Begin
                   AddNewEvent(9, Ord(S[3]), 0, 0, 0, 0);
                 End;
               End;
          $C8: begin
                 Fatigue:= MakeWordC(S[3], S[4]);
               end;
          $CA: begin
                 Fatigue:= MakeWordC(S[3], S[4]);
               end;
          $F8: Begin

                 begin
                   Fight2:= Fight1;
                   Fight1:= Fight0;
                   Fight0:= S;

  {                 Fig2:= Fig1;
                   Fig1:= Fig0;
                   Fig0:= '';}

                   If(Length(S)>2)and(Ord(S[3])<>LastMonst)Then Begin
  //                   DebugTextAdd('--(test)-- LastMonst: ' + IntToStr(LastMonst) + ', Actual Count: ' + IntToStr(Ord(S[3])));
  //                   DebugTextAdd('F2: ' + Hexy(Fight2) + Fig2);
  //                   DebugTextAdd('F1: ' + Hexy(Fight1) + Fig1);
  //                   DebugTextAdd('F0: ' + Hexy(Fight0) + Fig0);
                   End;
                   If(Length(S)>2)Then Begin
                     KnownNPCs:= Ord(S[3]);
                     For f:= 1 to LastMonst - KnownNPCs Do Begin
                       DebugTextAdd('--(test)-- Getting rid of NPC lag');
                       Monsters[f].ID:= -1;
                     End;
                     For f:= 4 To Length(S) Do Begin
                       b:= Ord(S[f]);
                       For i:= 1 to 8 Do Begin
                         NextBit((b and 128) shr 7);
                         b:= b and 127;
                         b:= b shl 1;
                       End;
                     End;

                     b:=0;

                     f:= 1;
                     While(f <= LastMonst) do begin
                       if(Monsters[f].ID = -1)Then Begin
                         b:= b + 1;
                         for i:= f+1 to LastMonst Do Begin
                           Monsters[i-1]:= Monsters[i];
                         End;
                         Monsters[LastMonst].ID:= 0;
                         f:= f-1;
                       End;
                       f:= f+1;
                     end;
                     LastMonst:= LastMonst - b;
                   End;

                   If(State >0)and(Part>0)Then Begin
  //                   DebugTextAdd('Monst: ' + Hexy(S));
                   End;
                 end;

               End;
          $F9: Begin
//                 DebugTextAdd('Object1: ' + Hexy(S));
          {       F:= 3;
                 While(F+3<=Length(S))do
                 begin
                   if(S[f] = #255)then
                   begin
                //     DebugTextAdd('Obj255 coords: ' + IntToStr(Ord(S[f+1]) shr 4) + ', ' + IntToStr(Ord(S[f+2]) shr 4));
                     f:= f + 3;
                   end else
                   begin
                //     DebugTextAdd('Obj ' + IntToStr(MakeWordC(S[f], S[f+1])) + ', ' + IntToStr(Ord(S[f+2])) + ', ' + IntToStr(Ord(S[f+3])) + ', ' + IntToStr(Ord(S[f+2])));
                     f:= f + 5;
                   end;
                 end;}
               End;
          $FD: Begin
//                 DebugTextAdd('Object2: ' + Hexy(S));
                 F:= 3;
                 While(F+3<=Length(S))Do Begin
                   if(S[f] = #255)then
                   begin
                     f:= f + 3;
                   end else begin
                     if(MakeWordC(S[F],S[F+1])=0)then S[F+1]:= #1;
                     If(OnObject > -1)Then Begin
                       AddNewEvent(15, MakeWordC(S[F],S[F+1]), MyX + ShortInt(Ord(S[F+2])), MyY+ShortInt(Ord(S[F+3])), 0, 0);
                     End;
                     If(CollectObjInfo)Then
                     begin
//                       DebugTextAdd('Objec: ' + IntToStr(MakeWordC(S[F],S[F+1])) +', ' + IntToStr(MyX + ShortInt(Ord(S[F+2]))) + ',' + IntToStr(MyY+ShortInt(Ord(S[F+3]))));
                       NewObj(MakeWordC(S[F],S[F+1]), MyX + ShortInt(Ord(S[F+2])), MyY+ShortInt(Ord(S[F+3])), []);
                     end;
                     F:= F + 4;
                   end;
                 End;
               End;
          $C9: begin
                 //Humancheck picture
                 HCPic2Array(S);

               end;

      End;
    End else
    begin
      //outgoing
      case cmd of
        $5: begin
              if(TimeSinceRSPing < 40)then
              begin
                S1:= '';
                //DebugTextAdd('Stripping Ping');
              end else
              begin
                //DebugTextAdd('Ping');
              end;
            end;
      end;
    end;
  End Else Begin
    If(S<>'')Then Begin
      If(OutGoing)Then Begin
//        DebugTextAdd('Split command... Outgoing');
      End Else Begin
//        DebugTextAdd('Split command... Incoming');
      End;
      SplitCommand:= S;
      SplitLength:= Ord(S[1]);
//      DebugTextAdd('Previ: ' + Hexy(PreviousCommand));
//      DebugTextAdd('Split: ' + Hexy(S));
//      S1:= '';
    End;
  End;

  S:= S1;

  //----------- Filter the commands ---------
  If((Length(S)>=3)and(Form1.lstFilter.Items.IndexOf('-' + Trim(Hexy(S[3]))) <> -1))Then Begin
    f:= Form1.lstFilter.Items.IndexOf('-' + Trim(Hexy(S[3])));
    If(Form1.lstFilter.Checked[f])Then Begin
      //Kill the command
      Delete(S, 1, Ord(S[1]) + 1);
    End;
  End;

  If((Length(S)=2)and(Form1.lstFilter.Items.IndexOf('-' + Trim(Hexy(S[2]))) <> -1))Then Begin
    f:= Form1.lstFilter.Items.IndexOf('-' + Trim(Hexy(S[2])));
    if(Form1.lstFilter.Checked[f])Then Begin
      S:= '';
    End;
  End;

end;

function TForm1.CanDisplayCommand(S: String; Outgoing: Boolean):Boolean;
Begin
  result:= False;
  If(OutGoing and (cmbOutIn.ItemIndex = 0))or(not Outgoing and (cmbOutIn.ItemIndex = 1))Then Begin
      If(lstFilter.Items.IndexOf(Hexy(S)) = -1)or(lstFilter.Checked[lstFilter.Items.IndexOf(Hexy(S))]= False)Then Begin
        If(Length(S)<3)or(lstFilter.Items.IndexOf(':' + Trim(Hexy(S[3]))) = -1)or(lstFilter.Checked[lstFilter.Items.IndexOf(':' + Trim(Hexy(S[3])))] = False)Then Begin
          result:= True;
        End;
      End;
  End;
End;

Procedure Replace(var S: String; SubS, RepS: String);
var F, F1: Integer;
Begin

  F:= Pos(SubS, S);
  While(F > 0)Do Begin
    Delete(S, F, Length(SubS));
    Insert(RepS, S, F);
    F:= F + Length(RepS);
    F1:= Pos(SubS, Copy(S, F, Length(S)));
    If(F1 = 0)Then F:=0 Else F:= F + F1 - 1;
  End;
End;


function AmASleepWord: Boolean;
var
  ARPath: string;
begin
  ARPath:= ExtractFilePath(Application.Exename);
  try
    result:= False;
    if(FileExists(ARPath + 'slword.txt'))then
    begin
      if(LastFileAge<>FileAge(ARPath + 'slword.txt'))then
      begin
        result:= true;
        LastFileAge:=FileAge(ARPath + 'slword.txt');
      end;
    end;
  except
    result:= False;
  end;

end;



procedure CreateAutoFightScript(NPCType, FightMode, MinHP: Integer; PickBones, PickCoins: Boolean);
var f: textfile;
    s: string;
begin
  AssignFile(f, ExtractFilePath(Application.ExeName) + 'EAutoFightTemplate.dat');
  Reset(f);
  while not EOF(f)do
  begin
    Readln(f, s);
    Replace(s, '{%NPCTYPE%}', IntToStr(NPCType));
    Replace(s, '{%FIGHTMODE%}', IntToStr(FightMode));
    Replace(s, '{%MINHP%}', IntToStr(MinHP));
    Replace(s, '{%COLLECTBONES%}', IIF( PickBones, '', '-'));
    Replace(s, '{%COLLECTCOINS%}', IIF( PickCoins, '', '-'));

    Form1.txtUserScript.Lines.Add(s);
  end;
  CloseFile(f);

//  Form1.txtUserScript.Lines.Text:= s;
end;


procedure OutGoingCommandToText(var result: String; s: string; cmd: byte; var after: Integer);
var
  f: Integer;
  uhash: Int64;

begin
  Case cmd of
          $C2: Begin
                 result:= 'MoveTo(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                    + IntToStr(MakeWordC(S[5],S[6]));
                 f:= 7;
                 While(f<=Length(S))Do Begin
                   result:=result + ',' + IntToStr(ShortInt(ord(S[f])));
                   Inc(f);
                 End;
                 result:= result + ') ';
                 after:= f;
               End;
//          $FE: begin
//                 result:= 'FE(' + IntToStr(MakeWordC(S[3],S[4])) + ','
//                                + IntToStr(MakeWordC(S[5],S[6])) + ','
//                                + IntToStr(MakeWordC(S[7],S[8])) + ')';
{                 result:= '';
                 for f:= 1 to MakeWordC(S[3],S[4]) do
                 begin
                   //result:= result + 'RequestPlayerData(' + IntToStr(MakeWordC(S[5],S[6])) +
                   //         ', ' + IntToStr(MakeWordC(S[7],S[8])) + ', ' +
                   //         PlayerData[MakeWordC(S[5],S[6])].Name + ')';
                 end;}
//               end;
          $C1: begin
                 result:= 'SleepWord("' + Copy(S, 3, Length(S)) + '")';
                 //DebugTextAdd(S);
               end;
          $03: Begin
                 result:= 'Say(' + hexy(Copy(S, 3, Length(S))) + ') '#13#10;
                 result:= result + 'Say(' + ExtractMessage2(S, 3, Length(S)-2) + ') ';
               End;
          $06: Begin
                 result:='LogOut() ';
               End;
          $D7: Begin
                 result:= 'Action(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                    + IntToStr(MakeWordC(S[5],S[6]));
                 f:= 7;

                 While(f<=Length(S))Do Begin
                   result:=result + ',' + IntToStr(ShortInt(ord(S[f])));
                   Inc(f);
                 End;
                 result:= result + ') ';
                 after:= f;
               End;
          $F2: Begin
                 result:= 'AtObject(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                      + IntToStr(MakeWordC(S[5],S[6])) + ') ';
                 inc(xt);
                 after:= 7;
               End;
          $E6: Begin
                 result:= 'AtObject2(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                      + IntToStr(MakeWordC(S[5],S[6])) + ') ';
                 inc(xt);
                 after:= 7;
               End;
          $F1: Begin
                 result:='AtObjectWithItem('
                                     + IntToStr(MakeWordC(S[3],S[4])) + ','
                                     + IntToStr(MakeWordC(S[5],S[6])) + ','
                                     + IntToStr(MakeWordC(S[7],S[8]))+ ') ';
                 after:= 9;
               End;

          $F5: Begin
                 result:='TalkToNPC(' + IntToStr(MakeWordC(S[3],S[4])) + ') ';
                 after:= 5;
               End;
          $F4: Begin
                 result:='AttackNPC(' + IntToStr(MakeWordC(S[3],S[4])) + ') ';
                 inc(xt);
                 after:= 5;
                 if(Stopped)and(CreateAFScript)then
                 begin
                   DebugTextAdd('NPC Type is: ' + IntToStr(FindNPCTypeByID(MakeWordC(S[3],S[4]))));
                   CreateAutoFightScript(FindNPCTypeByID(MakeWordC(S[3],S[4])),CreateAFFightMode,CreateAFMinHP,CreateAFPickBones,CreateAFPickCoins);
                   Form1.TBItem28.Checked:= False;
                   CreateAFScript:= False;
                 end;
               End;
          $C3: Begin
                 result:='ThieveNPC(' + IntToStr(MakeWordC(S[3],S[4])) + ') ';
                 after:= 5;
               End;
          $E1: Begin
                 result:='MagicNPC(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                     + IntToStr(MakeWordC(S[5],S[6])) + ')';
                 after:= 7;
               End;
          $F8: begin
                 result:= 'Unwield(' + IntToStr(MakeWordC(S[3],S[4])) + ') ';
                 after:= 5;
               end;
          $F9: begin
                 result:= 'Wield(' + IntToStr(MakeWordC(S[3],S[4])) + ') ';
                 after:= 5;
               end;
          $EB: begin
                 result:= 'TradePlayer(' + IntToStr(MakeWordC(S[3],S[4])) + ') ';
                 after:= 5;
               end;
          $E2: begin
                 result:= 'MagicPlayer(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                         + IntToStr(MakeWordC(S[5],S[6])) + ')';
                 after:= 7;
               end;
          $E8: begin
                 result:= 'Accept1()';
                 after:= 3;
               end;
          $CA: begin
                 result:= 'Accept2()';
                 after:= 3;
               end;
          $E9: begin
                 result:= 'Decline()';
                 after:= 3;
               end;
          $EA: begin
                 result:= 'PutTrade(';
                 f:= 4;
                 While(f+5<=Length(S))Do Begin
                   if(f>4)then
                     result:= result + ',';
                   result:=result + IntToStr(MakeWordC(S[f], S[f+1]));
                   f:= f + 2;
                   result:=result + ',' + IntToStr(MakeLongC(S[f], S[f+1], S[f+2], S[f+3]));
                   f:= f + 4;
                 End;
                 result:= result + ') ';
                 after:= f;
               end;
          $E4: Begin
                 result:= 'AttackPlayer('  + IntToStr(MakeWordC(S[3],S[4])) + ')';
                 LastAttackedPlayer:= MakeWordC(S[3],S[4]);
                 after:= 5;
               end;
          $E3: begin
                 result:='Magic(' + IntToStr(MakeWordC(S[3], S[4])) + ')';
                 after:= 5;
               end;
          $CD: Begin
                 result:='Deposit(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                        + IntToStr(MakeWordC(S[5],S[6])) + ') ';
                 after:= 7;
               End;
          $CE: Begin
                 result:='Withdraw(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                        + IntToStr(MakeWordC(S[5],S[6])) + ') ';
                 after:= 7;
               End;
          $ED: Begin
                 result:= 'Answer(' + IntToStr(Ord(S[3])) + ') ';
                 after:= 4;
               End;
          $F6: Begin
                 result:= 'UseItem(' + IntToStr(MakeWordC(S[3],S[4])) + ') ';
                 after:= 5;
               End;
          $FB: Begin
                 result:= 'DropItem(' + IntToStr(MakeWordC(S[3],S[4])) + ') ';
                 after:= 5;
               End;
          $DA: Begin
                 result:= 'CloseShop() ';
               End;
          $CF: Begin
                 result:= 'CloseBank() ';
               End;
          $05: Begin
                 result:= 'Ping()';
                 after:= 3;
               End;
          $FC: Begin
                 result:='TakeItem(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                     + IntToStr(MakeWordC(S[5],S[6])) + ','
                                     + IntToStr(MakeWordC(S[7],S[8]))+ ') ';
                 after:= 9;
               End;
          $E5: Begin
                 result:= 'CloseDoor(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                     + IntToStr(MakeWordC(S[5],S[6])) + ','
                                     + IntToStr(Ord(S[7]))+ ') ';
                 after:= 8;
               End;
          $EE: Begin
                 result:= 'OpenDoor(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                     + IntToStr(MakeWordC(S[5],S[6])) + ','
                                     + IntToStr(Ord(S[7]))+ ') ';
                 after:= 8;
               End;
          $EF: begin
                 result:= 'WithItemAtDoor(' + IntToStr(MakeWordC(S[3],S[4])) + ','
                                     + IntToStr(MakeWordC(S[5],S[6])) + ','
                                     + IntToStr(Ord(S[7]))+ ','
                                     + IntToStr(MakeWordC(S[8],S[9])) + ') ';
                 after:= 10;
               end;
          $01: Begin
                 result:= 'CloseClient() ';
               End;
          $D9: Begin
                 result:= 'BuyItem(' + IntToStr(MakeWordC(S[3], S[4])) + ','
                                     + IntToStr(MakeLongC(S[5], S[6], S[7], S[8])) + ') ';
                 after:= 9;
               End;
          $D8: Begin
                 result:= 'SellItem(' + IntToStr(MakeWordC(S[3], S[4])) + ','
                                      + IntToStr(MakeLongC(S[5], S[6], S[7], S[8])) + ') ';
                 after:= 9;
               End;
          $DC: Begin
                 result:= 'MagicOnItemByPos(' + IntToStr(MakeWordC(S[3], S[4])) + ','
                                              + IntToStr(MakeWordC(S[5], S[6])) + ') ';
                 after:= 7;
               End;
{          $FA: Begin
                 If(MakeWordC(S[7], S[8]) = $0E)Then Begin
                   result:= 'SetFire_(' + IntToStr(MakeWordC(S[3], S[4])) + ','
                                       + IntToStr(MakeWordC(S[5], S[6])) + ','
                                       + IntToStr(MakeWordC(S[7], S[8])) + ','
                                       + IntToStr(MakeWordC(S[9], S[10])) + ')';
                 End;
               End;}
          $F0: Begin
                 result:= 'UseItemWithItem(' + IntToStr(MakeWordC(S[3], S[4])) + ','
                                             + IntToStr(MakeWordC(S[5], S[6])) + ') ';
                 after:= 7;
               End;
          $D4: Begin
                 result:= 'PrayerOn(' + IntToStr(Ord(S[3])) + ')';
                 after:= 4;
               End;
          $D3: Begin
                 result:= 'PrayerOff(' + IntToStr(Ord(S[3])) + ')';
                 after:= 4;
               End;
          $E7: Begin
                 result:= 'FightMode(' + IntToStr(Ord(S[3])) + ')';
                 after:= 4;
               End;
          $FA: Begin
                 result:='PickItemWithItem('
                                     + IntToStr(MakeWordC(S[3],S[4])) + ','
                                     + IntToStr(MakeWordC(S[5],S[6])) + ','
                                     + IntToStr(MakeWordC(S[7],S[8])) + ','
                                     + IntToStr(MakeWordC(S[9],S[10]))+ ') ';
                 after:= 11;
               End;
          $00, $13:  begin
                 uhash:= MakeLongC(S[7], S[8], S[9], S[10]);
                 uhash:= uhash shl 32;
                 uhash:= uhash or MakeLongC(S[11], S[12], S[13], S[14]);
                 result:= '---Logging in, vers = ' + IntToStr(MakeWordC(S[3], S[4]))+
                          ', sid = ' + IntToStr(MakeWordC(S[5], S[6]))+
                          ', user = ' + LongToName(uhash)+
                          ', cid = ' + IntToStr(MakeLongC(S[Length(S)-3], S[Length(S)-2], S[Length(S)-1], S[Length(S)]))
                          ;
               end;
          $1C: begin
                 uhash:= MakeLongC(S[3], S[4], S[5], S[6]);
                 uhash:= uhash shl 32;
                 uhash:= uhash or MakeLongC(S[7], S[8], S[9], S[10]);
                 result:= 'PM(' + Hexy(Copy(S, 11, Length(S))) + ') ' + #13#10;
                 result:= result + 'PM: ' + LongToName(uhash) + '<< ' + ExtractMessage2(S, 11, Length(S)-10);
                 
               end;


        End;
end;



function NiceLookCommand(S:String; OutGoing: Boolean):String;
var cmd: Byte;
    f, after: Integer;
    c: char;

Begin
  result:= Hexy(S);
  If(Form1.ShowAsText1.Checked)Then
    result:= S;
  If(Length(S)>1)and(CommandLength(S) = Length(S)-1)Then Begin

    //Move the parameter back to the end
    //RS chunk structure - Length LastParamByte CommandByte Params...
    for f:=2 To Length(S)-1 Do Begin
      c:= S[f];
      S[f]:= S[f+1];
      S[f+1]:= c;
    End;
    cmd:= Ord(S[2]);
    after:= 0;
    Try
      If(OutGoing)and(not Form1.ShowAsHex1.Checked)and(not Form1.ShowAsText1.Checked)Then Begin
        OutgoingCommandToText(result, S, cmd, after);

      End Else Begin

      End;
      if(after > 0)and(after <= Length(S))then
      begin
        result:= result + #13#10'Longer command!!! ' + Hexy(S);
      end;
    Except
      If(not ControlSafeMode)Then Begin
        Form1.txtData.Lines.Add('Error while processing command '+Hexy(S));
        Form1.txtDebug.Lines.Add('Error while processing command '+Hexy(S));
      End;
    End;
  End;

End;




procedure ProcessAllData;
var
    S1, S:String;
    AllCommand, OutCmd, CCmd: String;
    l: Integer;
//    OldC: Char;
begin
  //This is where we can do miracle :)
  if(OutGoing)Then
    S1:= '-------Out-------'
  Else
    S1:= '-------In--------';

  //Split in Runescape chunks, process seperately
  S:= ConnectionData;
  AllCommand:= '';
  CCmd:= '';
  OutCmd:= '';

  if(not Outgoing)then
  begin
    IncomingData:= IncomingData + S;
    if(DeleteIncomingBytes > 0)then
    begin
      if(Length(IncomingData)<DeleteIncomingBytes)then
      begin
        DeleteIncomingBytes:= DeleteIncomingBytes - Length(S);
        OutCmd:= OutCmd + IncomingData;
        IncomingData:= '';
      end else
      begin
        OutCmd:= OutCmd + Copy(IncomingData, 1, DeleteIncomingBytes);
        Delete(IncomingData, 1, DeleteIncomingBytes);
        DeleteIncomingBytes:= 0;
      end;
    end;
    AllCommand:= IncomingData;
  end else
  begin  //if outgoing
    OutgoingData:= OutgoingData + S;
{    if(ProcessingScriptLine)then
    begin
      DebugTextAdd('====------=========-======== Script + Send, trying to prevent lag');
      Exit;
    end;}
    if(DeleteOutgoingBytes > 0)then
    begin
      if(Length(OutgoingData)<DeleteOutgoingBytes)then
      begin
        DeleteOutgoingBytes:= DeleteOutgoingBytes - Length(S);
        OutCmd:= OutCmd + OutgoingData;
        OutgoingData:= '';
      end else
      begin
        OutCmd:= OutCmd + Copy(OutgoingData, 1, DeleteOutgoingBytes);
        Delete(OutgoingData, 1, DeleteOutgoingBytes);
        DeleteOutgoingBytes:= 0;
      end;
    end;
    AllCommand:= OutgoingData;
  end;

  While(AllCommand<>'')and(CommandLength(AllCommand)<Length(AllCommand))Do Begin

    If(SplitCommand<>'')Then Begin
      SplitCommand:= '';
//      DebugTextAdd('After: ' + Hexy(AllCommand));
    End;
{    If(SplitCommand<>'')Then Begin
      CCmd:= Copy(AllCommand, 1, SplitLength-Length(SplitCommand));
      Delete(AllCommand, 1, SplitLength-Length(SplitCommand));
      CCmd:= SplitCommand + CCmd;
      SplitCommand:= '';

      CCmd:= '';

    End Else}
    Begin
      l:= CommandLength(AllCommand);
      CCmd:= Copy(AllCommand, 1, l+1);
      Delete(AllCommand, 1, l+1);
      if(not Outgoing)then
        Delete(IncomingData, 1, l+1)
      else
        Delete(OutgoingData, 1, l+1)
    End;


//    OldC:= #0;

    if(Ccmd <> '')then
    begin
//      if(CmdPos(Ccmd) > 0)then
//        OldC:= Ccmd[CmdPos(Ccmd)];

//      DebugTextAdd('OldCmd=' + IntToStr(Ord(OldC)) + ' (' + Hexy(OldC) + ')');


      if(not OutGoing)then
        DecryptCommandIn(Ccmd)
      else
      begin
//        DebugTextAdd('Command undecrypted: '+Hexy(Ccmd));
        DecryptCommandOut(Ccmd);
      end;

//      if(CmdPos(Ccmd) > 0)then
//        DebugTextAdd('NewCmd=' + IntToStr(Ord(Ccmd[CmdPos(Ccmd)])) + ' (' + Hexy(Ccmd[CmdPos(Ccmd)]) + ')');

        FilterTheCommand(CCmd, Outgoing, LastThread);

    end;



    If(Form1.chkShowData.Checked)and(CCmd<>'')Then Begin
      If(Form1.CanDisplayCommand(CCmd, Outgoing))Then Begin
        DebugTextAdd(NiceLookCommand(CCmd, OutGoing));
      End;
    End;


    if(Ccmd<>'')then
    begin
      if(OutGoing)then
      begin
        //EEE EncryptCommandForServer(Ccmd);
      end else
      begin
        EncryptCommandForClient(Ccmd);
      end;
    end;


    OutCmd:= OutCmd + CCmd;
  End;

  PreviousCommand:= ConnectionData;

  ConnectionData:= OutCmd;


end;

procedure HideTitlebar(Form: TForm);
var
  Save: LongInt;
begin
  Save:= GetWindowLong(Form.Handle,gwl_Style);
  If (Save and ws_Caption)=ws_Caption then
    SetWindowLong(Form.Handle,gwl_Style,Save and (not(ws_Caption)) and not WS_BORDER and WS_THICKFRAME);
  Form.Height:=Form.Height-getSystemMetrics(sm_cyCaption);
  Form.Refresh;
end;



procedure TForm1.FormCreate(Sender: TObject);
var f: Integer;
    t: textfile;
    s: string;
    fd: file of byte;
begin

  HideTitlebar(Self);


  Randomize;

  if(FileExists(ExtractFilePath(Application.Exename) + 'port.txt'))then
  begin
    AssignFile(t, ExtractFilePath(Application.Exename) + 'port.txt');
    FileMode:= 0;
    Reset(t);
    Readln(t, s);
    txtListenPort.Text:= s;
    CloseFile(t);
    FileMode:= 2;
  end;

  TCPMap.DefaultPort:= StrToInt(txtListenPort.Text);

  TCPMap.Active:= True;

//M2  Map2.Active:= True;

  cmbOutIn.ItemIndex:= 0;

  PingThread:= nil;

//  CS:= TCriticalSection.Create;

  If(FileExists(ExtractFilePath(Application.Exename) + 'filter.txt'))Then
    lstFilter.Items.LoadFromFile(ExtractFilePath(Application.Exename) + 'filter.txt');

  if(FileExists(ExtractFilePath(Application.Exename) + 'serverswitch_servers.txt'))Then
    ServerHosts.Items.LoadFromFile(ExtractFilePath(Application.Exename) + 'serverswitch_servers.txt');

  if(FileExists(ExtractFilePath(Application.Exename) + 'serverswitch_ports.txt'))Then
    ServerPorts.Items.LoadFromFile(ExtractFilePath(Application.Exename) + 'serverswitch_ports.txt');

  If(lstFilter.Items.IndexOf('-06')>=0)Then Begin
    TBItem15.Checked:= True;
  End;

  For f:= 0 To lstFilter.Items.Count - 1 do begin
    lstFilter.Checked[f]:= True;
  End;


  ClearItems;
  ClearShop;

  FillChar(VisibleObjects, SizeOf(VisibleObjects), -1);

  //--- Initialize user interface
  OpenDialog1.InitialDir:= ExtractFilePath(Application.ExeName) + 'Scripts\';
  SaveDialog1.InitialDir:= ExtractFilePath(Application.ExeName) + 'Scripts\';

  MyX:= -1;

  Timer1.Enabled:= True;

  Stopped:= True;

  CanUseThisBot:= False;

  LastItemLost:= -1;
  LastItemGained:= -1;

  ResetVarsEvents;
  OnLogin:= -1;

  LoadSettingsFromReg;

  if(FileExists(ExtractFilePath(Application.Exename) + 'user.txt'))then
  begin
    txtData.Lines.LoadFromFile(ExtractFilePath(Application.Exename) + 'user.txt');
    RSUserName:= txtData.Lines[0];
    RSPass:= txtData.Lines[1];
  end;

  //LoadWords;

  For f:= Low(Commands) To High(Commands) Do Begin
    SynAutoComplete.InsertList.Add(Commands[f]);
    SynAutoComplete.ItemList.Add(CommandDescs[f]);
  End;

  DebugTextAdd(DateToStr(Date()) + ' ' + TimeToStr(Time()) + '--- Application initialized');

  CS:= TCriticalSection.Create;

  TCPMap.OnBeforeConnect:= TCPMapBeforeConnect;
//  TCPMap.OnEveryCycle:= TCPMapOnEveryCycle;

  if(FileExists(ExtractFilePath(Application.Exename) + 'bigmap.dat'))then
  begin
    AssignFile(fd, ExtractFilePath(Application.Exename) + 'bigmap.dat');
    Reset(fd);
    BlockRead(fd, BigMap, SizeOf(BigMap));
    CloseFile(fd);
  end;

  try
    RegisterHotKey(Handle,1,MOD_CONTROL + MOD_ALT, ord('1'));
    RegisterHotKey(Handle,2,MOD_CONTROL + MOD_ALT, ord('2'));
    RegisterHotKey(Handle,3,MOD_CONTROL + MOD_ALT, ord('3'));
    RegisterHotKey(Handle,4,MOD_CONTROL + MOD_ALT, ord('4'));
    RegisterHotKey(Handle,5,MOD_CONTROL + MOD_ALT, ord('5'));
    RegisterHotKey(Handle,6,MOD_CONTROL + MOD_ALT, ord('6'));
    RegisterHotKey(Handle,7,MOD_CONTROL + MOD_ALT, ord('7'));
    RegisterHotKey(Handle,8,MOD_CONTROL + MOD_ALT, ord('8'));
    RegisterHotKey(Handle,9,MOD_CONTROL + MOD_ALT, ord('9'));
  except
  end;

  MyIntercept:= TIdConnectionIntercept.Create(nil);
  MyIntercept.OnReceive:= MyInterceptReceive;
  MyIntercept.OnSend:= MyInterceptSend; 

  LastFileAge:=FileAge(ExtractFilePath(Application.Exename) + 'slword.txt');
  
end;

constructor TIdMappedPortTCPData.Create;
begin
  ReadList := TList.Create;
end;

destructor TIdMappedPortTCPData.Destroy;
begin
  FreeAndNil(ReadList);
  FreeAndNil(OutboundClient);
  inherited;
end;

procedure TForm1.txtListenPortChange(Sender: TObject);
begin
  TCPMap.Active:= False;
  TCPMap.DefaultPort:= StrToInt(txtListenPort.Text);
  TCPMap.Bindings.Clear;
  TCPMap.Bindings.DefaultPort:= StrToInt(txtListenPort.Text);
  TCPMap.Active:= True;

//M2  Map2.Active:= False;
//M2  Map2.DefaultPort:= 43594;
//M2  Map2.Bindings.Clear;
//M2  Map2.Bindings.DefaultPort:= 43594;
//M2  Map2.Active:= True;
end;


procedure TForm1.btnSendClick(Sender: TObject);
var S: string;
begin
  S:= txtSendData.Text;
  S:= HexToStr(S);

  If(chkClientSend.Checked)Then Begin
    if(TBItem38.Checked)then
      DebugTextAdd('>> ' + Hexy(S));
    EncryptCommandForClient(S);
    LastThread.Connection.Write( S);

  End Else Begin
    if(TBItem38.Checked)then
      DebugTextAdd('>> ' + Hexy(S));
    //EEE EncryptCommandForServer(S);
    LastClient.Write( S);
  End;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  txtData.Clear;
  txtDebug.Clear;

end;

procedure TForm1.Add1Click(Sender: TObject);
var S: String;
begin
  S:= InputBox('Enter the chunk or command to filter out','Hex value:','');
  If(S<>'')Then Begin
    S:= UpperCase(Trim(S));
    If(not (S[1] in [':','-']))Then Begin
      S:= S + ' ';
    End Else Begin

    End;
    lstFilter.Items.Add(S);
    lstFilter.Checked[lstFilter.Items.Count - 1]:= True;
  End;
end;

procedure TForm1.Remove1Click(Sender: TObject);
begin
  if(lstFilter.ItemIndex<>-1)Then Begin
    lstFilter.ItemIndex:= lstFilter.ItemIndex - 1;
    lstFilter.Items.Delete(lstFilter.ItemIndex + 1);
  End;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var f:Integer;
begin
    If(txtUserScript.Modified)Then Begin
      f:= MessageBox(Handle, 'Do you want to save the script?', 'Exit AutoRune', MB_YESNOCANCEL);
      If(f = idYes)Then Begin
        Action:= caNone;
        SaveScript1Click(nil);
      End Else If(f = IDCANCEL)Then Begin
        Action:= caNone;
      End;
    End;
    If(Action<>caNone)Then Begin
      tcpMap.Active:= False;
      f:= lstFilter.Items.IndexOf('-06');
      If(f>=0)and(not lstFilter.Checked[f]) Then Begin
        lstFilter.Items.Delete(f);
      End;
      lstFilter.Items.SaveToFile(ExtractFilePath(Application.Exename) + 'filter.txt');
      ServerHosts.Items.SaveToFile(ExtractFilePath(Application.Exename) + 'serverswitch_servers.txt');
      ServerPorts.Items.SaveToFile(ExtractFilePath(Application.Exename) + 'serverswitch_ports.txt');

      SaveSettingsToReg;
      txtData.Clear;
      txtData.Lines.Add(RSUserName);
      txtData.Lines.Add(RSPass);
      txtData.Lines.SaveToFile(ExtractFilePath(Application.Exename) + 'user.txt');
      CS.Free;
    End;
    SaveBigMap;
end;

procedure TForm1.SaveBigMap;
var
  fd: file of byte;
begin
    if(LastMapX <> 0)or(LastMapY <> 0)then
    begin
      AssignFile(fd, ExtractFilePath(Application.Exename) + 'bigmap.dat');
      Rewrite(fd);
      BlockWrite(fd, BigMap, SizeOf(BigMap));
      CloseFile(fd);
    end;
end;

procedure TForm1.ShowAsHex1Click(Sender: TObject);
begin
  ShowAsHex1.Checked:= not ShowAsHex1.Checked;
end;




procedure TForm1.ProcessNextEvent;
var f: Integer;
begin
  If(Length(EventQueue)>0)and(not InEvent)Then Begin
    InEvent:= True;
    SaveCPUStats;
    Case EventQueue[0].num of
      1: Begin
           If(DebugInfo)Then Begin
             txtData.Lines.Add('--(debug)-- Event OnItemLost');
             txtDebug.Lines.Add('--(debug)-- Event OnItemLost');
           End;
           PutInERetStack(CP-1);
           CP:= OnItemLost;
           Vars[OnItemLostItem]:= EventQueue[0].Params[1];
           Vars[OnItemLostPos]:= EventQueue[0].Params[2];
         End;
      2: Begin
           If(DebugInfo)Then Begin
             txtData.Lines.Add('--(debug)-- Event OnItemGained');
             txtDebug.Lines.Add('--(debug)-- Event OnItemGained');
           End;
           PutInERetStack(CP-1);
           CP:= OnItemGained;
           Vars[OnItemGainedItem]:= EventQueue[0].Params[1];
           Vars[OnItemGainedPos]:= EventQueue[0].Params[2];
         End;
      3: Begin
           If(DebugInfo)Then Begin
             txtData.Lines.Add('--(debug)-- Event OnServerMessage');
             txtDebug.Lines.Add('--(debug)-- Event OnServerMessage');
           End;
           PutInERetStack(CP-1);
           CP:= OnServerMessage;
         End;
      4: Begin
           If(DebugInfo)Then Begin
             txtData.Lines.Add('--(debug)-- Event OnPrivateMessage');
             txtDebug.Lines.Add('--(debug)-- Event OnPrivateMessage');
           End;
           PutInERetStack(CP-1);
           CP:= OnPrivateMessage;
         End;
      5: Begin
           If(DebugInfo)Then Begin
                     txtData.Lines.Add('--(debug)-- Event OnCoordsChanged '+ IntToStr(OnCoordsChanged-1));
                     txtDebug.Lines.Add('--(debug)-- Event OnCoordsChanged '+ IntToStr(OnCoordsChanged-1));
           End;
           PutInERetStack(CP-1);
           CP:= OnCoordsChanged;
           Vars[OnCoordsChangedLastX]:= EventQueue[0].Params[1];
           Vars[OnCoordsChangedLastY]:= EventQueue[0].Params[2];
         End;
      6: Begin
           If(DebugInfo)Then Begin
                     txtData.Lines.Add('--(debug)-- Event OnDestinationReached');
                     txtDebug.Lines.Add('--(debug)-- Event OnDestinationReached');
           End;
           PutInERetStack(CP-1);
           CP:= OnDestinationReached;
         End;
      7: Begin
           If(DebugInfo)Then Begin
                     txtData.Lines.Add('--(debug)-- Event OnIdleTime');
                     txtDebug.Lines.Add('--(debug)-- Event OnIdleTime');
           End;
           PutInERetStack(CP-1);
           CP:= OnIdle;
         End;
      8: Begin
           If(DebugInfo)Then Begin
             txtData.Lines.Add('--(debug)-- Event OnHPChanged');
             txtDebug.Lines.Add('--(debug)-- Event OnHPChanged');
           End;
           PutInERetStack(CP-1);
           CP:= OnHPChanged;
           Vars[OnHPChangedHP]:= EventQueue[0].Params[1];
         End;
      9: Begin
           If(DebugInfo)Then Begin
             txtData.Lines.Add('--(debug)-- Event OnStatsChanged');
             txtDebug.Lines.Add('--(debug)-- Event OnStatsChanged');
           End;
           PutInERetStack(CP-1);
           CP:= OnStatsChanged;
           Vars[OnStatsChangedStat]:= EventQueue[0].Params[1];
         End;
      10: Begin
            If(DebugInfo)Then Begin
              txtData.Lines.Add('--(debug)-- Event OnChatMessage');
              txtDebug.Lines.Add('--(debug)-- Event OnChatMessage');
            End;
            PutInERetStack(CP-1);
            CP:= OnChatMessage;
          End;
      11: Begin
            If(DebugInfo)Then Begin
              txtData.Lines.Add('--(debug)-- Event OnShopClosed');
              txtDebug.Lines.Add('--(debug)-- Event OnShopClosed');
            End;
            PutInERetStack(CP-1);
            CP:= OnShopClosed;
          End;
      12: Begin
           If(DebugInfo)Then Begin
             txtData.Lines.Add('--(debug)-- Event OnNPCAppeared');
             txtDebug.Lines.Add('--(debug)-- Event OnNPCAppeared');
           End;
           PutInERetStack(CP-1);
           CP:= OnNPCAppeared;
           Vars[OnNPCAppearedID]:= EventQueue[0].Params[1];
           Vars[OnNPCX]:= EventQueue[0].Params[2];
           Vars[OnNPCY]:= EventQueue[0].Params[3];
           Vars[OnNPCType]:= EventQueue[0].Params[4];
          End;
      13: Begin
           If(DebugInfo)Then Begin
             txtData.Lines.Add('--(debug)-- Event OnItemAppeared');
             txtDebug.Lines.Add('--(debug)-- Event OnItemAppeared');
           End;
           PutInERetStack(CP-1);
           CP:= OnItemAppeared;
           Vars[OnItemID]:= EventQueue[0].Params[1];
           Vars[OnItemX]:= EventQueue[0].Params[2];
           Vars[OnItemY]:= EventQueue[0].Params[3];
          End;
      14: Begin
           If(DebugInfo)Then Begin
             txtData.Lines.Add('--(debug)-- Event OnNPCMoved');
             txtDebug.Lines.Add('--(debug)-- Event OnNPCMoved');
           End;
           PutInERetStack(CP-1);
           CP:= OnNPCMoved;
           Vars[OnNPCMovedID]:= EventQueue[0].Params[1];
           Vars[OnNPCNewX]:= EventQueue[0].Params[2];
           Vars[OnNPCNewY]:= EventQueue[0].Params[3];
           Vars[OnNPCMovedTips]:= EventQueue[0].Params[4];

          End;
      15: Begin
           If(DebugInfo)Then Begin
             txtData.Lines.Add('--(debug)-- Event OnObject');
             txtDebug.Lines.Add('--(debug)-- Event OnObject');
           End;
           PutInERetStack(CP-1);
           CP:= OnObject;
           Vars[OnObjectType]:= EventQueue[0].Params[1];
           Vars[OnObjectX]:= EventQueue[0].Params[2];
           Vars[OnObjectY]:= EventQueue[0].Params[3];
          End;
      16: Begin
            If(DebugInfo)Then Begin
              txtData.Lines.Add('--(debug)-- Event OnRetryDest');
              txtDebug.Lines.Add('--(debug)-- Event OnRetryDest');
            End;
            PutInERetStack(CP-1);
            CP:= OnRetryDest;
          End;
      17: Begin
            If(DebugInfo)Then Begin
              txtData.Lines.Add('--(debug)-- Event OnSkipDest');
              txtDebug.Lines.Add('--(debug)-- Event OnSkipDest');
            End;
            PutInERetStack(CP-1);
            CP:= OnSkipDest;
          End;
      18: Begin
            If(DebugInfo)Then Begin
              txtData.Lines.Add('--(debug)-- Event OnCheatDest');
              txtDebug.Lines.Add('--(debug)-- Event OnCheatDest');
            End;
            PutInERetStack(CP-1);
            CP:= OnCheatDest;
          End;
      19: Begin
            If(DebugInfo)Then Begin
              txtData.Lines.Add('--(debug)-- Event OnQuestMenuAppeared');
              txtDebug.Lines.Add('--(debug)-- Event OnQuestMenuAppeared');
            End;
            PutInERetStack(CP-1);
            CP:= OnQuestMenuAppeared;
          End;
      20: Begin
            If(DebugInfo)Then Begin
              txtData.Lines.Add('--(debug)-- Event OnTimer');
              txtDebug.Lines.Add('--(debug)-- Event OnTimer');
            End;
            PutInERetStack(CP-1);
            CP:= TJumps[EventQueue[0].Params[1]];
          End;
      21: Begin
            If(DebugInfo)Then Begin
              txtData.Lines.Add('--(debug)-- Event OnLogin');
              txtDebug.Lines.Add('--(debug)-- Event OnLogin');
            End;
            PutInERetStack(CP-1);
            CP:= OnLogin;
          End;
      22: Begin
            If(DebugInfo)Then Begin
              txtData.Lines.Add('--(debug)-- Event OnItemDisappeared');
              txtDebug.Lines.Add('--(debug)-- Event OnItemDisappeared');
            End;
            PutInERetStack(CP-1);
            CP:= OnItemDisappeared;
            Vars[OnItemDisID]:= EventQueue[0].Params[1];
            Vars[OnItemDisX]:= EventQueue[0].Params[2];
            Vars[OnItemDisY]:= EventQueue[0].Params[3];
          End;
      23: Begin
            PutInERetStack(CP-1);
            CP:= OnTradeClosed;
          End;
      24: Begin
            PutInERetStack(CP-1);
            CP:= OnTrade1;
          End;
      25: Begin
            PutInERetStack(CP-1);
            CP:= OnTrade2;
          End;
      26: Begin
            PutInERetStack(CP-1);
            CP:= OnTradeAccept;
          End;

    End;
    for f:= 0 to Length(EventQueue) - 2 do begin
      EventQueue[f]:= EventQueue[f+1];
    end;
    SetLength(EventQueue, Length(EventQueue) - 1);
  End;

end;

procedure TForm1.SaveCPUStats;
begin
  _DestX:= DestX;
  _DestY:= DestY;
  _TimeSinceMovingToDest:= TimeSinceMovingToDest;
  _WaitTime:= WaitTime;
  _WaitForCoordChange:= WaitForCoordChange;
  _WaitForBankWindow:= WaitForBankWindow;
  _WaitForShopWindow:= WaitForShopWindow;
  _WaitForQuestMenu:= WaitForQuestMenu;
  _WaitForServerMessage:= WaitForServerMessage;
  _ScriptIdle:= ScriptIdle;
  _RepeatCP:= RepeatCP;
  _AltDest:= AltDest;
end;

procedure TForm1.RestoreCPUStats;
begin
  DestX:= _DestX;
  DestY:= _DestY;
  TimeSinceMovingToDest:= _TimeSinceMovingToDest;
  WaitTime:= _WaitTime;
  WaitForCoordChange:= _WaitForCoordChange;
  WaitForBankWindow:= _WaitForBankWindow;
  WaitForShopWindow:= _WaitForShopWindow;
  WaitForQuestMenu:= _WaitForQuestMenu;
  WaitForServerMessage:= _WaitForServerMessage;
  ScriptIdle:= _ScriptIdle;
  RepeatCP:= _RepeatCP;
  AltDest:= _AltDest;
end;



procedure TForm1.ResetScriptStats;
Begin
  DestX:= 0;
  DestY:= 0;
  TimeSinceMovingToDest:= 0;
  WaitTime:= 0;
  WaitForCoordChange:= False;
  WaitForBankWindow:= False;
  WaitForShopWindow:= False;
  WaitForQuestMenu:= False;
  WaitForServerMessage:= False;
  ScriptIdle:= 0;
  Stopped:= False;
  RepeatCP:= -1;
  AltDest:= nil;
End;

procedure TForm1.ExecuteScript(var CP: Integer);
var S, TempS, Blah:String;
    RC: Integer;
    ImmediateLines: Integer;
    ExecutedLines: Integer;
    Startxt: Integer;
    DontEnc: Boolean;
begin
  if(not CanUseThisBot)then
    Exit;
  if(PingThread=nil)then
    Exit;
  While(Length(EventQueue) > 0)and(not InEvent)Do Begin
    ProcessNextEvent;
  End;
  If(RepeatCP <> -1)and(not InEvent)Then
    CP:= RepeatCP - 1;
  RC:= RepeatCP;
  ResetScriptStats;
  RepeatCP:= RC;
  ImmediateLines:= 0;
  Stopped:= False;
  Startxt:= xt;
//  txtDebug.Lines.Add('--(debug)-- Baga - skripts palaidaas');
  If(txtScript.Lines.Count = 0)Then Exit;
  S:= '';

  If(CP < txtScript.Lines.Count)and(LoggedIn)Then Begin
    ExecutedLines:= 0;
    ProcessingScriptLine:= True;
    repeat


      ExecutedLines:= ExecutedLines + 1;
      If(ImmediateLines > 0)Then Begin
        ImmediateLines:= ImmediateLines - 1;
      End;
      DontEnc:= False;


      TempS:= ProcessScriptLine(txtScript.Lines[CP], ImmediateLines, DontEnc);
      if(ProcessingOutgoingCommand)then
      begin
//        DebugTextAdd('===Trying to avoid lag, waiting...');
      end;
      while(ProcessingOutgoingCommand)do
      begin
        Application.ProcessMessages;
      end;
      if(not DontEnc)and(TempS<>'')then
      begin
        CS.Enter;
        Blah:= NiceLookCommand(TempS, True);
        if(TBItem38.Checked)then
          DebugTextAdd('>> ' + Blah);
        //EEE EncryptCommandForServer(TempS);
        CS.Leave;
      end else if(TempS<>'')then
      begin
        if(TBItem38.Checked)then
          DebugTextAdd('E>> ' + Hexy(TempS));
      end;
      S:= S + TempS;

      If(not ControlSafeMode)Then Begin
        If(Not TBItem19.Checked)and( not((InEvent) and (TBItem18.Checked)))Then Begin
          txtUserScript.Repaint;
          If(txtUserScript.TopLine>CP)or(txtUserScript.TopLine+20<CP)Then
            txtUserScript.TopLine:= CP;
        End;
      End;
      CP:= CP + 1;
      If(CP = txtScript.Lines.Count)Then CP:= 0;
      If(ExecutedLines > 200)Then Begin
//        DebugTextAdd('---(debug)--- The script looped! Check for infinite loops!');
      End;
    until((WaitTime > 0)or(DestX<>0)or(WaitForCoordChange)or(WaitForBankWindow)
        or(WaitForShopWindow)or(WaitForQuestMenu)or(WaitForServerMessage)or(Stopped))and(ImmediateLines = 0)
        or(ExecutedLines>500);

    If(ExecutedLines > 500)Then Begin
      DebugTextAdd('---(debug)--- The script looped! Check for infinite loops!');
      Stopped:= True;
    End;

    if(xt - Startxt > 5)then
    begin
      DebugTextAdd('--- You definitely need Wait between the commands or you will get banned');
      Stopped:= True;
    end;

    //Send the data away
    Try
        If(S<>'')Then Begin
          CS.Enter;
//          DebugTextAdd('-- Data to server: ' + Hexy(S));

          LastClient.Write(S);
          TimeSinceRSPing:= 0;
          CS.Leave;
        End;
    Except
         on E: Exception do begin
           DebugTextAdd('---(error)--- Connection error: '+ E.Message);
         end;
    End;
    ProcessingScriptLine:= False;

  End;
end;



//If it's something to send to server, then returns it, otherwise
//returns empty string
function TForm1.ProcessScriptLine(S: String; var ImmediateLines: Integer; var DontEncrypt: Boolean):String;
var f: Integer;
    CommandName: String;
    AllParams: String;
    CParam: String;
    Params, Aid, Vals: TIntegerArray;
    A: TIntegerArray;
    b: Boolean;
    TempS: String;
    x, y: Integer;
    U: Int64;
begin
  result:= '';
  DontEncrypt:= False;
  S:= Trim(S);
  If(S = '')or(S[1] in CommentChars)Then Begin
    //It's a comment
    Exit;
  End;
  If(DebugInfo)Then Begin
    txtData.Lines.Add('---' +IntToStr(CP) + ':' + S);
    txtDebug.Lines.Add('---' +IntToStr(CP) + ':' + S);
  End;
  CommandName:= '';
  f:= 1;
  While(not (S[f] in ['(',' ']))do begin
    CommandName:= CommandName + S[f];
    f:= f + 1;
  End;
  While(S[f] in ['(', ' '])Do begin
    f:= f + 1;
  end;
  AllParams:= Copy(S, f, Length(S));
  Delete(AllParams,Length(AllParams),1);
  AllParams:= AllParams + ',';
  Params:= nil;
  Vals:= nil;
  CParam:= '';
  For f:= 1 To Length(AllParams) Do Begin
    If(AllParams[f] = ',')Then Begin
      If(Trim(CParam)<>'')Then Begin
        CParam:= Trim(CParam);
        SetLength(Params, Length(Params) + 1);
        SetLength(Vals, Length(Vals) + 1);
        if(CParam[1] <> 'v')then
        begin
          Params[Length(Params) - 1]:= StrToInt(Trim(CParam));
          Vals[Length(Vals) - 1]:= Params[Length(Params) - 1];
        end else
        begin
          Params[Length(Params) - 1]:= StrToInt(Copy(CParam, 2, Length(CParam)));
          if(Params[Length(Params) - 1] >= Low(Vars))and(Params[Length(Params) - 1] <= High(Vars))then
          begin
            Vals[Length(Vals) - 1]:= Vars[Params[Length(Params) - 1]];
          end;
        end;
      End;
      CParam:= '';
    End Else Begin
      CParam:= CParam + AllParams[f];
    End;
  End;

  If(CommandName = 'MoveTo')Then Begin
    TimeSinceMovingToDest:= 0;
    DestX:= Vals[0];
    DestY:= Vals[1];
    If(Length(Vals)>2)Then Begin
      For f:= High(Vals)-1 to High(Vals) do begin
        if(f mod 2 = 0)then begin
          DestX:= DestX + Vals[f];
        end else begin
          DestY:= DestY + Vals[f];
        end;
      End;
    end;
    If(DestX>0)Then
      result:= cmdWalk(Vals,#$C2);
 
  End Else If(CommandName = 'MoveToVarVar')Then Begin
    TimeSinceMovingToDest:= 0;
    DestX:= Vars[Params[0]];
    DestY:= Vars[Params[1]];
    If(DestX>0)Then
      result:= cmdWalk([DestX, DestY],#$C2);
  End Else If(CommandName = 'MoveToRandomly')Then Begin
    TimeSinceMovingToDest:= 0;
    AltDest:= nil;
    SetLength(AltDest,Length(Vals) div 2);
    For f:=0 to Length(AltDest) -1 Do Begin
      AltDest[f].X:= Vals[f*2];
      AltDest[f].Y:= Vals[f*2+1];
    End;
    f:= Random(Length(AltDest));
    DestX:= AltDest[f].X;
    DestY:= AltDest[f].Y;
    If(DestX>0)Then
      result:= cmdWalk([DestX, DestY],#$C2);
  End Else If(CommandName = 'MoveToNoWait')Then Begin
    result:= cmdWalk(Vals,#$C2);
  End Else If(CommandName = 'MoveToNoWaitVarVar')Then Begin
      result:= cmdWalk([Vars[Params[0]], Vars[Params[1]]],#$C2);
  End Else If(CommandName = 'MapMoveTo')Then Begin
      TimeSinceMovingToDest:= 0;
      DestX:= Vals[0];
      DestY:= Vals[1];
      MapMoving:= True;
      FillBigMapWithDistanceNumbers(BigMap, DistNums, MyX+XShift, MyY+YShift, Vals[0],Vals[1],500);
      MakePath(DistNums, MapPath, MyX+XShift, MyY+YShift);
      MakeMoveToCoordList(MapPath, A);
      result:= cmdWalk(A,#$C2);
  End Else If(CommandName = 'MapMoveToNoWait')Then Begin
      FillBigMapWithDistanceNumbers(BigMap, DistNums, MyX+XShift, MyY+XShift, Vals[0],Vals[1], 500);
      MakePath(DistNums, MapPath, MyX+XShift, MyY+XShift);
      MakeMoveToCoordList(MapPath, A);
      result:= cmdWalk(A,#$C2);
  End Else If(CommandName = 'MapMoveToVars')Then Begin
      TimeSinceMovingToDest:= 0;
      DestX:= Vars[Params[0]];
      DestY:= Vars[Params[1]];
      MapMoving:= True;
      FillBigMapWithDistanceNumbers(BigMap, DistNums, MyX, MyY, Vars[Params[0]],Vars[Params[1]], 500);
      MakePath(DistNums, MapPath, MyX+XShift, MyY+XShift);
      MakeMoveToCoordList(MapPath, A);
      result:= cmdWalk(A,#$C2);
  End Else If(CommandName = 'MapMoveToNoWaitVars')Then Begin
      FillBigMapWithDistanceNumbers(BigMap, DistNums, MyX, MyY, Vars[Params[0]],Vars[Params[1]], 500);
      MakePath(DistNums, MapPath, MyX+XShift, MyY+XShift);
      MakeMoveToCoordList(MapPath, A);
      result:= cmdWalk(A,#$C2);
  End Else If(CommandName = 'MapAction')Then Begin
      FillBigMapWithDistanceNumbers(BigMap, DistNums, MyX+XShift, MyY+XShift, Vals[0],Vals[1], 500);
      MakePath(DistNums, MapPath, MyX, MyY);
      MakeMoveToCoordList(MapPath, A);
      result:= cmdWalk(A,#$D7);
  End Else If(CommandName = 'MapActionVar')Then Begin
      FillBigMapWithDistanceNumbers(BigMap, DistNums, MyX, MyY, Vars[Params[0]],Vars[Params[1]], 500);
      MakePath(DistNums, MapPath, MyX+XShift, MyY+XShift);
      MakeMoveToCoordList(MapPath, A);
      result:= cmdWalk(A,#$D7);
  End Else If(CommandName = 'Action')Then Begin
    result:= cmdWalk(Vals,#$D7);
  End Else If(CommandName = 'ActionVarVar')Then Begin
    result:= CoordCommand(Vars[Params[0]], Vars[Params[1]], #$D7);
  End Else If(CommandName = 'AtObject')Then Begin
    result:= CoordCommand(Vals[0], Vals[1], #$F2);
    inc(xt);
  End Else If(CommandName = 'AtObjectVar')Then Begin
    result:= CoordCommand(Vars[Params[0]], Vars[Params[1]], #$F2);
    inc(xt);
  End Else If(CommandName = 'AtObject2')Then Begin
    result:= CoordCommand(Vals[0], Vals[1], #$E6);
    inc(xt);
  End Else If(CommandName = 'AtObjectWithItem')Then Begin
    result:= CoordWordCommand(Vals[0], Vals[1], Vals[2], #$F1);
  End Else If(CommandName = 'AtObjectWithItemByID')Then Begin
    if(InventoryPos(Vals[2])<>-1)then
      result:= CoordWordCommand(Vals[0], Vals[1], InventoryPos(Vals[2]), #$F1);
  End Else If(CommandName = 'SetVarItemPosByID')Then Begin
    Vars[Params[0]]:= InventoryPos(Vals[1]);
  End Else If(CommandName = 'MineNearest')Then Begin
    FindNearestRock(x, y, Vals, 10);
    If(x>0)Then Begin
      GetActionPoint(MyX, MyY, A, x, y,10,False);
      If(Length(A)>0)Then Begin
        TempS:= cmdWalk(A, #$D7);
        //EEE EncryptCommandForServer(TempS);
        result:= TempS;
        TempS:= CoordCommand(x, y, #$F2);
        //EEE EncryptCommandForServer(TempS);
        result:= result + TempS;
        DontEncrypt:= True;
        inc(xt);
      End;
    End;
  End Else If(CommandName = 'MineNearestIn')Then Begin
    Aid:= nil;
    For f:= 4 to Length(Vals) - 1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vals[f];
    end;
    FindNearestRock(x, y, Aid, 10);
    If(x>0)Then Begin
      If(x >= Min(Vals[0], Vals[2]))and(x <= Max(Vals[0], Vals[2]))and
        (y >= Min(Vals[1], Vals[3]))and(y <= Max(Vals[1], Vals[3]))then
      begin
        //DebugTextAdd('Found: x='+IntToStr(x) + ', y='+IntToStr(y));
        GetActionPoint(MyX, MyY, A, x, y,10,False);
        If(Length(A)>0)Then Begin
          TempS:= cmdWalk(A, #$D7);
          //EEE EncryptCommandForServer(TempS);
          result:= TempS;
          TempS:= CoordCommand(x, y, #$F2);
          //EEE EncryptCommandForServer(TempS);
          result:= result + TempS;
          DontEncrypt:= True;
          inc(xt);
        End;
      end;
    End;
  End Else If(CommandName = 'FarActionAtObject')Then Begin
    x:= Vals[0];
    y:= Vals[1];
    If(x>0)Then Begin
      GetActionPoint(MyX, MyY, A, x, y,15,False);
      If(Length(A)>0)Then Begin
        //EEE result:= EncryptCommandForServerF(cmdWalk(A, #$D7)) +
        result:= cmdWalk(A, #$D7) +
        //EEE EncryptCommandForServerF(CoordCommand(x,y, #$F2));
        CoordCommand(x,y, #$F2);
        DontEncrypt:= True;
        inc(xt);
      End;
    End;
  End Else If(CommandName = 'FarAction')Then Begin
    x:= Vals[0];
    y:= Vals[1];
    If(x>0)Then Begin
      GetActionPoint(MyX, MyY, A, x, y,15,True);
      If(Length(A)>0)Then Begin
        result:= cmdWalk(A, #$D7);
      End;
    End;
  End Else If(CommandName = 'FarActionNoReach')Then Begin
    x:= Vals[0];
    y:= Vals[1];
    If(x>0)Then Begin
      GetActionPoint(MyX, MyY, A, x, y,15,False);
      If(Length(A)>0)Then Begin
        result:= cmdWalk(A, #$D7);
      End;
    End;
  End Else If(CommandName = 'FarMoveTo')Then Begin
    x:= Vals[0];
    y:= Vals[1];
    If(x>0)Then Begin
      GetActionPoint(MyX, MyY, A, x, y,10,True);
      If(Length(A)>0)Then Begin
        TimeSinceMovingToDest:= 0;
        DestX:= x;
        DestY:= y;
        If(DestX>0)Then
          result:=  cmdWalk(A,#$C2);
        End;
    End;
  End Else If(CommandName = 'FarActionVar')Then Begin
    x:= Vars[Params[0]];
    y:= Vars[Params[1]];
    If(x>0)Then Begin
      GetActionPoint(MyX, MyY, A, x, y,15,True);
      If(Length(A)>0)Then Begin
        result:= cmdWalk(A, #$D7);
      End;
    End;
  End Else If(CommandName = 'FarMoveToVar')Then Begin
    x:= Vars[Params[0]];
    y:= Vars[Params[1]];
    If(x>0)Then Begin
      GetActionPoint(MyX, MyY, A, x, y,10,True);
      If(Length(A)>0)Then Begin
        TimeSinceMovingToDest:= 0;
        DestX:= x;
        DestY:= y;
        If(DestX>0)Then
          result:=  cmdWalk(A,#$C2);
        End;
    End;
  End Else If(CommandName = 'TalkToNPC')Then Begin
    f:= Random(Length(Vals));
    result:= WordCommand(Vals[f], #$F5);
  End Else If(CommandName = 'TalkToNPCVar')Then Begin
    f:= Random(Length(Params));
    result:= WordCommand(Vars[Params[f]], #$F5);
  End Else If(CommandName = 'FleeFromNPC')Then Begin
    FleeFromNPC(MapPath, Vals[0], False, Vals[1], Vals[2]);
    MakeMoveToCoordList(MapPath, A);
    result:= cmdWalk(A,#$C2);
  End Else If(CommandName = 'SetVarDistanceToNPC')Then Begin
    //Calculate distance to nearest NPC
    FleeFromNPC(MapPath, Vars[Params[0]], True, 0, 0);
  End Else If(CommandName = 'AttackNPC')Then Begin
    f:= Random(Length(Vals));
    result:= WordCommand(Vals[f], #$F4);
    inc(xt);
  End Else If(CommandName = 'AttackNPCVar')Then Begin
    f:= Random(Length(Params));
    result:= WordCommand(Vars[Params[f]], #$F4);
    inc(xt);
  End Else If(CommandName = 'AttackPlayer')Then Begin
    f:= Random(Length(Vals));
    result:= WordCommand(Vals[f], #$E4);
    inc(xt);
  End Else If(CommandName = 'AttackPlayerVar')Then Begin
    f:= Random(Length(Params));
    result:= WordCommand(Vars[Params[f]], #$E4);
    inc(xt);
  End Else If(CommandName = 'TradePlayer')Then Begin
    f:= Random(Length(Vals));
    result:= WordCommand(Vals[f], #$EB);
    inc(xt);
  End Else If(CommandName = 'TradePlayerVar')Then Begin
    f:= Random(Length(Params));
    result:= WordCommand(Vars[Params[f]], #$EB);
    inc(xt);
  end else if(CommandName = 'PutTrade')then
  begin
    SetLength(Aid, Length(Vals)*6 + 1);
    Aid[0]:= Length(Vals) div 2;
    for f:= 1 to Length(Vals) div 2 do
    begin
      Aid[f*6-5]:= Vals[f*2-2] shr 8;
      Aid[f*6-4]:= Vals[f*2-2] and $FF;
      if(Vals[f*2-1]=0)then Vals[f*2-1]:= 1; 
      Aid[f*6-3]:= Vals[f*2-1] shr 24;
      Aid[f*6-2]:= (Vals[f*2-1] shr 16) and $FF;
      Aid[f*6-1]:= (Vals[f*2-1] shr 8) and $FF;
      Aid[f*6]:= Vals[f*2-1] and $FF;
    end;
    result:= cmdBytes(Aid,#$EA);
  end else if(CommandName = 'PutTradeVar')then
  begin
    SetLength(Aid, Length(Params)*6 + 1);
    Aid[0]:= Length(Params) div 2;
    for f:= 1 to Length(Params) div 2 do
    begin
      Aid[f*6-5]:= Vars[Params[f*2-2]] shr 8;
      Aid[f*6-4]:= Vars[Params[f*2-2]] and $FF;
      if(Vars[Params[f*2-1]]=0)then Vars[Params[f*2-1]]:= 1;
      Aid[f*6-3]:= Vars[Params[f*2-1]] shr 24;
      Aid[f*6-2]:= (Vars[Params[f*2-1]] shr 16) and $FF;
      Aid[f*6-1]:= (Vars[Params[f*2-1]] shr 8) and $FF;
      Aid[f*6]:= Vars[Params[f*2-1]] and $FF;
    end;
    result:= cmdBytes(Aid,#$EA);
  end else if(CommandName = 'Put0Trade')then
  begin
    SetLength(Aid, Length(Vals)*6 + 1);
    Aid[0]:= Length(Vals) div 2;
    for f:= 1 to Length(Vals) div 2 do
    begin
      Aid[f*6-5]:= Vals[f*2-2] shr 8;
      Aid[f*6-4]:= Vals[f*2-2] and $FF;
      Aid[f*6-3]:= Vals[f*2-1] shr 24;
      Aid[f*6-2]:= (Vals[f*2-1] shr 16) and $FF;
      Aid[f*6-1]:= (Vals[f*2-1] shr 8) and $FF;
      Aid[f*6]:= Vals[f*2-1] and $FF;
    end;
    result:= cmdBytes(Aid,#$EA);
  end else if(CommandName = 'Put0TradeVar')then
  begin
    SetLength(Aid, Length(Params)*6 + 1);
    Aid[0]:= Length(Params) div 2;
    for f:= 1 to Length(Params) div 2 do
    begin
      Aid[f*6-5]:= Vars[Params[f*2-2]] shr 8;
      Aid[f*6-4]:= Vars[Params[f*2-2]] and $FF;
      Aid[f*6-3]:= Vars[Params[f*2-1]] shr 24;
      Aid[f*6-2]:= (Vars[Params[f*2-1]] shr 16) and $FF;
      Aid[f*6-1]:= (Vars[Params[f*2-1]] shr 8) and $FF;
      Aid[f*6]:= Vars[Params[f*2-1]] and $FF;
    end;
    result:= cmdBytes(Aid,#$EA);
  End Else If(CommandName = 'ThieveNPC')Then Begin
    f:= Random(Length(Vals));
    result:= WordCommand(Vals[f], #$C3);
  End Else If(CommandName = 'ThieveNPCVar')Then Begin
    f:= Random(Length(Params));
    result:= WordCommand(Vars[Params[f]], #$C3);
  End Else If(CommandName = 'MagicPlayer')Then Begin
    result:= WordWordCommand(Vars[Params[0]], Vals[1], #$E2);
  End Else If(CommandName = 'MagicNPC')Then Begin
    result:= WordWordCommand(Vals[0], Vals[1], #$E1);
  end else if(CommandName = 'Magic')then
  begin
    result:= WordCommand(Vals[0], #$E3);
  End Else If(CommandName = 'MagicNPCVar')Then Begin
    result:= WordWordCommand(Vars[Params[0]], Params[1], #$E1);
  end else if(CommandName = 'Wield')then
  begin
    result:= WordCommand(Vals[0], #$F9);
  end else if(CommandName = 'Unwield')then
  begin
    result:= WordCommand(Vals[0], #$F8);
  end else if(CommandName = 'WieldByID')then
  begin
    if(InventoryPos(Vals[0])<>-1)then
      result:= WordCommand(InventoryPos(Vals[0]), #$F9);
  end else if(CommandName = 'UnwieldByID')then
  begin
    if(InventoryPos(Vals[0])<>-1)then
      result:= WordCommand(InventoryPos(Vals[0]), #$F8);
  end else if(CommandName = 'WieldByVar')then
  begin
    if(InventoryPos(Vars[Params[0]])<>-1)then
      result:= WordCommand(InventoryPos(Vars[Params[0]]), #$F9);
  end else if(CommandName = 'UnwieldByVar')then
  begin
    if(InventoryPos(Vars[Params[0]])<>-1)then
      result:= WordCommand(InventoryPos(Vars[Params[0]]), #$F8);
  End Else If(CommandName = 'SetVarLastPlayerID')Then Begin
    Vars[Params[0]]:= LastAttackedPlayer;
    DebugTextAdd('Last player player: ' + IntToStr(LastAttackedPlayer) +', ' + PlayerData[LastAttackedPlayer].Name );
    DebugTextAdd(Hexy(WordCommand(LastAttackedPlayer , #$E4)));
  End Else If(CommandName = 'SetVarsPlayer')Then Begin
    f:= Vars[Params[0]];
    Vars[Params[1]]:= PlayerData[f].X;
    Vars[Params[2]]:= PlayerData[f].Y;
    Vars[Params[3]]:= PlayerData[f].Lvl;
    Vars[Params[4]]:= PlayerData[f].HP;
  end else if(CommandName = 'SetVarNearestPlayer')then
  begin
    f:= -1;
    y:= 30;
    for x:= 0 to Length(Players)-1 do
    begin
      if(y > Max(Abs(Players[x].X-MyX),Abs(Players[x].Y-MyY)))then
      begin
        f:= Players[x].ID;
        y:= Max(Abs(Players[x].X-MyX),Abs(Players[x].Y-MyY));
      end;
    end;
    Vars[Params[0]]:= f;
  end else if(CommandName = 'SetVarPlayerByName')then
  begin
    SetLength(Aid, Length(Params)-1);
    for f:= 0 to Length(Aid)-1 do
      Aid[f]:= Params[f+1];
    TempS:= ParamsToString(Aid);
    f:= -1;
    for x:= 0 to Length(PlayerData)-1 do
    begin
      if(UpperCase(PlayerData[x].Name) = UpperCase(TempS))then
      begin
        f:= x;
        break;
      end;
    end;
    Vars[Params[0]]:= f;
  End Else If(CommandName = 'Deposit')Then Begin
    result:= WordWordCommand(Vals[0], Vals[1], #$CD);
  End Else If(CommandName = 'Withdraw')Then Begin
    result:= WordWordCommand(Vals[0], Vals[1], #$CE);
  End Else If(CommandName = 'WithdrawVar')Then Begin
    result:= WordWordCommand(Vars[Params[0]], Vars[Params[1]], #$CE);
  End Else If(CommandName = 'Answer')Then Begin
    result:= ByteCommand(Vals[0], #$ED);
  End Else If(CommandName = 'UseItem')Then Begin
    result:= WordCommand(Vals[0], #$F6);
  End Else If(CommandName = 'UseItemByID')Then Begin
    if(InventoryPos(Vals[0])<>-1)then
      result:= WordCommand(InventoryPos(Vals[0]), #$F6);
  End Else If(CommandName = 'UseItemWithItem')Then Begin
    result:= WordWordCommand(Vals[0], Vals[1], #$F0);
  End Else If(CommandName = 'UseItemWithItemByID')Then Begin
    if(InventoryPos(Vals[0])<>-1)and(InventoryPos(Vals[1])<>-1)then
      result:= WordWordCommand(InventoryPos(Vals[0]), InventoryPos(Vals[1]), #$F0);
  End Else If(CommandName = 'MagicOnItemByPos')Then Begin
    result:= WordWordCommand(Vals[0], Vals[1],#$DC);
  End Else If(CommandName = 'MagicOnItemByID')Then Begin
    if(InventoryPos(Vals[0])<>-1)then
      result:= WordWordCommand(InventoryPos(Vals[0]), Vals[1], #$DC);
  End Else If(CommandName = 'CloseShop')Then Begin
    result:= NoParamCommand(#$DA);
  End Else If(CommandName = 'CloseBank')Then Begin
    result:= NoParamCommand(#$CF);
  End Else If(CommandName = 'Accept1')Then Begin
    result:= NoParamCommand(#$E8);
  End Else If(CommandName = 'Accept2')Then Begin
    result:= NoParamCommand(#$CA);
  End Else If(CommandName = 'Decline')Then Begin
    result:= NoParamCommand(#$E9);
  End Else If(CommandName = 'LogOut')Then Begin
    result:= NoParamCommand(#$06);
  end else if(CommandName = 'RedirectDest')then
  begin
    TriesLeft:= Vals[0];
    DynReconnectTime:= Vals[1];
    if(Length(Vals)>5)then
    begin
      RedirectHost:= IntToStr(Vals[2]) + '.' + IntToStr(Vals[3]) + '.' + IntToStr(Vals[4]) + '.' + IntToStr(Vals[5]);
    end;
    if(Length(Vals)>6)then
    begin
      RedirectPort:= Vals[6];
    end;
  End Else If(CommandName = 'DropItem')Then Begin
    result:= WordCommand(Vals[0], #$FB);
  End Else If(CommandName = 'DropItemByID')Then Begin
    if(InventoryPos(Vals[0])<>-1)then
      result:= WordCommand(InventoryPos(Vals[0]), #$FB);
  End Else If(CommandName = 'TakeItem')Then Begin
    result:= CoordWordCommand(Vals[0], Vals[1], Vals[2], #$FC);
  End Else If(CommandName = 'TakeItemVarVar')Then Begin
    result:= CoordWordCommand(Vars[Params[0]], Vars[Params[1]], Vals[2], #$FC);
  End Else If(CommandName = 'TakeItemVarVarVar')Then Begin
    result:= CoordWordCommand(Vars[Params[0]], Vars[Params[1]], Vars[Params[2]], #$FC);
  End Else If(CommandName = 'PickItemWithItem')Then Begin
    result:= CoordWordWordCommand(Vals[0], Vals[1], Vals[2], Vals[3], #$FA);
  End Else If(CommandName = 'PickItemWithItemID')Then Begin
    if(InventoryPos(Vals[3])<>-1)then
      result:= CoordWordWordCommand(Vals[0], Vals[1], Vals[2], InventoryPos(Vals[3]), #$FA);
{  End Else If(CommandName = 'SmeltOre')or(CommandName = 'ForgeBar')or(CommandName = 'Cook')Then Begin
    if(InventoryPos(Params[4])<>-1)then
    begin
      result:= EncryptCommandForServerF(CoordCommand(Params[0], Params[1], #$D7));
      result:= result + EncryptCommandForServerF(CoordWordCommand(Params[2], Params[3], InventoryPos(Params[4]), #$F1));
      DontEncrypt:= True;
    end;}
  End Else If(CommandName = 'DepositEverything')Then Begin
    result:= DepositEverything;
    DontEncrypt:= True;
  End Else If(CommandName = 'SellItem')Then Begin
    //Item ID = Params[0]
    //base price = Params[1]
    x:= xbb + ModInShop(Vals[0]);
    if(x<10)then
      x:= 10;
    y:= (x * Vals[1]) div 100;
    DebugTextAdd('Selling item, x=' + IntToStr(x) + ', y=' + IntToStr(y) + ', xbb=' + IntToStr(xbb));
    result:= WordLongCommand(Vals[0], y, #$D8);
  End Else If(CommandName = 'BuyItem')Then Begin
    //Item ID = Params[0]
    //base price = Params[1]
    x:= ybb + ModInShop(Vals[0]);
    if(x<10)then
      x:= 10;
    y:= (x * Vals[1]) div 100;

    result:= WordLongCommand(Vals[0], y, #$D9);
  End Else If(CommandName = 'SayInt')Then Begin
    result:= cmdBytes(Params, #$03);
  End Else If(CommandName = 'PMInt')Then Begin
    SetLength(Aid, Length(Params) + 8);
    U:= NextPMee;
    if(U <> 0)then
    begin
      for f:= 7 downto 0 do
      begin
        Aid[f]:= U mod 256;
        U:= U shr 8;
      end;
      for f:= 8 to Length(Aid)-1 do
        Aid[f]:= Params[f-8];
      result:= cmdBytes(Aid, #$1C);
    end;  

  End Else If(CommandName = 'HexInt')Then Begin
    result:= ParamsToString(Params);
  End Else If(CommandName = 'SetFire')Then Begin
    if(InventoryPos(166)<>-1)then
      result:= CoordWordWordCommand(MyX, MyY, $0E, InventoryPos(166),#$FA);
  End Else If(CommandName = 'SetFireTinderPos')Then Begin
    result:= CoordWordWordCommand(MyX, MyY, $0E, Vals[0],#$FA);
  End Else If(CommandName = 'SetFireAtCoords')Then Begin
    if(InventoryPos(166)<>-1)then
      result:= CoordWordWordCommand(Vals[0], Vals[1], $0E, InventoryPos(166),#$FA);
  End Else If(CommandName = 'OpenDoor')Then Begin
    result:= CoordByteCommand(Vals[0], Vals[1], Vals[2],#$EE);
  End Else If(CommandName = 'CloseDoor')Then Begin
    result:= CoordByteCommand(Vals[0], Vals[1], Vals[2],#$E5);
  End Else If(CommandName = 'WithItemAtDoor')Then Begin
    if(InventoryPos(Vals[3])<>-1)then
      result:= WordWordByteWordCommand(Vals[0], Vals[1], Vals[2], InventoryPos(Vals[3]),#$EF);
  End Else If(CommandName = 'PrayerOn')Then Begin
    result:= ByteCommand(Vals[0], #$D4);
  End Else If(CommandName = 'PrayerOff')Then Begin
    result:= ByteCommand(Vals[0], #$D3);
  End Else If(CommandName = 'FightMode')Then Begin
    result:= ByteCommand(Vals[0], #$E7);
  //----------- Control Commands --------
  End Else If(CommandName = 'Wait')Then Begin
    f:= Random(Length(Vals));
    WaitTime:= Vals[f];
  end else if(CommandName = 'Sleep')then
  begin
    f:= Random(Length(Vals));
    WaitTime:= Round(Vals[f]/100);
  End Else If(CommandName = 'WaitForQuestMenu')Then Begin
    WaitForQuestMenu:= True;
    WaitTime:= Vals[0];
    QuestMenuAppeared:= False;
  End Else If(CommandName = 'WaitForServerMessage')Then Begin
    WaitForServerMessage:= True;
    WaitTime:= 0;
    If(Length(Vals)>0)Then Begin
      WaitTime:= Vals[0];
    End;  
    ServerMessageAppeared:= False;
  End Else If(CommandName = 'WaitForBankWindow')Then Begin
    WaitForBankWindow:= True;
    BankWindow:= False;
    If(Length(Vals)>0)Then Begin
      WaitTime:= Vals[0];
    End;
  End Else If(CommandName = 'WaitForShopWindow')Then Begin
    WaitForShopWindow:= True;
    ShopWindow:= False;
    If(Length(Vals)>0)Then Begin
      WaitTime:= Vals[0];
    End;
  End Else If(CommandName = 'WaitForCoordChange')Then Begin
    WaitForCoordChange:= True;
  End Else If(CommandName = 'RepeatNextCommandUntilQuestMenu')Then Begin
    If(Vals[0] >= 0)Then Begin
      WaitForQuestMenu:= True;
      WaitTime:= Vals[0];
      RepeatCP:= CP + 1;
      QuestMenuAppeared:= False;
      If(Length(Vals)>1)Then Begin
        ImmediateLines:= Vals[1];
      End Else Begin
        ImmediateLines:= 1;
      End;
      SkipLines:= ImmediateLines;
    End Else Begin
      RepeatCP:= -1;
      ImmediateLines:= 0;
    End;
  End Else If(CommandName = 'GoTo')Then Begin
    CP:= CP + Vals[0];
  End Else If(CommandName = 'ResetLastItemGained')Then Begin
    LastItemGained:= -1;
  End Else If(CommandName = 'ResetLastItemLost')Then Begin
    LastItemLost:= -1;
  End Else If(CommandName = 'GoToIfLastItem')Then Begin
    if(LastItemGained = Vals[1])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfLastItemLost')Then Begin
    if(LastItemLost = Vals[1])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfBagFull')Then Begin
    if(BagFull)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfItemGained')Then Begin
    If(LastItemGained<>-1)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfItemLost')Then Begin
    If(LastItemLost<>-1)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfInInventory')Then Begin
    b:= True;
    For f:= 1 To High(Vals) Do Begin
      b:= b and IsInInventory(Vals[f]);
    End;
    If(b)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfCountInInventoryEqual')Then Begin
    b:= True;
    for f:= 2 To High(Vals) Do Begin
      b:= b and (CountInInventory(Vals[f]) = Vals[1]);
    End;
    if(b)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfCountInInventoryGreater')Then Begin
    b:= True;
    for f:= 2 To High(Vals) Do Begin
      b:= b and (CountInInventory(Vals[f]) > Vals[1]);
    End;
    if(b)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfVarEqual')Then Begin
    if(Vars[Params[1]] = Vars[Params[2]])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfVarNotEqual')Then Begin
    if(Vars[Params[1]] <> Vars[Params[2]])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfVarAbove')Then Begin
    if(Vars[Params[1]] > Vars[Params[2]])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfVarBelow')Then Begin
    if(Vars[Params[1]] < Vars[Params[2]])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfVarBetween')Then Begin
    if(Vars[Params[1]] > Vars[Params[2]])and(Vars[Params[1]] < Vars[Params[3]])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfVarEqualNum')Then Begin
    if(Vars[Params[1]] = Vals[2])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfVarNotEqualNum')Then Begin
    if(Vars[Params[1]] <> Vals[2])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfVarAboveNum')Then Begin
    if(Vars[Params[1]] > Vals[2])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfVarBelowNum')Then Begin
    if(Vars[Params[1]] < Vals[2])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfVarBetweenNum')Then Begin
    if(Vars[Params[1]] > Vals[2])and(Vars[Params[1]] < Vals[3])Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'SetVarNum')Then Begin
    Vars[Params[0]]:= Vals[1];
  End Else If(CommandName = 'SetVar')Then Begin
    Vars[Params[0]]:= Vars[Params[1]];
  End Else If(CommandName = 'SetVarRandom')Then Begin
    Vars[Params[0]]:= Random(Vals[1]);
  End Else If(CommandName = 'SetVarRandomVar')Then Begin
    Vars[Params[0]]:= Random(Vars[Params[1]]);
  End Else If(CommandName = 'AddVarNum')Then Begin
    Vars[Params[0]]:= Vars[Params[0]] + Vals[1];
  End Else If(CommandName = 'AddVar')Then Begin
    Vars[Params[0]]:= Vars[Params[0]] + Vars[Params[1]];
  End Else If(CommandName = 'SubVar')Then Begin
    Vars[Params[0]]:= Vars[Params[0]] - Vars[Params[1]];
  End Else If(CommandName = 'SetVarItemCount')Then Begin
    Vars[Params[0]]:= CountInInventory(Vals[1]);
  End Else If(CommandName = 'SetVarCountInBank')Then Begin
    Vars[Params[0]]:= Bank[Vals[1]].Count;
  End Else If(CommandName = 'SetVarIDInBank')Then Begin
    Vars[Params[0]]:= Bank[Vals[1]].ID;
  End Else If(CommandName = 'SetVarCountInBankVar')Then Begin
    Vars[Params[0]]:= Bank[Vars[Params[1]]].Count;
  End Else If(CommandName = 'SetVarIDInBankVar')Then Begin
    Vars[Params[0]]:= Bank[Vars[Params[1]]].ID;
  End Else If(CommandName = 'SetVarItemsInBank')Then Begin
    Vars[Params[0]]:= BankItemsCount;
  End Else If(CommandName = 'SetVarCountInShop')Then Begin
    Vars[Params[0]]:= CountInShop(Vals[1]);
  End Else If(CommandName = 'SetVarCountInShopVar')Then Begin
    Vars[Params[0]]:= CountInShop(Vars[Params[1]]);
  End Else If(CommandName = 'SetVarMyX')Then Begin
    Vars[Params[0]]:= MyX;
  End Else If(CommandName = 'SetVarMyY')Then Begin
    Vars[Params[0]]:= MyY;
  End Else If(CommandName = 'SetVarFatigue')Then Begin
    Vars[Params[0]]:= Fatigue;
  End Else If(CommandName = 'SetVarMyHP')Then Begin
    Vars[Params[0]]:= MyHP;
  End Else If(CommandName = 'SetVarMyID')Then Begin
    Vars[Params[0]]:= MyID;
  End Else If(CommandName = 'SetVarsNearestObjectXY')Then Begin
    Aid:= nil;
    For f:=3 to Length(Vals)-1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vals[f];
    end;
    FindNearestRock(x, y, Aid, Vals[2]);
    Vars[Params[0]]:= x;
    Vars[Params[1]]:= y;
  End Else If(CommandName = 'GoToIfObjectNear')Then Begin
    Aid:= nil;
    For f:=2 to Length(Vals)-1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vals[f];
    end;
    FindNearestRock(x, y, Aid, Vals[1]);
    If(x<0)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'SetVarsNearestNPC')Then Begin
    Aid:= nil;
    For f:=3 to Length(Vals)-1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vals[f];
    end;
    FindNearestNPC(x,y,f,-1,-1,maxint,maxint,Aid,CheckFighters,false);
    Vars[Params[0]]:= x;
    Vars[Params[1]]:= y;
    Vars[Params[2]]:= f;
  End Else If(CommandName = 'SetVarsNearestNPCIn')Then Begin
    Aid:= nil;
    For f:=7 to Length(Vals)-1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vals[f];
    end;
    FindNearestNPC(x,y,f,Vals[3],Vals[4],Vals[5],Vals[6],Aid,CheckFighters,false);
    Vars[Params[0]]:= x;
    Vars[Params[1]]:= y;
    Vars[Params[2]]:= f;
  End Else If(CommandName = 'SetVarsNearestNPCInVar')Then Begin
    Aid:= nil;
    For f:=7 to Length(Params)-1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vars[Params[f]];
    end;
    FindNearestNPC(x,y,f,Vars[Params[3]],Vars[Params[4]],Vars[Params[5]],Vars[Params[6]],Aid,CheckFighters,false);
    Vars[Params[0]]:= x;
    Vars[Params[1]]:= y;
    Vars[Params[2]]:= f;
  End Else If(CommandName = 'SetVarsRandomNPC')Then Begin
    Aid:= nil;
    For f:=3 to Length(Vals)-1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vals[f];
    end;
    FindNearestNPC(x,y,f,-1,-1,maxint,maxint,Aid,CheckFighters,true);
    Vars[Params[0]]:= x;
    Vars[Params[1]]:= y;
    Vars[Params[2]]:= f;
  End Else If(CommandName = 'SetVarsRandomNPCIn')Then Begin
    Aid:= nil;
    For f:=7 to Length(Vals)-1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vals[f];
    end;
    FindNearestNPC(x,y,f,Vals[3],Vals[4],Vals[5],Vals[6],Aid,CheckFighters,true);
    Vars[Params[0]]:= x;
    Vars[Params[1]]:= y;
    Vars[Params[2]]:= f;
  End ELse If(CommandName = 'GoToIfNPCNear')Then Begin
    Aid:= nil;
    For f:=1 to Length(Vals)-1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vals[f];
    end;
    FindNearestNPC(x,y,f,-1,-1,maxint,maxint,Aid,CheckFighters,false);
    If(f>-1)Then Begin
      CP:= CP + Vals[0];
    End;
  End ELse If(CommandName = 'GoToIfNPCNearIn')Then Begin
    Aid:= nil;
    For f:=5 to Length(Vals)-1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vals[f];
    end;
    FindNearestNPC(x,y,f,Vals[1], Vals[2], Vals[3], Vals[4], Aid,CheckFighters, false);
    If(f>-1)Then Begin
      CP:= CP + Vals[0];
    End;
  End ELse If(CommandName = 'GoToIfNPCNearInVar')Then Begin
    Aid:= nil;
    For f:=5 to Length(Params)-1 do begin
      SetLength(Aid,Length(Aid)+1);
      Aid[Length(Aid)-1]:= Vars[Params[f]];
    end;
    FindNearestNPC(x,y,f,Vars[Params[1]], Vars[Params[2]], Vars[Params[3]], Vars[Params[4]], Aid,CheckFighters, false);
    If(f>-1)Then Begin
      CP:= CP + Vals[0];
    End;
  end else if(CommandName = 'SetVarPlayerSkulled')then
  begin
    Vars[Params[1]]:= 0;
    for x:= 0 to Length(Players)-1 do
    begin
      if(Players[x].ID = Vals[0])then
      begin
        if(Players[x].Skull)then
          Vars[Params[1]]:= 1;
        break;
      end;
    end;
  end else if(CommandName = 'GoToIfPlayerVisibleVar')then
  begin
    f:= -1;
    for x:= 0 to Length(Players)-1 do
    begin
      if(Players[x].ID = Vars[Params[1]])then
      begin
        CP:= CP + Vals[0];
        break;
      end;
    end;
  end  else if(CommandName = 'GoToIfFighting')then
  begin
    if(MyDir and $8 = $8)then
      CP:= CP + Vals[0];
  End Else If(CommandName = 'SetVarNPCType')Then Begin
    Vars[Params[0]]:= FindNPCTypeByID(Vals[1]);
  End Else If(CommandName = 'SetVarNPCTypeVar')Then Begin
    Vars[Params[0]]:= FindNPCTypeByID(Vars[Params[1]]);
  End Else If(CommandName = 'SetVarNPCCoords')Then Begin
    FindNPCCoordsByID(Vars[Params[0]], Vars[Params[1]], Vals[2]);
  End Else If(CommandName = 'SetVarNPCCoordsVar')Then Begin
    FindNPCCoordsByID(Vars[Params[0]], Vars[Params[1]], Vars[Params[2]]);
  End Else If(CommandName = 'GoToIfNPCVisible')Then Begin
    If(FindNPCTypeByID(Vars[Params[1]])>-1)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'SetVarObject')Then Begin
    Vars[Params[0]]:= FindObj(Vals[1],Vals[2]);
  End Else If(CommandName = 'SetVarObjectVar')Then Begin
    Vars[Params[0]]:= FindObj(Vars[Params[1]],Vars[Params[2]]);
  End Else If(CommandName = 'SetObject')Then Begin
    NewObj(Vals[2], Vals[0], Vals[1], Vals);
  End Else If(CommandName = 'SetObjectVar')Then Begin
    NewObj(Vars[Params[2]], Vars[Params[0]], Vars[Params[1]], []);
  End Else If(CommandName = 'SetCoordsNearer')Then Begin
    if(Length(Params)>2)then
      ApproachCoords(Vars[Params[0]], Vars[Params[1]], MyX, MyY, IIF(Params[2]=0,False,True))
    else
      ApproachCoords(Vars[Params[0]], Vars[Params[1]], MyX, MyY, False);
  End Else If(CommandName = 'GoToIfCoordsCloserThan')Then Begin
    If(
       Max(Abs(MyX - Vals[1]),Abs(MyY - Vals[2]))
       <
       Max(Abs(MyX - Vals[3]),Abs(MyY - Vals[4]))
     )Then
    Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfCoordsCloserThanVars')Then Begin
    If(
       Max(Abs(MyX - Vars[Params[1]]),Abs(MyY - Vars[Params[2]]))
       <
       Max(Abs(MyX - Vars[Params[3]]),Abs(MyY - Vars[Params[4]]))
     )Then
    Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfCoordsIn')Then Begin
    If(MyX >= Min(Vals[1],Vals[3]))and(MyX <= Max(Vals[1],Vals[3]))and
      (MyY >= Min(Vals[2],Vals[4]))and(MyY <= Max(Vals[2],Vals[4]))then
    Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfCoordsInVars')Then Begin
    If(MyX >= Min(Vars[Params[1]],Vars[Params[3]]))and(MyX <= Max(Vars[Params[1]],Vars[Params[3]]))and
      (MyY >= Min(Vars[Params[2]],Vars[Params[4]]))and(MyY <= Max(Vars[Params[2]],Vars[Params[4]]))then
    Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'Push')Then Begin
    PutInVarStack(Vars[Params[0]]);
  End Else If(CommandName = 'PushNum')Then Begin
    PutInVarStack(Vals[0]);
  End Else If(CommandName = 'Pop')Then Begin
    Vars[Params[0]]:= VarStack[SPVar];
    SPVar:= SPVar - 1;
    If(SPVar < Low(VarStack))Then Begin
      SPVar:= High(VarStack);
    End;
  End Else If(CommandName = 'RetrieveNPCList')Then Begin
    x:= 0;
    for f:= Low(Monsters) to LastMonst do begin
      if(Length(Vals)>0)or(InArray(Monsters[f].Tips, Vals))Then Begin
        PutInVarStack(Monsters[f].ID);
        Inc(x);
      End;
    end;
    PutInVarStack(x);
{  End Else If(CommandName = 'GoToIfNearItem')Then Begin
    If(IsNearItem(Params[1], Params[2]))Then Begin
      CP:= CP + Params[0];
    End;}
{  End Else If(CommandName = 'SetVarsItemXY')Then Begin
    GetNearestItem(Params[2], Params[3], Vars[Params[0]], Vars[Params[1]]);}
  End Else If(CommandName = 'SetVarTime')Then Begin
    Vars[Params[0]]:= GetTickCount div 100;
  End Else If(CommandName = 'PutVarInArray')Then Begin
    If(Vars[Params[1]]+2 < Length(Params))and(Vars[Params[1]]>=0)Then Begin
      Vars[Params[2+Vars[Params[1]]]]:= Vars[Params[0]];
    End;
  End Else If(CommandName = 'PutNumInArray')Then Begin
    If(Vars[Params[1]]-2 < Length(Params))and(Vars[Params[1]]>=0)Then Begin
      Vars[Params[2+Vars[Params[1]]]]:= Vals[0];
    End;
  End Else If(CommandName = 'GetVarFromArray')Then Begin
    If(Vars[Params[1]]-2 < Length(Params))and(Vars[Params[1]]>=0)Then Begin
      Vars[Params[0]]:= Vars[Params[2+Vars[Params[1]]]];
    End;
  End Else If(CommandName = 'GoToIfIsVarInArray')Then Begin
    b:= false;
    For f:= 2 to High(Params) Do Begin
      If(Vars[Params[f]] = Vars[Params[1]])Then Begin
        b:= True;
      End;
    End;
    If(b)Then Begin
      CP:= CP + Vals[Vars[Params[0]]];
    End;
  End Else If(CommandName = 'GoToIfIsNumInArray')Then Begin
    b:= false;
    For f:= 2 to High(Vals) Do Begin
      If(Vars[Params[f]] = Vals[1])Then Begin
        b:= True;
      End;
    End;
    If(b)Then Begin
      CP:= CP + Vals[Vars[Params[0]]];
    End;
  End Else If(CommandName = 'GoToRandom')Then
  Begin
    CP:= CP + Vals[Random(Length(Vals))];
  End Else If(CommandName = 'GoToCase')Then Begin
    If(Vars[Params[0]]<Length(Vals))Then Begin
      CP:= CP + Vals[Vars[Params[0]]];
    End;
  End Else If(CommandName = 'Stop')Then Begin
    ResetScriptStats;
    Stopped:= True;
  End Else If(CommandName = 'StopAndLogOut')Then Begin
    ResetScriptStats;  
    Stopped:= True;
    result:= #1#6;
  End Else If(CommandName = 'GoSub')Then Begin
    PutInRetStack(CP);
    CP:= CP + Vals[0];
  End Else If(CommandName = 'GoSubRandom')Then Begin
    PutInRetStack(CP);
    CP:= CP + Vals[Random(Length(Vals))];
  End Else If(CommandName = 'GoSubNext')Then Begin
    PutInRetStack(CP+1);
  End Else If(CommandName = 'Ret')Then Begin
    CP:= RetStack[SPRet];
    SPRet:= SPRet - 1;
    If(SPRet<Low(RetStack))Then Begin
      SPRet:= High(RetStack);
    End;
  End Else If(CommandName = 'NoRet')Then Begin
    SPRet:= SPRet - 1;
    If(SPRet<Low(RetStack))Then Begin
      SPRet:= High(RetStack);
    End;
  End Else If(CommandName = 'ERet')Then Begin
    CP:= ERetStack[SPERet];
    SPERet:= SPERet - 1;
    If(SPERet < Low(ERetStack))Then Begin
      SPERet:= High(ERetStack);
    End;
    RestoreCPUStats;
    InEvent:= False;
  End Else If(CommandName = 'ERetToRet')Then Begin
    x:= ERetStack[SPERet];
    SPERet:= SPERet - 1;
    If(SPERet < Low(ERetStack))Then Begin
      SPERet:= High(ERetStack);
    End;
    PutInRetStack(x);
    InEvent:= False;
  End Else If(CommandName = 'EnableEvents')Then Begin
    InEvent:= False;
  End Else If(CommandName = 'SetTraceMode')Then Begin
    Case Vals[0] of
      0: TBItem17Click(TBItem17);
      1: TBItem17Click(TBItem18);
      2: TBItem17Click(TBItem19);
    end;
  End Else If(CommandName = 'CheckFighters')Then begin
    CheckFighters:= Boolean(Vals[0]);
  End Else If(CommandName = 'SetTimeSinceMovingToDest')Then Begin
    TimeSinceMovingToDest:= Vals[0];
  End Else If(CommandName = 'GoToIfQuestion')Then Begin
    TempS:= ParamsToString(Params);
    TempS:= Copy(TempS,2,Length(TempS));
    If(MessageBox(Handle, PChar(TempS), 'AutoRune Script', MB_YESNO + MB_ICONQUESTION) = IdYes)Then Begin
      CP:= CP + Vals[0];
    End;

  End Else If(CommandName = 'GoToIfLastHTTPResponseIs')Then Begin
    TempS:= ParamsToString(Params);
    If(Copy(TempS,2,Length(TempS))=LastServerResponse)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfLastHTTPResponseIsNot')Then Begin
    TempS:= ParamsToString(Params);
    If(Copy(TempS,2,Length(TempS))<>LastServerResponse)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfInLastHTTPResponseIs')Then Begin
    TempS:= ParamsToString(Params);
    TempS:= Copy(TempS,2,Length(TempS));
    If(Pos(TempS,LastServerResponse)>0)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfInLastHTTPResponseIsNot')Then Begin
    TempS:= ParamsToString(Params);
    TempS:= Copy(TempS,2,Length(TempS));
    If(Pos(TempS,LastServerResponse)=0)Then Begin
      CP:= CP + Vals[0];
    End;

  End Else If(CommandName = 'GoToIfLastServerMessageIs')Then Begin
    TempS:= ParamsToString(Params);
    If(Copy(TempS,2,Length(TempS))=LastServerMessage)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfLastServerMessageIsNot')Then Begin
    TempS:= ParamsToString(Params);
    If(Copy(TempS,2,Length(TempS))<>LastServerMessage)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfInLastServerMessageIs')Then Begin
    TempS:= ParamsToString(Params);
    TempS:= Copy(TempS,2,Length(TempS));
    If(Pos(TempS,LastServerMessage)>0)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfInLastServerMessageIsNot')Then Begin
    TempS:= ParamsToString(Params);
    TempS:= Copy(TempS,2,Length(TempS));
    If(Pos(TempS,LastServerMessage)=0)Then Begin
      CP:= CP + Vals[0];
    End;

  End Else If(CommandName = 'ResetLastHTTPResponse')Then Begin
    LastServerResponse:= '';

  End Else If(CommandName = 'ResetLastServerMessage')Then Begin
    LastServerMessage:= '';
  End Else If(CommandName = 'GoToIfLastChatMessageIs')Then Begin
    TempS:= ParamsToString(Params);
    If(Copy(TempS,2,Length(TempS))=LastChatMessage)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfLastChatMessageIsNot')Then Begin
    TempS:= ParamsToString(Params);
    If(Copy(TempS,2,Length(TempS))<>LastChatMessage)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfInLastChatMessageIs')Then Begin
    TempS:= ParamsToString(Params);
    TempS:= Copy(TempS,2,Length(TempS));
    If(Pos(TempS,LastChatMessage)>0)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfInLastChatMessageIsNot')Then Begin
    TempS:= ParamsToString(Params);
    TempS:= Copy(TempS,2,Length(TempS));
    If(Pos(TempS,LastChatMessage)=0)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfLastPMIs')Then Begin
    TempS:= ParamsToString(Params);
    If(Copy(TempS,2,Length(TempS))=LastPM)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfLastPMIsNot')Then Begin
    TempS:= ParamsToString(Params);
    If(Copy(TempS,2,Length(TempS))<>LastPM)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfInLastPMIs')Then Begin
    TempS:= ParamsToString(Params);
    TempS:= Copy(TempS,2,Length(TempS));
    If(Pos(TempS,LastPM)>0)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'GoToIfInLastPMIsNot')Then Begin
    TempS:= ParamsToString(Params);
    TempS:= Copy(TempS,2,Length(TempS));
    If(Pos(TempS,LastPM)=0)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'ResetLastChatMessage')Then Begin
    LastChatMessage:= '';
  End Else If(CommandName = 'ResetLastPM')Then Begin
    LastPM:= '';
    LastPMer:= '';
  End Else If(CommandName = 'ResetQuestMenu')Then Begin
    QuestMenuAppeared:= False;
  End Else If(CommandName = 'GoToIfQuestMenu')Then Begin
    If(QuestMenuAppeared)Then Begin
      CP:= CP + Vals[0];
    End;
  End Else If(CommandName = 'Debug')Then Begin
    DebugTextAdd(ParamsToString(Params));

  End Else If(CommandName = 'DebugLastHTTPResponse')Then Begin
    DebugTextAdd(LastServerResponse);
  End Else If(CommandName = 'DebugLastServerMessage')Then Begin
    DebugTextAdd(LastServerMessage);
  End Else If(CommandName = 'DebugRS')Then Begin
    TempS:= ParamsToString(Params);
    TempS:= cmdBytes(Params, #8);
    EncryptCommandForClient(TempS);
    LastThread.Connection.Write(TempS);
  End Else If(CommandName = 'DebugRSVar')Then Begin
    TempS:= '';
    For f:= Low(Params) To High(Params) Do Begin
      TempS:= TempS + IntToStr(Vars[Params[f]]) + ' ';
    End;
    SetLength(Params, Length(TempS));
    for f:= 1 to Length(TempS) do
      Params[f-1]:= ord(TempS[f]);
    TempS:= cmdBytes(Params, #8);
    EncryptCommandForClient(TempS);
    LastThread.Connection.Write(TempS);
  End Else If(CommandName = 'DebugLastChatMessage')Then Begin
    DebugTextAdd(LastChatMessage);
  End Else If(CommandName = 'DebugLastPM')Then Begin
    DebugTextAdd(LastPMer + ': ' + LastPM);
  End Else If(CommandName = 'DebugLastPMer')Then Begin
    DebugTextAdd(LastPMer);
  End Else If(CommandName = 'DebugPlayerName')Then Begin
    DebugTextAdd(PlayerData[Vars[Params[0]]].Name);
  End Else If(CommandName = 'HTTPGetParamVar')Then Begin
    TempS:= '?';
    For f:= Low(Params) To High(Params) Do Begin
      TempS:= TempS + 'v' + IntToStr(f) + '=' + IntToStr(Vars[Params[f]]) + '&';
    End;
    HTTPGetParams:= TempS;
  End Else If(CommandName = 'HTTPGet')Then Begin
    TempS:= ParamsToString(Params);
    TVarsThread.Create(TempS, HttpGetParams);
  End Else If(CommandName = 'DebugVar')Then Begin
    TempS:= '';
    For f:= Low(Params) To High(Params) Do Begin
      TempS:= TempS + IntToStr(Vars[Params[f]]) + ' ';
    End;
    DebugTextAdd(TempS);
  End Else If(CommandName = 'SaveScreenshot')Then Begin
    SaveScreenShot(NextFreeFile(ExtractFilePath(Application.ExeName) + '\ScrShots\pic','.bmp'), FindRSWindow);
  End Else If(CommandName = 'MessageBox')Then Begin
    MessageBox(0,PChar(ParamsToString(Params)),PChar(Application.Title),0);
  End Else If(CommandName = 'PlaySound')Then Begin
    sndPlaySound(PChar(ParamsToString(Params)), SND_ASYNC);
  end else if(CommandName = 'SetPMReceiver')then
  begin
    NextPMee:= UserHash(ParamsToString(Params));
  end else if(CommandName = 'SetPMReceiverByID')then
  begin
    NextPMee:= UserHash(PlayerData[Vals[0]].Name);
  end else if(CommandName = 'SetPMReceiverLastPMer')then
  begin
    NextPMee:= UserHash(LastPMer);
  End Else If(CommandName = 'SetOnPlaceTime')Then Begin
    PlaceTimeout:= Vals[0];
  End Else If(CommandName = 'SetSkipDestTime')Then Begin
    SkipDestTime:= Vals[0];
  End Else If(CommandName = 'SetCheatDestTime')Then Begin
    CheatDestTime:= Vals[0];
  End Else If(CommandName = 'SetRetryDestTime')Then Begin
    RetryDestTime:= Vals[0];
  End Else If(CommandName = 'SetSkipDestMode')Then Begin
    SkipDestMode:= Boolean(Vals[0]);
  End Else If(CommandName = 'SetCheatDestMode')Then Begin
    CheatDestMode:= Boolean(Vals[0]);
  End Else If(CommandName = 'SetNoMouseMovement')Then Begin
    DontMoveMouse:= Boolean(Vals[0]);
  End Else If(CommandName = 'ForgetItems')Then Begin
    ClearItems;
  End Else If(CommandName = 'SetRetryDestMode')Then Begin
    RetryDestMode:= Boolean(Vals[0]);
  End Else If(CommandName = 'SetLagSafe')Then Begin
    TBItem21.Checked:= Boolean(Vals[0]);
    ControlSafeMode:= TBItem21.Checked;
  End Else If(CommandName = 'WatchObjects')Then Begin
    CollectObjInfo:= Boolean(Vals[0]);
    If(not CollectObjInfo)Then Fillchar(VisibleObjects, SizeOf(VisibleObjects), 0);
  End Else if(CommandName = 'Click')then
  begin
    ClickRSWindow(Vals[0], Vals[1]);
  End Else if(CommandName = 'ClickVar')then
  begin
    ClickRSWindow(Vars[Params[0]], Vars[Params[1]]);
  End Else if(CommandName = 'ClickR')then
  begin
    ClickRSWindow(Vals[0], Vals[1],False);
  End Else if(CommandName = 'ClickRVar')then
  begin
    ClickRSWindow(Vars[Params[0]], Vars[Params[1]],False);
  end else if(CommandName = 'MoveMouse')then
  begin
    MoveRSMouse(Vals[0],Vals[1]);
  end else if(CommandName = 'MoveMouseVar')then
  begin
    MoveRSMouse(Vars[Params[0]],Vars[Params[1]]);
  End Else if(CommandName = 'GetColor')then
  begin
    Vars[Params[2]]:= GetRSColorAt(Vals[0],Vals[1]);
  End Else if(CommandName = 'GetColorVar')then
  begin
    Vars[Params[2]]:= GetRSColorAt(Vars[Params[0]],Vars[Params[1]]);
  End Else if(CommandName = 'ClickColor')then
  begin
    FindRSColor(Vals[0], x, y, 0);
    if(x<>-1)then
      ClickRSWindow(x, y);
  End Else if(CommandName = 'ClickColorVar')then
  begin
    FindRSColor(Vars[Params[0]], x, y, 0);
    if(x<>-1)then
      ClickRSWindow(x, y);
  End Else if(CommandName = 'ClickColorAt')then
  begin
    FindRSColor(Vals[0], x, y, 0, Vals[1], Vals[2], Vals[3], Vals[4]);
    if(x<>-1)then
      ClickRSWindow(x, y);
  End Else if(CommandName = 'ClickColorSpiralAt')then
  begin
    x:= Vals[1];
    y:= Vals[2];
    FindRSColor(Vals[0], x, y, 1, Vals[3], Vals[4], Vals[5], Vals[6]);
    if(x<>-1)then
      ClickRSWindow(x, y);
  End Else if(CommandName = 'FindColor')then
  begin
    FindRSColor(Vals[0], Vars[Params[1]], Vars[Params[2]], 0, Vals[3], Vals[4], Vals[5], Vals[6]);
  End Else if(CommandName = 'FindColorVar')then
  begin
    FindRSColor(Vars[Params[0]], Vars[Params[1]], Vars[Params[2]], 0, Vals[3], Vals[4], Vals[5], Vals[6]);
  End Else if(CommandName = 'FindColorSpiralAt')then
  begin
    FindRSColor(Vals[0], Vars[Params[1]], Vars[Params[2]], 1, Vals[3], Vals[4], Vals[5], Vals[6]);
  end else if(CommandName = 'ClearDebug')then
  begin
    Form1.txtDebug.Clear;
    Form1.txtData.Clear;
  end else if(CommandName = 'SendKeys')then
  begin
    x:= FindRSWindow;
    if(x <> 0)then
      SendKeys(x, ParamsToString(Params), 5);
  end else if(CommandName = 'SendArrow')then
  begin
    x:= FindRSWindow;
    if(x <> 0)then
      SendArrows(x, Vals[0])

  //Events
  End Else If(CommandName = 'OnItemLost')Then Begin
    OnItemLost:= Params[0];
    OnItemLostItem:= Params[1];
    OnItemLostPos:= Params[2];
  End Else If(CommandName = 'OnItemGained')Then Begin
    OnItemGained:= Params[0];
    OnItemGainedItem:= Params[1];
    OnItemGainedPos:= Params[2];
  End Else If(CommandName = 'OnServerMessage')Then Begin
    OnServerMessage:= Params[0];
  End Else If(CommandName = 'OnPrivateMessage')Then Begin
    OnPrivateMessage:= Params[0];
  End Else If(CommandName = 'OnCoordsChanged')Then Begin
    OnCoordsChanged:= Params[0];
    OnCoordsChangedLastX:= Params[1];
    OnCoordsChangedLastY:= Params[2];
  End Else If(CommandName = 'OnDestinationReached')Then Begin
    OnDestinationReached:= Params[0];
  End Else If(CommandName = 'OnIdle')Then Begin
    OnIdle:= Params[0];
    OnIdleTime:= Params[1];
  End Else If(CommandName = 'OnHPChanged')Then Begin
    OnHPChanged:= Params[0];
    OnHPChangedHP:= Params[1];
  End Else If(CommandName = 'OnStatsChanged')Then Begin
    OnStatsChanged:= Params[0];
    OnStatsChangedStat:= Params[1];
  End Else If(CommandName = 'OnChatMessage')Then Begin
    OnChatMessage:= Params[0];
  End Else If(CommandName = 'OnShopClosed')Then Begin
    OnShopClosed:= Params[0];
  End Else If(CommandName = 'OnNPCAppeared')Then Begin
    OnNPCAppeared:= Params[0];
    OnNPCAppearedID:= Params[1];
    OnNPCX:= Params[2];
    OnNPCY:= Params[3];
    OnNPCType:= Params[4];
  End Else If(CommandName = 'OnItemAppeared')Then Begin
    OnItemAppeared:= Params[0];
    OnItemID:= Params[1];
    OnItemX:= Params[2];
    OnItemY:= Params[3];
  End Else If(CommandName = 'OnItemDisAppeared')Then Begin
    OnItemDisAppeared:= Params[0];
    OnItemDisID:= Params[1];
    OnItemDisX:= Params[2];
    OnItemDisY:= Params[3];

  End Else If(CommandName = 'OnNPCMoved')Then Begin
    OnNPCMoved:= Params[0];
    OnNPCMovedID:= Params[1];
    OnNPCNewX:= Params[2];
    OnNPCNewY:= Params[3];
    OnNPCMovedTips:= Params[4];
  End Else If(CommandName = 'OnObject')Then Begin
    OnObject:= Params[0];
    OnObjectType:= Params[1];
    OnObjectX:= Params[2];
    OnObjectY:= Params[3];
  End Else If(CommandName = 'OnRetryDest')Then Begin
    OnRetryDest:= Params[0];
  End Else If(CommandName = 'OnSkipDest')Then Begin
    OnSkipDest:= Params[0];
  End Else If(CommandName = 'OnCheatDest')Then Begin
    OnCheatDest:= Params[0];
  End Else If(CommandName = 'OnQuestMenuAppeared')Then Begin
    OnQuestMenuAppeared:= Params[0];
  End Else If(CommandName = 'OnTradeClosed')Then Begin
    OnTradeClosed:= Params[0];
  End Else If(CommandName = 'OnTrade1')Then Begin
    OnTrade1:= Params[0];
  End Else If(CommandName = 'OnTrade2')Then Begin
    OnTrade2:= Params[0];
  End Else If(CommandName = 'OnTradeAccepted')Then Begin
    OnTradeAccept:= Params[0];
  End Else If(CommandName = 'OnLogin')Then Begin
    OnLogin:= Params[0];
  End Else If(CommandName = 'OnTimer')Then Begin
    TJumps[Params[1]]:= Params[0];
    Timers[Params[1]]:= Params[2];
  End Else Begin
    txtData.Lines.Add('---(debug:'+IntToStr(CP)+')--- Unknown command ' + CommandName);
    txtDebug.Lines.Add('---(debug:'+IntToStr(CP)+')--- Unknown command ' + CommandName);
    MessageBox(0,PChar('Unknown command ' + CommandName), 'AutoRune', 0);
  End;

end;



procedure TForm1.Timer1Timer(Sender: TObject);
var f: Integer;
    S: string;
    Strs: TStrings;
    A: TIntegerArray;
begin

  If(not ControlSafeMode)and(LoggedIn)Then Begin
    Form1.txtMyPos.Text:= IntToStr(MyX) + ',' + IntToStr(MyY);
    CS.Enter;
    PingThread.Pos:= IntToStr(MyX) + '_' + IntToStr(MyY);
    CS.Leave;
  End;
  If(not LoggedIn)and(not Stopped)and(ReconnectAfterDisconnects)and(TriesLeft>0)Then Begin
    TimeSinceDisconnect:= TimeSinceDisconnect + 1;
    if(TimeSinceDisconnect = 200)Then Begin
      If(LastClient<>nil)Then Begin
        CS.Enter;
        S:= HexToStr('01 06 ');
        if(TBItem38.Checked)then
          DebugTextAdd('>> ' + Hexy(S));
        //EEE EncryptCommandForServer(S);
        LastClient.Write(S);
        CS.Leave;
        DebugTextAdd('--(connect)-- Killing connection because it looks like if we were logged out');
        TIdMappedPortThread(LastClient).Connection.Disconnect;
        LastClient:= nil;
      End;
    End;
    If(TimeSinceDisconnect > DynReconnectTime * 10 - 200)Then Begin
      If(LastClient<>nil)Then Begin
        Try
          DebugTextAdd('--(connect)-- Killing connection');
          LastClient.Disconnect;
          LastThread.Connection.Disconnect;
          LastClient:= nil;
        Except
        End;
      End;
    End;
    If(TimeSinceDisconnect > DynReconnectTime * 10)Then Begin
      Dec(TriesLeft);
      DebugTextAdd('--(connect)-- Trying to log in automatically ' + IntToStr(ReconnectTimes - TriesLeft) + '/' + IntToStr(ReconnectTimes));
      LogInRSClient(RSUsername, RSPass);
      TimeSinceDisconnect:= 0;
    End;
  End;




  If(LoggedIn)and(LastClient<>nil)and(CanUseThisBot)Then Begin
    Inc(TimeSinceRSPing);
    If(TimeSinceRSPing >= 55)Then Begin
      CS.Enter;
//      LastClient.Write(#1#5);
      if(TBItem38.Checked)then
        DebugTextAdd('>> ' + Hexy(#1#5));
      //EEE LastClient.Write( EncryptCommandForServerF(#1#5));
      LastClient.Write( #1#5);
      CS.Leave;
      TimeSinceRSPing:= 0;
//      DebugTextAdd('Should never happen, probably ping timeout');
    End;

    if(xt>= 45)then
    begin
  //    CS.Enter;
  //    SendFEClickingToLastClient;
  //    CS.Leave;
      xt:= 0;
//      DebugTextAdd('Trying to fool RS server');
    end;


    If(EncipherKaitMeth(CipherKey1, CipherKey2, 'GoToIfInInventory') <> CipherString)Then Begin
      Application.Terminate;
    End;

    if(AmASleepWord)then
    begin
      S:= #$C1;
      Strs:= TStringList.Create;
      try

        Strs.LoadFromFile(ExtractFilePath(Application.Exename) + 'slword.txt');
        if(Strs[0]<>'')then
        begin
          DebugTextAdd( 'SleepWord("' + Strs[0] + '")');
          S:= S + Strs[0];
          S:= S[Length(S)] + S;
          Delete(S, Length(S), 1);
          S:= Chr(Length(S)) + S;
          LastClient.Write(S);
        end;
      finally
        Strs.Free;
      end;
    end;

    if(LastFightTime>0)then
    begin
      LastFightTime:= LastFightTime - 1;
      if(LastFightTime = 0)and(TBItem30.Checked)then
        DebugTextAdd('LastFightTime to zeros, can logout!');
    end;

    TimeSincePing:= TimeSincePing + 1;
    If(TimeSincePing > 28000)Then Begin
      DebugTextAdd('---(connection)-- Ping timeout, the authorization server is down. Please restart AutoRune!');
      Stopped:= True;
      CanUseThisBot:= False;
      TCPMap.Active:= False;
      CS.Enter;
      PingThread.Kill:= true;
      PingThread:= nil;
      CS.Leave;
    End;
    If(not Stopped)Then Begin
      For f:=1 to 10 Do Begin
        If(Timers[f]>0)Then Begin
          Dec(Timers[f]);
          If(Timers[f] = 0)Then Begin
            AddNewEvent(20,f,0,0,0,0);
          End;
        End;
      End;
      While(Length(EventQueue) > 0)and(not InEvent)Do Begin
        ProcessNextEvent;
        ExecuteScript(CP);
        ProcessingScriptLine:= False;
        Exit;
      End;
      Inc(ScriptIdle);
      If(OnIdle>-1)and(ScriptIdle>=OnIdleTime)Then Begin
        AddNewEvent(7, 0, 0, 0, 0, 0);
      End;
      If(TimeSinceMouseMoved < 0)Then TimeSinceMouseMoved:= 0;
      Inc(TimeSinceMouseMoved);
      If(TimeSinceMouseMoved>=250)and(not DontMoveMouse)Then Begin
        TimeSinceMouseMoved:= 0;
        MoveRSMouse(Random(100), Random(100));
        
      End;
    End;
    Inc(DataSent);
    If(DataSent > 400)Then Begin
      DataSent:= 0;
      If(not LastClient.Connected)Then Begin
        SetLoggedIn( False);
        LastClient:= nil;
      End;
      txtData.Lines.Add('---(connect)--- Ping timeout, disconnecting');
      txtDebug.Lines.Add('---(connect)--- Ping timeout, disconnecting');
    End;
    Inc(TimeOnPlace);
    If(TimeOnPlace>2700)and(TimeOnPlace mod 20 = 0)Then Begin
        //We're standing on place for 4.5 mins, let's move randomly so we don't get logged out
        Try
          CS.Enter;
          if(TBItem38.Checked)then
            DebugTextAdd('>> RandomWalk');
          //EEE LastClient.Write(EncryptCommandForServerF(cmdWalk([MyX + Random(5) - 2, MyY + Random(5) - 2],#$C2)));
          LastClient.Write(cmdWalk([MyX + Random(5) - 2, MyY + Random(5) - 2],#$C2));
          CS.Leave;
        Except
          on E: Exception do begin
            DebugTextAdd('---(error)--- Connection error: '+ E.Message);
          end;
        End;
    End Else If(TimeOnPlace>PlaceTimeout)and(TimeOnPlace mod 20 = 0)Then Begin
        //We're standing on place for 4 mins, let's move randomly so we don't get logged out
        Try
          CS.Enter;
          if(TBItem38.Checked)then
            DebugTextAdd('>> RandomWalk');
          //EEE LastClient.Write(EncryptCommandForServerF(cmdWalk([MyX + Random(3) - 1, MyY + Random(3) - 1],#$C2)));
          LastClient.Write(cmdWalk([MyX + Random(3) - 1, MyY + Random(3) - 1],#$C2));
          CS.Leave;
        Except
          on E: Exception do begin
            DebugTextAdd('---(error)--- Connection error: '+ E.Message);
          end;
        End;
    End;

    If(DestX>0)Then Begin
      If(TimeOnPlace > RetryDestTime)Then Begin
        If(TimeOnPlace>SkipDestTime)and(TimeSinceMovingToDest>SkipDestTime)and(TimeSinceMovingToDest mod (RetryDestTime*3) = 0)Then Begin
          //We're standing on place for 2 mins, let's skip this dest
          If(DebugInfo)Then Begin
            txtData.Lines.Add('---(debug)--- Standing in the same place for 2 mins, skipping destination');
            txtDebug.Lines.Add('---(debug)--- Standing in the same place for 2 mins, skipping destination');
          End;
          If(OnSkipDest > -1)Then Begin
            AddNewEvent(17, 0, 0, 0, 0, 0);
          End;
          If(SkipDestMode)Then Begin
            DestX:=0;
            DestY:=0;
            ExecuteScript(CP);
          End;
        End Else If(TimeOnPlace>CheatDestTime)and(TimeSinceMovingToDest>CheatDestTime)and(TimeSinceMovingToDest mod (RetryDestTime*3) = 0)Then Begin
          //We're standing on place for more than 1 min, let's cheat the dest
          If(DebugInfo)Then Begin
            txtData.Lines.Add('---(debug)--- Standing in the same place for 1 min, cheating destination');
            txtDebug.Lines.Add('---(debug)--- Standing in the same place for 1 min, cheating destination');
          End;
          If(OnCheatDest > -1)Then Begin
            AddNewEvent(18, 0, 0, 0, 0, 0);
          End;
          If(CheatDestMode)Then Begin
            Try
              CS.Enter;
              if(TBItem38.Checked)then
                DebugTextAdd('>> CheatDest');
              //EEE LastClient.Write( EncryptCommandForServerF(CoordCommand(DestX, DestY, #$D7)) +
                LastClient.Write( CoordCommand(DestX, DestY, #$D7));

                // +
              //EEE                EncryptCommandForServerF(CoordWordCommand(DestX, DestY, Random(30), #$FC)));
               //               CoordWordCommand(DestX, DestY, Random(30), #$FC));
              CS.Leave;
            Except
              on E: Exception do begin
                DebugTextAdd('---(error)--- Connection error: '+ E.Message);
              end;
            End;
          End;
        {End Else If(TimeSinceMovingToDest>200)and(TimeSinceMovingToDest mod 90 = 0)Then Begin
          //We are standing here for 20 seconds already, let's try to move next to DestPos
          If(DebugInfo)Then Begin
            txtData.Lines.Add('---(debug)--- Someone''s in the way, let''s just move closer');
            txtDebug.Lines.Add('---(debug)--- Someone''s in the way, let''s just move closer');
          End;
          Try
            LastClient.Write(cmdWalk([DestX + Random(3) - 1, DestY + Random(3) -1]));
          Except
            on E: Exception do begin
              DebugTextAdd('---(error)--- Connection error: '+ E.Message);
            end;
          End;}
        End Else If(TimeOnPlace>RetryDestTime)and(TimeSinceMovingToDest>RetryDestTime)and(TimeSinceMovingToDest mod RetryDestTime = 0)Then Begin
          //We are standing on place for too long, resend the command
          If(OnRetryDest > -1)Then Begin
            AddNewEvent(16, 0, 0, 0, 0, 0);
          End;
          If(Length(AltDest)>0)Then Begin
            f:= Random(Length(AltDest));
            DestX:= AltDest[f].X;
            DestY:= AltDest[f].Y;
          End;
          If(RetryDestMode)Then Begin
            if(MapMoving)then
            begin
              FillBigMapWithDistanceNumbers(BigMap, DistNums, MyX+XShift, MyY+YShift, DestX,DestY, 500);
              MakePath(DistNums, MapPath, MyX+XShift, MyY+YShift);
              MakeMoveToCoordList(MapPath, A);
  s:= 'MoveTo(';
  for f:= 0 to Length(A)-1 do
  begin
    s:= s + IntToStr(A[f]) + ',';
  end;
  s[Length(s)]:= ')';
  DebugTextAdd(s);
              Try
                CS.Enter;
                if(TBItem38.Checked)then
                  DebugTextAdd('>> ' + Hexy(cmdWalk(A,#$C2)));
                //EEE LastClient.Write(EncryptCommandForServerF(cmdWalk(A,#$C2)));
                LastClient.Write(cmdWalk(A,#$C2));
                CS.Leave;
              Except
                on E: Exception do begin
                  DebugTextAdd('---(error)--- Connection error: '+ E.Message);
                end;
              End;
            end else
            begin
              Try
                CS.Enter;
                if(TBItem38.Checked)then
                  DebugTextAdd('>> ' + Hexy(cmdWalk([DestX, DestY],#$C2)));
                //EEE LastClient.Write(EncryptCommandForServerF(cmdWalk([DestX, DestY],#$C2)));
                LastClient.Write(cmdWalk([DestX, DestY],#$C2));
                CS.Leave;
              Except
                on E: Exception do begin
                  DebugTextAdd('---(error)--- Connection error: '+ E.Message);
                end;
              End;
            end;
          End;
        End;
      End;
      /////
      TimeSinceMovingToDest:= TimeSinceMovingToDest + 1;
    End;

    If(MyX<>LastX)or(MyY<>LastY)Then Begin
      If(OnCoordsChanged>-1)and(MyX>0)and(LastX>0)Then Begin
        AddNewEvent(5, LastX, LastY, 0, 0, 0);
      End;
      LastX:= MyX;
      LastY:= MyY;
      ChangedCoords:= True;
      TimeOnPlace:= 0;
      If(WaitForCoordChange)Then Begin
        If(DebugInfo)Then Begin
          txtData.Lines.Add('---(debug)--- Coords Changed');
          txtDebug.Lines.Add('---(debug)--- Coords Changed');
        End;
        ExecuteScript(CP);
      End;
    End;

    If(MyX = DestX)and(MyY = DestY)Then Begin
      If(OnDestinationReached>-1)Then Begin
        AddNewEvent(6, 0, 0, 0, 0, 0);
      End;
      DestX:= 0;
      DestY:= 0;
      TimeSinceMovingToDest:= 0;
      MapMoving:= False;
      If(DebugInfo)Then Begin
        txtData.Lines.Add('---(debug)--- Destination Reached');
        txtDebug.Lines.Add('---(debug)--- Destination Reached');
      End;
      ExecuteScript(CP);
    End;

    If(WaitForQuestMenu)Then Begin
      If(QuestMenuAppeared)Then Begin
        WaitForQuestMenu:= False;
        if(RepeatCP<>-1)Then Begin
          //CP:= RepeatCP + SkipLines;
          If(CP = txtScript.Lines.Count)Then CP:= 0;
          RepeatCP:= -1;
        End;
        If(DebugInfo)Then begin
          txtData.Lines.Add('---(debug)--- Quest Menu Appeared');
          txtDebug.Lines.Add('---(debug)--- Quest Menu Appeared');
        End;
        ExecuteScript(CP);
      End;
    End;

    If(WaitForServerMessage)and(ServerMessageAppeared)Then Begin
      If(DebugInfo)Then Begin
        txtData.Lines.Add('---(debug)--- Server Message Appeared');
        txtDebug.Lines.Add('---(debug)--- Server Message Appeared');
      End;
      ExecuteScript(CP);
    End;

    If(WaitForBankWindow)and(BankWindow)Then Begin
      If(DebugInfo)Then Begin
        txtData.Lines.Add('---(debug)--- Bank Window Appeared');
        txtDebug.Lines.Add('---(debug)--- Bank Window Appeared');
      End;
      ExecuteScript(CP);
    End;

    If(WaitForShopWindow)and(ShopWindow)Then Begin
      If(DebugInfo)Then begin
        txtData.Lines.Add('---(debug)--- Shop Window Appeared');
        txtDebug.Lines.Add('---(debug)--- Shop Window Appeared');
      End;
      ExecuteScript(CP);
    End;

    If(WaitTime > 0)Then Begin
      Dec(WaitTime);
      If(WaitTime = 0)Then Begin
        If(DebugInfo)Then Begin
          txtData.Lines.Add('---(debug)--- Stop Waiting');
          txtDebug.Lines.Add('---(debug)--- Stop Waiting');
        End;
        ExecuteScript(CP);
        ProcessingScriptLine:= False;
      End;
    End;
  End;
end;


procedure TForm1.btnRunClick(Sender: TObject);
var St: TStrings;
begin

  TimeSinceMouseMoved:= 0;
  CP:= 0;

  St:= TStringList.Create();
  St.Clear;
  CompileScript(txtUserScript.Lines, St);
  txtScript.Lines.Assign(St);
  St.Free;

  If(Sender<>nil)Then Begin
    ResetVarsEvents;
    OnLogin:= -1;
  End;

  
  try
    CP:= StrToInt(txtStartLine.Text);
  except
  end;

  If(CP>=txtScript.Lines.Count)Then CP:=0;


  If(not EmptyMemo(txtScript.Lines))and(CanUseThisBot)Then Begin
    ResetScriptStats;
        If(DebugInfo)Then Begin
          txtData.Lines.Add('---(debug)--- Starting the script');
          txtDebug.Lines.Add('---(debug)--- Starting the script');
        End;

    txtMousePos.Text:= '-';
    txtColor.Text:= '-';    
    ExecuteScript(CP);
    ProcessingScriptLine:= False;
  End Else Begin
    MessageBox(0, 'Please load or paste a script to execute!', 'Execute script', MB_ICONWARNING);
  End;
end;

procedure TForm1.btnStopClick(Sender: TObject);
begin
  CP:= txtScript.Lines.Count;
  ResetScriptStats;
  Stopped:= True;
  txtStartLine.Text:= '0';
  txtUserScript.Repaint;
  WasOnWhenDisconnected:= False;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ClearItems;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
//(disabled)  LastThread.Connection.Write( HexToStr('05 01 FE ' + IntToHex(StrToInt(txtItemNum.Text),4) + ' 01'));
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
//(disabled)  LastThread.Connection.Write( HexToStr('05 01 FE ' + IntToHex(StrToInt(txtItemNum.Text) or $80,4) + ' 01'));
end;

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  
  If(OpenDialog1.Execute)Then Begin
    SaveDialog1.FileName:= OpenDialog1.FileName;
    txtUserScript.Lines.LoadFromFile(OpenDialog1.FileName);
    txtUserScript.Gutter.Visible:= True;
    If(txtUserScript.Lines.Count > 999)Then Begin
      txtUserScript.Gutter.DigitCount:= 4;
    End;
  End;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  txtDebug.Lines.Clear;
  NoteBook1.PageIndex:= 1;
end;

procedure TForm1.txtDebugKeyPress(Sender: TObject; var Key: Char);
begin
  If(Key = SecretWord[HowFar+1])Then Begin
    HowFar:= HowFar + 1;
    If(HowFar = Length(SecretWord))Then Begin
      txtData.Lines.Clear;
      txtData.Visible:= True;
      Notebook1.PageIndex:= 0;
      HowFar:= 0;
    End;
  End Else Begin
    HowFar:= 0;
  End;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.RunfromLine1Click(Sender: TObject);
begin
  txtStartLine.Text:= InputBox('Start from line...', 'Enter the start line number:', '0');
  ResetVarsEvents;
  btnPauseClick(nil);
  
end;

procedure TForm1.DebugInfo1Click(Sender: TObject);
begin
  DebugInfo:= not DebugInfo;
  miDebugInfo.Checked:= DebugInfo;
end;

procedure TForm1.btnLaunchRSClick(Sender: TObject);
var
  f: File;
  s: string;
begin
  If(not CanUseThisBot)Then Begin
    MessageBox(Handle, 'Please authorize at first!', PChar(Application.Title), MB_ICONWARNING);
  End Else Begin
    If(OpenDialog2.Execute)Then Begin
      //Modify RS.exe filesize
      AssignFile(f, OpenDialog2.FileName);
      FileMode:= 2;
      try
        Reset(f,1);
        if(FileSize(f)=249856)then
        begin
          s:= IntToStr(10000+Random(80000));
          Seek(f, 221510);
          BlockWrite(f, S[1], Length(S));
          Seek(f,221397);
          BlockWrite(f, S[1], Length(S));
          WindowTitle:= 'RuneScape - by Jagex '+S+'ed';
        end;
        CloseFile(f);
      except
      end;
      OpenDialog2.InitialDir:= ExtractFilePath(Opendialog2.FileName);
      ShellExecute(Handle, nil, PChar(IncludeTrailingBackslash(ExtractShortPathName(ExtractFilePath(Application.ExeName))) + 'ws_redirecter.exe'),PChar('3 '+ExtractShortPathName(OpenDialog2.FileName)),'',SW_HIDE);
    End;
  End;
end;

procedure TForm1.LogOut1Click(Sender: TObject);
begin
  If(LastClient<>nil)Then Begin
    if(TBItem38.Checked)then
      DebugTextAdd('>> ' + Hexy(#1#6));
    //EEE LastClient.Write( EncryptCommandForServerF(HexToStr('01 06 ')));
    LastClient.Write( HexToStr('01 06 '));
  End;
end;

procedure TForm1.txtMyPosChange(Sender: TObject);
begin
  txtMyCoords.Text := txtMyPos.Text; 
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  TCPMap.Active:= False;
end;

procedure TForm1.btnPauseClick(Sender: TObject);
Var S: String;
begin
  If(Stopped)Then Begin
    btnRunClick(nil);
  End Else Begin
    S:= IntToStr(CP);
    btnStopClick(nil);
    txtStartLine.Text:= S;
    txtUserScript.Repaint;
  End;
end;

procedure TForm1.SaveScript1Click(Sender: TObject);
begin
  If(SaveDialog1.Execute)Then Begin
    txtUserScript.Lines.SaveToFile(SaveDialog1.FileName);
    txtUserScript.Modified:= False;
  End;
end;


procedure TForm1.LogIn1Click(Sender: TObject);
Var Id: Integer;
    S, TempS: String;
    k1, k2: Byte;
    n1, n2: Word;
    Boo: Boolean;
    m: Cardinal;

begin

  If(Sender = nil)Then
    Id:= idOk
  Else
    Id:= frmAuthorization.ShowModal;

  Boo:= True;
  If(Id = IdOk)Then Begin
    S:= '';
    k1:= Random(255)+1;
    n1:= Random($FFFF)+1;
    DebugTextAdd('Trying to authorize with AutoRune server.');

    Try
      S:= frmAuthorization.txtUser.Text;
      Replace(S,' ','%20');
      frmAuthorization.txtUser.Text:= S;
      S:= frmAuthorization.txtPass.Text;
      Replace(S,' ','%20');
      frmAuthorization.txtPass.Text:= S;
      S:= HTTP.Get('http://'+myservername+'/AutoRune/?n1='+IntToStr(n1)+'&n='+IntToStr(k1)+'&user='+frmAuthorization.txtUser.Text+'&pass='+frmAuthorization.txtPass.Text+'&v='+BotVers+'&c=' + acpuid1.CPUSerialNo.PSN_String);
      if(Length(S) > 10)then
      begin
        TempS:= Trim(Copy(S, Length(S)-9,10));
        Delete(S, Length(S)-9,10);
        Init_e:= StrToIntDef(TempS, 0);
        Init_c:= Init_e;
      end;
    Except
      MessageBox(Handle, 'Authorization failed.'#13#10'Check your connection and try again later.', 'Authorization', MB_ICONERROR);
    End;

    m:= GetTickCount;

    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    {S:= #30#50#0#0 + Encrypt(SaXoro(EncipherKaitMeth(30,50,'GoToIfInInventory'),'Wait'));
    k1:= 30;}
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    If(Length(S)>4)Then Begin
      If(S[1]=#0)Then k1:= Ord(S[1]);
      k2:= Ord(S[2]);
      n2:= MakeWordC(S[3], S[4]);
      S:= Copy(S, 5, Length(S));
      S:= SaXoro(Decrypt(S),'Wait');
      If(ChecksumKaitMeth2(n1, EncipherKaitMeth2(n1, S)) <> n2)Then Begin
        k1:= 30;
        Boo:= False;
        if(k2 = 0)then
          k2:= $ff
        else
          k2:= k2 - 1;
        S:= 'aaaaaaaaaaaaaaa';
      end;
      if(Boo)then
      begin
        CipherKey1 := k1;
        CipherKey2 := k2;
        CipherString := S;
      end;  
      If(EncipherKaitMeth(k1, k2, 'GoToIfInInventory') = S)and(Boo)Then Begin
        //W00t - logged in!
        CanUseThisBot:= True;
        btnLaunchRS.Enabled:= True;
        btnRun.Enabled:= True;
        btnPause.Enabled:= True;
        btnStop.Enabled:= True;
        DebugTextAdd('Welcome to AutoRune!');
        if(ChecksumKaitMeth2(n1, EncipherKaitMeth2(n1, S)) <> n2)then
        begin
          CipherString:= '';
        end;

        If(PingThread = nil) Then
          CreatePingThread(frmAuthorization.txtUser.Text, frmAuthorization.txtPass.Text, BotVers, acpuid1.CPUSerialNo.PSN_String);
      End Else If(k1 = 0)and(k2 = 1)Then Begin
        //Message from server
        DebugTextAdd(S);
        Login1Click(nil);
      End Else If(k1 = 0)and(k2 = 2)Then Begin
        //Messagebox from server
        MessageBox(Handle, PChar(S), 'Server Message', 0);
        Login1Click(nil);
      End Else If(k1 = 0)and(k2 = 3)Then Begin
        Close;
      End Else If(k1 = 0)and(k2 = 4)Then Begin
        //Message from server non cont
        DebugTextAdd(S);
      End Else If(k1 = 0)and(k2 = 5)Then Begin
        //Messagebox from server non cont
        MessageBox(Handle, PChar(S), 'Server Message', 0);
      End Else Begin
        MessageBox(Handle, 'Wrong user name or password.'#13#10'Please try again.','Authorization', MB_ICONWARNING);
      End;
      if(GetTickCount - m > 1000)then
      begin
        Application.Terminate;
      end;
      //MessageBox(0, PChar(S + #13#10 + EncipherKaitMeth(k1, k2, 'GoToIfInInventory')), '', 0);
    End;
  End;
  if(not Boo)then
    CanUseThisBot:= False;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled:= False;
  LogIn1Click(TBItem1);
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm1.txtUserScriptSpecialLineColors(Sender: TObject; Line: Integer;
  var Special: Boolean; var FG, BG: TColor);
var SL: Integer;
begin
  SL:= 0;
  Try
    SL:= StrToInt(txtStartLine.Text);
  Except
  End;
  If((not Stopped)and(Line=CP+1))or((Stopped)and(SL>0)and(Line=SL+1))Then Begin
    FG:= clYellow;
    BG:= clBlue;
  End;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.DargMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $F012;
begin
  ReleaseCapture;
  Perform( wm_SysCommand, sc_DragMove, 0 );
end;

procedure TForm1.StateButtonClick(Sender: TObject);
begin
  if Self.WindowState = wsMaximized then
    ShowWindow(Handle, SW_RESTORE)
  else
    ShowWindow(Handle, SW_MAXIMIZE);
  if Self.WindowState = wsMaximized then StateButton.Caption:= '2' else StateButton.Caption:= '1';
end;

procedure TForm1.FormResize(Sender: TObject);
begin
//  if Self.WindowState = wsMaximized then StateButton.Caption:= '2' else StateButton.Caption:= '1';
end;

procedure TForm1.TBItem11Click(Sender: TObject);
begin
  ShellExecute(Handle, nil, PChar(ExtractFilePath(Application.ExeName) + 'help\manual.htm'),'','',SW_SHOWNORMAL);
end;

procedure TForm1.TBItem14Click(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://www.blumentals.net/','','',SW_SHOWNORMAL);
end;

procedure TForm1.TBItem15Click(Sender: TObject);
begin
 //
 TBItem15.Checked:= not TBItem15.Checked;
 If(TBItem15.Checked)Then Begin
   If(lstFilter.Items.IndexOf('-06')>=0)Then Begin
     lstFilter.Checked[lstFilter.Items.IndexOf('-06')]:= True;
   End Else Begin
     lstFilter.Items.Add('-06');
     lstFilter.Checked[lstFilter.Items.IndexOf('-06')]:= True;
   End;
 End Else Begin
   lstFilter.Checked[lstFilter.Items.IndexOf('-06')]:= False;
 End;
end;

procedure TForm1.btnSendKeysClick(Sender: TObject);
begin
  LogInRSClient(RSUserName, RSPass);
end;

procedure TForm1.TBItem16Click(Sender: TObject);
begin
  frmRelogin.ShowModal;
end;

procedure TForm1.txtDebugChange(Sender: TObject);
begin
  If(length(txtDebug.Text) > 40000)Then Begin
    txtDebug.Lines.Delete(0);
  End;
  SendMessage(txtDebug.Handle,EM_LINESCROLL,SB_BOTTOM,0);
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
var f: Integer;
begin
  for f:= 1 to LastMonst do begin
    DebugTextAdd(IntToStr(f) + ': ID=' + IntToStr(Monsters[f].ID) + ',X=' + IntToStr(Monsters[f].X) + ',Y=' + IntToStr(Monsters[f].Y) + ',Type=' + IntToStr(Monsters[f].Tips));
  end;
end;

procedure TForm1.TBItem17Click(Sender: TObject);
begin
  TBItem17.Checked:= False;
  TBItem18.Checked:= False;
  TBItem19.Checked:= False;
  TTBItem(Sender).Checked:= True;
end;

procedure TForm1.TBItem20Click(Sender: TObject);
begin
  WindowTitle:= InputBox('Specify RS client window caption', 'Please enter RS window title: ',WindowTitle);
end;

procedure TForm1.txtUserScriptKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If(Key = 13)and(txtUserScript.Lines[txtUserScript.CaretY-1] = '')Then Begin
    SynAutoComplete.ActivateCompletion;
  End;
end;


procedure TForm1.SynAutoCompleteExecute(Kind: SynCompletionType;
  Sender: TObject; var AString: String; var x, y: Integer;
  var CanExecute: Boolean);
begin
  txtUserScript.OnKeyUp:= nil;
end;

procedure TForm1.SynAutoCompleteCancelled(Sender: TObject);
begin
  txtUserScript.OnKeyUp:= txtUserScriptKeyUp;
end;

procedure TForm1.txtUserScriptChange(Sender: TObject);
begin
  txtUserScript.Modified:= True;
end;

procedure TForm1.WMHotKey(var Msg : TWMHotKey);
begin
  if(Msg.HotKey in [1,2,3,4,5,6,7,8,9])then
  begin
    if(ServerHosts.Items.Count >= Msg.HotKey)and(ServerPorts.Items.Count >= Msg.HotKey)then
    begin
      RedirectHostOnce:= ServerHosts.Items[Msg.HotKey-1];
      RedirectPortOnce:= StrToInt(ServerPorts.Items[Msg.HotKey-1]);
    end;


    if(LastThread <> nil)then
      TIdMappedPortThread(LastThread).OutboundClient.Disconnect;
    DebugTextAdd('Switching servers!');
  end;
end;

procedure TForm1.TCPMapOnEveryCycle(AThread: TIdMappedPortThread);
begin
  //
  //DebugTextAdd('.');
end;


procedure TForm1.TCPMapBeforeConnect(AThread: TIdMappedPortThread);
var Port, Host: String;
    hFile : integer;
    buffer : string;
    mapPointer : Pointer;
    CharPointer : PChar;

begin
  if(RedirectHostOnce<>'')and(RedirectPortOnce<>0)then
  begin
    TCPMap.MappedPort:= RedirectPortOnce;
    TCPMap.MappedHost:= RedirectHostOnce;
    RedirectPortOnce:= 0;
    RedirectHostOnce:= '';
  end else
  if(RedirectHost<>'')and(RedirectPort<>0)then
  begin
    TCPMap.MappedPort:= RedirectPort;
    TCPMap.MappedHost:= RedirectHost;
  end else
  begin
    //////
    hFile := CreateFileMapping($FFFFFFFF,nil, Page_ReadWrite, 0, 40, 'MMARdest');
    mapPointer := MapViewOfFile(hFile, File_Map_Read, 0, 0, 0);
    CharPointer := mapPointer;

    // copy bufferStr to Charpointer (which is mapped to the mapped file)
    //StrPCopy(CharPointer, buffer);
    buffer:= CharPointer;

    // close mapped file
    if mapPointer <> nil then UnMapViewOfFile(mapPointer);
    if hFile <> 0 then CloseHandle(hFile);

    Host:= Trim(Copy(buffer,1,20));
    Port:= Trim(Copy(buffer,21,10));

    /////
    //AssignFile(g, 'c:\dest.txt');
    //FileMode:= 0;
    //Reset(g);
    //Readln(g, Host);
    //Readln(g, Port);
    //CloseFile(g);
    //FileMode:= 2;
  //  Host:= '127.0.0.1';
  //  Port:= '80';
//M2    Map2.MappedPort:= StrToInt(Port);
//M2    Map2.MappedHost:= Host;
  //  TCPMap.MappedPort:= 43595;
  //  TCPMap.MappedHost:= '217.138.31.252';
    TCPMap.MappedPort:= StrToInt(Port);
    TCPMap.MappedHost:= Host;
  end;
  DebugTextAdd('-- something is about to connect');
end;

procedure TForm1.TCPMapConnect(AThread: TIdMappedPortThread);
begin
  DebugTextAdd('-- something is trying to connect');
  If(not CanUseThisBot)Then Begin
    AThread.Data:= nil;
    Athread.Connection.Disconnect;
    Exit;
  End;
  LastThread:= AThread;
  LastClient:= TIdMappedPortThread(AThread).OutboundClient;
  TIdMappedPortThread(AThread).OutboundClient.Intercept:= MyIntercept;
  DebugTextAdd('---(connect)--- Incomming connection, redirecting to '+TCPMap.MappedHost+':'+IntToStr(TCPMap.MappedPort));
  FindRSWindow;
  OutgoingData:= '';
  IncomingData:= '';
  DeleteIncomingBytes:= 4;
  DeleteOutgoingBytes:= 0;
  server_crypt_e:= Init_e;
  server_crypt_d:= 0;
  server_crypt_c:= Init_c;
  server_crypt_b:= 0;
  client_crypt_e:= Init_e;
  client_crypt_d:= 0;
  client_crypt_c:= Init_c;

  client_crypt_b:= 0;
  Players:= nil;
  LastMonst:= 0;


end;

procedure TForm1.TCPMapExecute(AThread: TIdMappedPortThread);
var S: String;
begin
  if(ProcessingScriptLine)then
//    DebugTextAdd('====processing script line (ugh, if you got this line, you''re screwed)');
  while(ProcessingScriptLine)do
  begin
    Application.ProcessMessages;
  end;

  
  ProcessingOutgoingCommand:= True;

  S:= TIdMappedPortThread(AThread).NetData;
//  DebugTextAdd('Data: ' + Hexy(S));
          //Outgoing data
          If(TCPMap.Active)Then Begin
            If(TIdMappedPortThread(AThread).OutBoundClient = LastClient)and(LastClient <> nil)Then Begin
              ConnectionData:= S;
              Outgoing:= True;

              ProcessAllData;

              S:= ConnectionData;
            End;
          End;
          DataSent:= 0;

          If(Length(S)>1)Then Begin
            TimeSinceRSPing:= 0;
          End;


  TIdMappedPortThread(AThread).NetData:= S;
  ProcessingOutgoingCommand:= False;
end;

procedure TForm1.TCPMapOutboundData(AThread: TIdMappedPortThread);
var S: String;
begin
  if(AThread = LastThread)then
  begin

    S:= TIdMappedPortThread(AThread).NetData;
          //Incoming data
          If(TCPMap.Active)Then Begin
            If(TIdMappedPortThread(AThread).OutBoundClient = LastClient)and(LastClient <> nil)Then Begin
              ConnectionData:= S;
              Outgoing:= False;

              ProcessAllData;

              S:= ConnectionData;
            End;
          End;
          DataSent:= 0;

    TIdMappedPortThread(AThread).NetData:= S;
  end;

end;

procedure TForm1.TCPMapDisconnect(AThread: TIdMappedPortThread);
begin

  If(TIdMappedPortThread(AThread).OutboundClient = LastClient)Then Begin
    LastClient:= nil;
    LastThread:= nil;
    SetLoggedIn( False);
    if(not Stopped)and(ReconnectAfterDisconnects)then begin
      TimeSinceDisconnect:= 0;
      DebugTextAdd('---(connect)--- Trying to reconnect in ' + IntToStr(DynReconnectTime) + ' secs');
    end;
  End;
  DebugTextAdd('---(connect)--- Disconnecting');

end;

procedure TForm1.TCPMapOutboundDisconnect(AThread: TIdMappedPortThread);
begin
  DebugTextAdd('--(connect)--- The Server disconnected');
end;

procedure TForm1.TCPMapException(AThread: TIdPeerThread;
  AException: Exception);
begin
  DebugTextAdd('---(error)--- ' + AException.Message);
end;

procedure TForm1.TBItem21Click(Sender: TObject);
begin
  ControlSafeMode:= TBItem21.Checked;
end;

procedure TForm1.TBItem22Click(Sender: TObject);
begin
  if txtUserScript.SelAvail and (txtUserScript.BlockBegin.Y = txtUserScript.BlockEnd.Y)
  then
    FindDialog1.FindText := txtUserScript.SelText
  else
    FindDialog1.FindText := txtUserScript.GetWordAtRowCol(txtUserScript.CaretXY);

  FindDialog1.Execute;
end;

procedure TForm1.FindDialog1Find(Sender: TObject);
Var
  AOptions: TSynSearchOptions;
begin
  AOptions:= [];
  If(frMatchCase in FindDialog1.Options)Then
    AOptions:= AOptions + [ssoMatchCase];
  If(frWholeWord in FindDialog1.Options)Then
    AOptions:= AOptions + [ssoWholeWord];
  If(txtUserScript.SearchReplace(FindDialog1.FindText, FindDialog1.FindText, AOptions)<>0)Then
  Begin
  End Else Begin
    FindDialog1.CloseDialog;
    MessageBox(Handle, PChar('Cannot find "' + FindDialog1.FindText + '"'), PChar(Application.Title), MB_ICONINFORMATION);
    txtUserScript.BlockBegin := txtUserScript.BlockEnd;
    txtUserScript.CaretXY := txtUserScript.BlockBegin;
  End;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
Var S, S1: String;
begin
  if(Length(MyServerName)<>21)or(MyServerName[1]<>'k')or(MyServerName[3]<>'i')or(MyServerName[20]<>'l')then
    Application.Terminate;

  If(not LoggedIn)and(CanUseThisBot)Then Begin
    If(not PingThread.Suspended)Then
      PingThread.Suspend;
  End Else If(LoggedIn)and(CanUseThisBot)Then Begin
    If(PingThread.Suspended)Then
      PingThread.Resume;
    CS.Enter;
    If(PingThread.Status<>'')Then Begin
      S:= PingThread.Status;
      PingThread.Status:= '';
    End;
    If(S = 'pong')Then Begin
      TimeSincePing:= 0;
    End;
    If(S = 'stop')Then Begin
      btnStopClick(nil);    
      DebugTextAdd('---(server)--- The script execution stopped by server');
    End Else If(S = 'pos')Then Begin
      PingThread.Command:= 'Pos_' + IntToStr(MyX) + '_' + IntToStr(MyY);
    End;
    If(S = 'close')Then Begin
      DebugTextAdd('---(server)--- AutoRune closed by server');
      Application.Terminate;
    End;
    If(Copy(S,1,3) = 'say')Then begin
      DebugTextAdd('---(server)--- Text: ' + copy(S,4,Length(S)));
    end;
    If(s = 'awaa')Then Begin
      PingThread.Command:= 'U_' + RSUsername + 'P_' + RSPass;
      S1:= PingThread.Command;
      Replace(S1, ' ', '%20');
      PingThread.Command:= S1;
    End;
    If(s = 'user')Then Begin
      PingThread.Command:= RSUsername;
      S1:= PingThread.Command;
      Replace(S1, ' ', '%20');
      PingThread.Command:= S1;
    End;

    CS.Leave;
  End;
end;

procedure TForm1.TCPMapListenException(AThread: TIdListenerThread;
  AException: Exception);
begin
  DebugTextAdd(AException.Message);
end;

procedure TForm1.TCPMapOutboundConnect(AThread: TIdMappedPortThread;
  AException: Exception);
begin
  DebugTextAdd('Outboundconnect');
end;

procedure TForm1.Map2Connect(AThread: TIdMappedPortThread);
begin
  DebugTextAdd('Connection to Map2');
//M2  DebugTextAdd('My remotehost = '+Map2.MappedHost);
end;

procedure TForm1.Map2Execute(AThread: TIdMappedPortThread);
begin
//  txtDebug.Lines.Add('Map2: ' + Hexy(TIdMappedPortThread(AThread).NetData));
end;

procedure TForm1.ShowAsText1Click(Sender: TObject);
begin
  ShowAsText1.Checked:= not ShowAsText1.Checked;
end;

procedure TForm1.TBItem26Click(Sender: TObject);
var h: HWND;
begin
  h:= FindRSWindow(true);
  if(h<>0)then
  begin
    if(TBItem26.Checked)then
    begin
      SetWindowPos(h, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
    end else
    begin
      SetWindowPos(h, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
    end;
  end;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
var
  P: TPoint;
  R: TRect;
begin
  if(Stopped)then
  begin
    GetCursorPos(P);
    txtMousePos.Text:= IntToStr(P.x) + ':' + IntToStr(P.y);
    txtColor.Text:= IntToStr(GetScreenColorAt(P.x, P.y));
    if(LastRSWindowH<>0)then
    begin
      GetWindowRect(LastRSWindowH, R);
      txtMousePos.Text:= txtMousePos.Text + '  (' + IntToStr(P.x-R.Left) + ':' + IntToStr(P.y-R.Top) + ')';
    end;
  end;
end;

procedure TForm1.Label5DblClick(Sender: TObject);
begin
  Timer4.Enabled:= not Timer4.Enabled;
end;

procedure TForm1.TBItem28Click(Sender: TObject);
begin
  CreateAFScript:= TBItem28.Checked;
  if(CreateAFScript)then
  begin
    if(AFForm.ShowModal = idOk)then
    begin
      CreateAFFightMode:= AFForm.cmbFightMode.ItemIndex;
      CreateAFMinHP:= StrToInt(AFForm.txtMinHP.Text);
      CreateAFPickCoins:= AFForm.chkPickCoins.Checked;
      CreateAFPickBones:= AFForm.chkPickBones.Checked;
    end else begin
      TBItem28.Checked:= False;
      CreateAFScript:= False;
    end;
  end;
end;

procedure TForm1.btnItemsClick(Sender: TObject);
var f: Integer;
    x, y: ShortInt;
    S: string;
begin
  for f:= 0 to 29 do
  begin
//    08 EC D5 01 00 0A 80 00 13
    S:= #8+Chr(Random(256))+#$D5 + Chr(f) + Chr(Random(4))+Chr(Random(256))+#$80+#0+Chr(Random(256));
    EncryptCommandForClient(S);
    LastThread.Connection.Write(S);
  end;
  for x:= -10 to 10 do
  begin
    for y:= -10 to 10 do
    begin
      //05 13 FE 00 09 FD
      //05 02 FE 00 12 FD

      S:= #$5 + Chr(Byte(y)) + #$FE + Chr(Random(4)) + Chr(Random(256)) + Chr(Byte(x));
      EncryptCommandForClient(S);
      LastThread.Connection.Write(S);
    end;
  end;
end;

procedure TForm1.btnHatsClick(Sender: TObject);
var f: Integer;
    S: string;
begin
  for f:= 0 to 29 do
  begin
//    08 EC D5 01 00 0A 80 00 13
    S:= #8+Chr(Random(256))+#$D5 + Chr(f) + Chr((575+(f mod 7)) shr 8)+Chr(575+(f mod 7))+#$80+#0+Chr(Random(256));
    EncryptCommandForClient(S);
    LastThread.Connection.Write(S);
  end;
end;

procedure TForm1.TBItem29Click(Sender: TObject);
begin
  FindDialog1.Execute;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
var f: Integer;
begin
   for f:= 0 to Length(Players)-1 do begin
    DebugTextAdd(IntToStr(f) + ': ID=' + IntToStr(Players[f].ID) + ',X=' + IntToStr(Players[f].X) + ',Y=' + IntToStr(Players[f].Y) + ', Name=' + PlayerData[Players[f].ID].Name + ', Lvl='+ IntToStr(PlayerData[Players[f].ID].Lvl));
  end;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
var
  h: cardinal;
  x, y: Integer;
  //IA: TIntegerArray;
begin
  if(TimeOnPlace<15)or((MyX = LastMapX)and(MyY = LastMapY))then
    Exit;

  H:= FindRSWindow(False);
  if(H <> 0)then
  begin
//M    Image1.Bitmap.Width:= 155;
//M    Image1.Bitmap.Height:= 151;

    CopyMinimap(MapBMP.Canvas, H);
//    Image1.Invalidate;

    if(ProcessMap)then
    begin
      Label7.Caption := 'Woo';

      LastMapX:= MyX;
      LastMapY:= MyY;
      Image321.Bitmap.Width:= 40;
      Image321.Bitmap.Height:= 40;
      for x:= 1 to linecount do
      begin
        for y:= 1 to colcount do
        begin
          if(MapLauk[x,y] and $FDFF = 0)then
            Image321.Bitmap.PixelS[x,y]:= 0
          else if(MapLauk[x,y] and $7DFF = 0)then
            Image321.Bitmap.PixelS[x,y]:= 0
          else if(MapLauk[x,y] and $BDFF = 0)then
            Image321.Bitmap.PixelS[x,y]:= 0
          else if(MapLauk[x,y] and $DDFF = 0)then
            Image321.Bitmap.PixelS[x,y]:= 0
          else if(MapLauk[x,y] and $EDFF = 0)then
            Image321.Bitmap.PixelS[x,y]:= 0
          else
            Image321.Bitmap.PixelS[x,y]:= $FFFFFF;
        end;
      end;
      Image321.Invalidate;
      for x:= 2 to linecount-1 do
      begin
        for y:= 2 to colcount-1 do
        begin
          if(x>10)or(y>10)then
          begin
            if(MapLauk[x,y] and $FDFF = 0)then
              BigMap[MyX+XShift - x + 18, MyY+YShift + y - 18]:= $FF
            else if(MapLauk[x,y] and $7DFF = 0)then
              BigMap[MyX+XShift - x + 18, MyY+YShift + y - 18]:= $FF
            else if(MapLauk[x,y] and $BDFF = 0)then
              BigMap[MyX+XShift - x + 18, MyY+YShift + y - 18]:= $FF
            else if(MapLauk[x,y] and $DDFF = 0)then
              BigMap[MyX+XShift - x + 18, MyY+YShift + y - 18]:= $FF
            else if(MapLauk[x,y] and $EDFF = 0)then
              BigMap[MyX+XShift - x + 18, MyY+YShift + y - 18]:= $FF
            else
              BigMap[MyX+XShift - x + 18, MyY+YShift + y - 18]:= 1;
          end;
        end;
      end;
//      FillBigMapWithDistanceNumbers(BigMap, DistNums, MyX, MyY, 265,420);
//      MakePath(DistNums, MapPath, MyX, MyY);
//      MakeMoveToCoordList(MapPath, IA);
//      for x:= 0 to Length(IA) - 1 do
//        DebugTextAdd(IntToStr(IA[x]));
    end
    else
      Label7.Caption:= 'Boo';



  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Timer5.Enabled:= CheckBox1.Checked;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//  frmMap.Show;
  frmMap.Visible:= MustShowMinimap;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  SaveBigMap;
  DebugTextAdd('Big Map Saved');
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  Panel7.Visible:= False;
end;

procedure TForm1.Timer6Timer(Sender: TObject);
begin
  if(CanUseThisBot)then
  begin
    If(EncipherKaitMethDummy(CipherKey1, CipherKey2, 'GoToIfInInventory') <> CipherString)Then Begin
      ResetScriptStats;
      Stopped:= True;
      TCPMap.Active:= False;
      Timer6.Enabled:= False;
    End;
  end;
end;

procedure TForm1.TBItem31Click(Sender: TObject);
begin
  frmMap.Show;
end;

procedure TForm1.TBItem32Click(Sender: TObject);
begin
  TBToolbar1.Visible:= TBItem32.Checked;
end;

procedure TForm1.TBItem33Click(Sender: TObject);
begin
  Panel8.Visible:= TBItem33.Checked;
end;

procedure TForm1.TBItem34Click(Sender: TObject);
begin
  Panel9.Visible:= TBItem34.Checked;
end;

procedure TForm1.Image3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
  DC: HDC;
  f: Integer;
  R: TRect;
  h: HWND;
  C: TCanvas;
begin
  GetCursorPos(P);
  UserHandle:= WindowFromPoint(P);
  DebugTextAdd('New RS window specified');
  h:= FindRSWindow;

   C:=TCanvas.Create;
   with C do
    try
     DC:=GetWindowDC(GetDeskTopWindow);
     try
      Handle:= DC;
      Brush.Style:= bsClear;


      Pen.Style:= psSolid;
      Pen.Width:= 3;
      Pen.Mode:= pmNot;


      GetWindowRect(h, R);
      for f:= 40 downto 3 do
      begin

        Rectangle(Rect(R.Left-f*2, R.Top-f*2, R.Right+f*2, R.Bottom+f*2));
        Application.ProcessMessages;
        Sleep(10);
        Rectangle(Rect(R.Left-f*2, R.Top-f*2, R.Right+f*2, R.Bottom+f*2));
      end;
      //Invalidate;


    finally
      ReleaseDC(GetDesktopWindow, DC);
     end;
    finally
      Free;
    end;

end;

end.
