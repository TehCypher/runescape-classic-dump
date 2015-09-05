library hookSock;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils, Clipbrd, Math,
  Forms, Classes, madCodeHook, Winsock, Windows, Messages, OSUtils;

{$R *.RES}
var ConnectFuncHook : function (s: TSocket; var name: TSockAddr; namelen: Integer): Integer; stdcall;
//var GetWindowTextFuncHook : function (Handle: Cardinal; Text: PChar; I: Integer): Integer; stdcall;




function ConnectCallback(s: TSocket; var name: TSockAddr; namelen: Integer): Integer; stdcall;
var f, g:TextFile;
    {i,}i2:array[1..4]of byte;
    Port, OldPort:Word;
    A: SunB;
    hFile, szBuff : integer;
    buffer : string;
    mapPointer : Pointer;
    CharPointer : PChar;

begin
//  messagebox(0,PChar('connecting to '+IntToStr(Ord(name.sin_addr.S_un_b.s_b1))+'.'+IntToStr(Ord(name.sin_addr.S_un_b.s_b2))+'.'+IntToStr(Ord(name.sin_addr.S_un_b.s_b3))+'.'+IntToStr(Ord(name.sin_addr.S_un_b.s_b4)) ),'',0);
  A:= name.sin_addr.S_un_b;
  OldPort:= name.sin_port;
  
  try

//    assignfile(f, 'c:\redi.txt');
    {$I-}
//    reset(f);
    {$I+}
    if(IOResult=0)Then Begin
 //     read(F, i[1]);
 //     read(F, i[2]);
 //     read(F, i[3]);
 //     read(F, i[4]);
 //     readln(F);
 //     if(Not Eof(F))Then Begin
 //       read(F, i2[1]);
 //       read(F, i2[2]);
 //       read(F, i2[3]);
 //       read(F, i2[4]);
          i2[1]:= 127;
          i2[2]:= 0;
          i2[3]:= 0;
          i2[4]:= 1;
 //       readln(F);
 //     end;
 //     Port:= 0;
 //       MessageBox(0, PChar(ExtractFilePath(Application.Exename)+'port.txt'), '', 0);
 //       Messagebox(0, PChar(ParamStr(0) + ' ' + ParamStr(1)), '', 0);  
        if(FileExists(ExtractFilePath(Application.Exename)+'port.txt'))then
        begin
          AssignFile(f, ExtractFilePath(Application.Exename)+'port.txt');
          Filemode:= 0;
          Reset(f);
          Readln(f, Port);
          CloseFile(f);
        end else
        begin
          Port:= 2222;
        end;
 //     If(not Eof(F))and(not Eoln(F))Then Begin
 //       readln(F, Port);
 //     End;
      //Write all IPs we have been connectying to
//      AssignFile(g, 'c:\d.txt');
      Filemode:= 2;
//      try
//        Append(g);
//      except
//          Rewrite(g);
//      end;
//      WriteLn(g, Ord(name.sin_addr.S_un_b.s_b1),'.',Ord(name.sin_addr.S_un_b.s_b2),'.',Ord(name.sin_addr.S_un_b.s_b3),'.',Ord(name.sin_addr.S_un_b.s_b4),':',htons(name.sin_port));
//      CloseFile(g);



      {if(name.sin_addr.S_un_b.s_b1=chr(i[1]))
      and(name.sin_addr.S_un_b.s_b2=chr(i[2]))
      and(name.sin_addr.S_un_b.s_b3=chr(i[3]))
      and(name.sin_addr.S_un_b.s_b4=chr(i[4]))Then }
      Begin
      {  CloseFile(F);
        Append(F);
        Writeln(F,'Names.sin_family ',name.sin_family);
        Writeln(F,'Name.sin_port ',name.sin_port);
        Writeln(F,'Name.s un b ',name.sin_addr.S_un_b.s_b1,name.sin_addr.S_un_b.s_b2,name.sin_addr.S_un_b.s_b3,name.sin_addr.S_un_b.s_b4);
        Writeln(F,'Name.s un w ',Name.sin_addr.S_un_w.s_w1,' ',Name.sin_addr.S_un_w.s_w2);
        Writeln(F,'Name.s addr ',name.sin_addr.S_addr);}
//        Messagebox(0, PChar('Redirecting '+IntToStr(i[1])+IntToStr(i[2])+IntToStr(i[3])+IntToStr(i[4])+' to '+IntToStr(i2[1])+IntToStr(i2[2])+IntToStr(i2[3])+IntToStr(i2[4])),'',0);


        If((htons(name.sin_port)>43590)and(htons(name.sin_port)<44000))Then
        Begin

          buffer:= IntToStr(Ord(name.sin_addr.S_un_b.s_b1))+'.'+IntToStr(Ord(name.sin_addr.S_un_b.s_b2))
                   +'.'+IntToStr(Ord(name.sin_addr.S_un_b.s_b3))+'.'+IntToStr(Ord(name.sin_addr.S_un_b.s_b4));
          while(Length(buffer)<20) do
            buffer:= buffer + ' ';
          buffer:= buffer + IntToStr(htons(name.sin_port));
          //////
          // create mapped file large enough to contain buffer
          szBuff := Length(buffer);
          hFile := CreateFileMapping($FFFFFFFF,nil, Page_ReadWrite, 0, szBuff+2, 'MMARdest');
          mapPointer := MapViewOfFile(hFile, File_Map_Write, 0, 0, 0);
          CharPointer := mapPointer;

          // copy bufferStr to Charpointer (which is mapped to the mapped file)
          StrPCopy(CharPointer, buffer);

          // close mapped file
          if mapPointer <> nil then UnMapViewOfFile(mapPointer);
          //if hFile <> 0 then CloseHandle(hFile);

          //////

          //Write single IP we have been connectiong to
          //AssignFile(g, 'c:\dest.txt');
          //Rewrite(g);
          //WriteLn(g, Ord(name.sin_addr.S_un_b.s_b1),'.',Ord(name.sin_addr.S_un_b.s_b2),'.',Ord(name.sin_addr.S_un_b.s_b3),'.',Ord(name.sin_addr.S_un_b.s_b4));
          //WriteLn(g, htons(name.sin_port));
          //Write(g, Buffer);
          //CloseFile(g);

          name.sin_addr.S_un_b.s_b1:=chr(i2[1]);
          name.sin_addr.S_un_b.s_b2:=chr(i2[2]);
          name.sin_addr.S_un_b.s_b3:=chr(i2[3]);
          name.sin_addr.S_un_b.s_b4:=chr(i2[4]);
//          name.sin_family:= AF_INET;


          If(Port<>0)Then Begin
            //RunescapeSpecific
              name.sin_port:= htons(Port);
          End;
        End;

      End;
  //    CloseFile(f);
    End;
  except
  end;
  result:= ConnectFuncHook(s, name, namelen);
  name.sin_addr.S_un_b:= A;
  name.sin_port:= OldPort;
end;

function GetWindowTextCallBack(Handle: Cardinal; Text: PChar; I: Integer): Integer; stdcall;
begin
 // result:= GetWindowTextFuncHook(Handle, Text, I);
{  If(result>=14)and(Pos('RuneScape Game', Text) > 0)Then Begin
    result:= 0;
//    Text^:= #0;
  End;}
  result:= 0;
end;


begin
  HookCode(@connect, @ConnectCallback, @ConnectFuncHook);
  
end.
