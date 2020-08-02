unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ShellAPI, Buttons, ExtCtrls, jpeg, Grids,
  ValEdit, XPStyleActnCtrls, ActnList, ActnMan, ToolWin, ActnCtrls, Sockets,
  Tabs, ColorGrd, Outline, DirOutln, ComCtrls, ShellCtrls, Menus, settings, about;

type
  TFormMain = class(TForm)
    StartBtn: TBitBtn;
    StopBtn: TBitBtn;
    SrcBtn: TBitBtn;
    DestBtn: TBitBtn;
    Timer1: TTimer;
    InfoMemo: TMemo;
    Timer3: TTimer;
    TimeLabel: TLabel;
    AboutBtn: TBitBtn;
    HelpBtn: TBitBtn;
    SettingsBtn: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure SrcBtnClick(Sender: TObject);
    procedure DestBtnClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SettingsBtnClick(Sender: TObject);
    procedure AboutBtnClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

function NotCorrectInput(var str : string) : boolean;

var
  FormMain: TFormMain;
  DestStr : string;
  Minutes : integer;
  TimeCount : Cardinal;
  CountFolders : integer;
  NameFolders : array [0..10] of string;
  LogFile : TextFile;

implementation

{$R *.dfm}

function CopyDir(FromDir, ToDir: string): boolean;
var
  FOS : TSHFileOpStruct;
  ToDirBuf : string;
