unit password;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, main, settings;

type
  TFormPassword = class(TForm)
    EnterBtn: TBitBtn;
    PasswordEdit: TEdit;
    ExitBtn: TBitBtn;
    procedure EnterBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure PasswordEditClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPassword: TFormPassword;
  SettingsFile : TextFile;
  GetPasswordStr : string;

implementation

{$R *.dfm}


function GetPassword : string;
var
  Str : string;
  PasswordChar : array [0..255] of char;  // massive for define text of password

  { variables - counters }
  i, j, count : integer;

begin
  { open settings file for define password }
  AssignFile(SettingsFile, 'settings.cfg');
  Reset(SettingsFile);

  { read file }
  while not EOF(SettingsFile) do
  begin
    Readln(SettingsFile, Str);
    { define values after '=' }
    i := 1;
    count := 0;
    while Str[i] <> #0 do
    begin
      if (Str[i] = #32) then inc(count);
      if (Str[i] = #32) and (count = 2) then
      begin
        j := i + 1;
        break;
      end;
      inc(i);
    end;

    for i := j to length(Str) + 1 do PasswordChar[i - j] := Str[i];
    GetPasswordStr := string(PasswordChar);
    GetPassword := GetPasswordStr;
    
    { if already find password }
    if (Str[1] = 'P') then break;
    i := 0; j := 0; count := 0; PasswordChar := #0;
  end;
  CloseFile(SettingsFile);
end;

procedure TFormPassword.EnterBtnClick(Sender: TObject);
var
  Str, Str1 : string;
begin
  Str := GetPassword;
  Str1 := PasswordEdit.Text;

  if (PasswordEdit.Text = '') or (PasswordEdit.Text = ' ') then
  begin
    PasswordEdit.Text := 'Empty input!';
    exit;
  end;

  if (Str1 = Str) then
  begin
      FormPassword.Visible := false;
      FormPassword.Destroy;
      FormMain.Visible := true;
      if (FormSettings.TimeBox.Checked = false) then FormMain.TimeLabel.Visible := false;
      exit;
  end
  else
  begin
    PasswordEdit.Text := 'Wrong password!';
    exit;
  end;

end;

procedure TFormPassword.ExitBtnClick(Sender: TObject);
begin
  Close;      
  //FormPassword.Destroy;
end;


procedure TFormPassword.PasswordEditClick(Sender: TObject);
begin
  PasswordEdit.Clear;
end;

procedure TFormPassword.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Str : string;
begin
  {if (Key = 13) then
  begin
    Str := GetPassword;
    
    if (PasswordEdit.Text = '') or (PasswordEdit.Text = ' ') then
    begin
      PasswordEdit.Text := 'Empty input!';
      exit;
    end;

    if (PasswordEdit.Text = Str) then
    begin
      FormPassword.Visible := false;
      FormPassword.Destroy;
      FormMain.Visible := true;
    end
    else
    begin
      PasswordEdit.Text := 'Wrong password!';
      exit;
    end;
    //if (FormSettings.TimeBox.Checked = false) then FormMain.TimeLabel.Visible := false;
  end;}
end;

end.