begin
  ToDirBuf := todir;
  ZeroMemory(@FOS, sizeof(FOS));
  with FOS do
  begin
    wFunc := FO_COPY;
    //fFlags := FOF_SILENT;
    fFlags := FOF_ALLOWUNDO;
    fFlags := FOF_NOCONFIRMATION;
    pFrom := PChar(FromDir + #0);
    pTo := PChar(ToDirBuf);
  end;
  Result := (0 = ShFileOperation(FOS));
end;

function NotCorrectInput(var str : string) : boolean;
var
  k, j : integer;
  i : char;
  digits : array [0..9] of char;
begin
  k := 0;
  NotCorrectInput := true;
  for i := '0' to '9' do
    begin
      digits[k] := i; inc(k);
      for j := 0 to length(str) do
        begin
          if (str[j] = i) then
            begin
              NotCorrectInput := false;
              exit;
            end;
        end;
    end;
end;

// backup timers
procedure TFormMain.Timer1Timer(Sender: TObject);
var
  i : byte;
  BufStr : string;
begin
  if (FormSettings.createBox.Checked = true) then
    for i := 0 to CountFolders - 1 do
      begin
        BufStr := DestStr;
        DestStr := DestStr + '\Folder ' + IntToStr(i);
        CreateDirectory(PChar(DestStr), nil);
        CopyDir(NameFolders[i], DestStr);
        DestStr := BufStr;
      end
  else
    for i := 0 to CountFolders - 1 do
      CopyDir(NameFolders[i], DestStr);

  InfoMemo.Lines.Add('[' + TimeToStr(Time) + ' / ' + DateToStr(Date) + '] > Backup is successfull');



  TimeCount := 0;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  { inicialized variables }
  TimeCount := 0;
  CountFolders := 0;
  Minutes := 10;
  DestStr := '';
  { --------------------- }

  Timer1.Enabled := false;
  StopBtn.Enabled := false;

  //Image1.Visible := false;

  InfoMemo.Text := 'Author: Sergey Alekhin / ver. 1.0.' + #13#10 +
                   '----------------------------------' + #13#10 +
                   '• Choose a folders by clicked on button Sources' + #13#10 +
                   '• Also choose a destination place by clicked on button Dest' + #13#10 +
                   '• After you can choose the time perion on settings or use default 10 minutes' + #13#10 +
                   '• All needed infomation showing in info area' + #13#10 +
                   'Enjoy using it!' + #13#10 +
                   '----------------------------------';
end;

// start backup
procedure TFormMain.StartBtnClick(Sender: TObject);
var
  i : integer;
  BufStr : string;
begin

  if (NameFolders[0] = '') then
    begin
      InfoMemo.Lines.Add('> ERROR: select sources');
      exit;
    end;

  if (DestStr = '') then
    begin
      InfoMemo.Lines.Add('> ERROR: select destination');
      exit;
    end;

  Timer1.Interval := 60000 * Minutes;
  Timer1.Enabled := true;

  StartBtn.Enabled := false;
  StopBtn.Enabled := true;

  SrcBtn.Enabled := false;
  DestBtn.Enabled := false;

  InfoMemo.Lines.Add('DEST: ' + DestStr);

  if (FormSettings.SaveBox.Checked = true) then
      begin
        AssignFile(LogFile, 'logs.txt');
        Append(LogFile);
        Writeln(LogFile, 'DEST: ' + DestStr);
        CloseFile(LogFile);
      end;

  InfoMemo.Lines.Add('[' + TimeToStr(Time) + ' / ' + DateToStr(Date) + '] Backup started with a period of ' +
                  IntToStr(Minutes) + ' Minutes. Processing...');

  if (FormSettings.SaveBox.Checked = true) then
      begin
        AssignFile(LogFile, 'logs.txt');
        Append(LogFile);
        Writeln(LogFile, '[' + TimeToStr(Time) + ' / ' + DateToStr(Date) + '] Backup started with a period of ' +
                  IntToStr(Minutes) + ' Minutes. Processing...');
        CloseFile(LogFile);
      end;

end;

// stop backup
procedure TFormMain.StopBtnClick(Sender: TObject);
begin
  { inicialized variables }
  CountFolders := 0;
  { --------------------- }

  Timer1.Enabled := false;

  StartBtn.Enabled := true;
  StopBtn.Enabled := false;

  SrcBtn.Enabled := true;
  DestBtn.Enabled := true;

  InfoMemo.Lines.Add('[' + TimeToStr(Time) + ' / ' + DateToStr(Date) + '] Backup is stopped');

  if (FormSettings.SaveBox.Checked = true) then
      begin
        AssignFile(LogFile, 'logs.txt');
        Append(LogFile);
        Writeln(LogFile, '[' + TimeToStr(Time) + ' / ' + DateToStr(Date) + '] Backup is stopped');
        CloseFile(LogFile);
      end;


  InfoMemo.Lines.Add('[' + TimeToStr(Time) + ' / ' + DateToStr(Date) + '] All values were reset');
  InfoMemo.Lines.Add('----------------------------');
end;

procedure TFormMain.SrcBtnClick(Sender: TObject);
begin
  if (SelectDirectory('Choose a folder for backup', ' ', NameFolders[CountFolders])) then
    begin
      InfoMemo.Lines.Add('SRC: ' + NameFolders[CountFolders]);

      if (FormSettings.SaveBox.Checked = true) then
      begin
        AssignFile(LogFile, 'logs.txt');
        Append(LogFile);
        Writeln(LogFile, 'SRC: ' + NameFolders[CountFolders]);
        CloseFile(LogFile);
      end;

      inc(CountFolders);
    end
  else exit;
end;

procedure TFormMain.DestBtnClick(Sender: TObject);
begin
  if (SelectDirectory('Choose a storage place for backup', ' ', DestStr)) then DestBtn.Enabled := false
  else exit;
end;

procedure TFormMain.Image1Click(Sender: TObject);
begin
  //Image1.Hide;
  //Panel1.Hide;
end;

procedure TFormMain.Timer3Timer(Sender: TObject);
begin
  TimeLabel.Caption := TimeToStr(Time);
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IdProcess, FormHandle : Cardinal;
  Return : longBool;
begin
  Timer1.Destroy;
  Timer3.Destroy;

  GetWindowThreadProcessId(Handle, IdProcess);
  FormHandle := OpenProcess(PROCESS_TERMINATE, Return, IdProcess);
  TerminateProcess(FormHandle, 0);
  CloseHandle(FormHandle);
end;

procedure TFormMain.SettingsBtnClick(Sender: TObject);
begin
  FormMain.Visible := false;
  FormSettings.Visible := true;
end;

procedure TFormMain.AboutBtnClick(Sender: TObject);
begin
  FormAbout.Visible := true;
  FormAbout.FormStyle := fsStayOnTop;
end;

end.
