unit settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFormSettings = class(TForm)
    PanelBox: TPanel;
    TimeBox: TCheckBox;
    SaveBox: TCheckBox;
    CreateBox: TCheckBox;
    EnableBox: TCheckBox;
    GroupSPT: TRadioGroup;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimeBoxClick(Sender: TObject);
    procedure EnableBoxClick(Sender: TObject);
    procedure GroupSPTClick(Sender: TObject);
    procedure SetPasswordBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSettings: TFormSettings;

implementation
uses main, password, changeCFG;

{$R *.dfm}

procedure TFormSettings.FormCreate(Sender: TObject);
begin
  FormMain.Left := FormMain.Left;
  FormSettings.Top := FormMain.Top;
end;

procedure TFormSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormMain.Visible := true; FormSettings.Visible := false;
end;

procedure TFormSettings.TimeBoxClick(Sender: TObject);
begin
  if (timeBox.Checked = true) then
    begin
      FormMain.Timer3.Enabled := true;
      FormMain.TimeLabel.Visible := true;
    end
  else
    begin
      FormMain.Timer3.Enabled := false;
      FormMain.TimeLabel.Visible := false;
    end;
end;

procedure TFormSettings.EnableBoxClick(Sender: TObject);
begin
  { set Light-skin version }
  if (enableBox.Checked = true) then
    begin
      with FormMain do
        begin
          Color := clWhite;
          InfoMemo.Color := clWhite;
          InfoMemo.Font.Color := clBlack;
          TimeLabel.Color := clWhite;
          TimeLabel.Font.Color := clBlack;
        end;

      with FormSettings do
        begin
          Color := clWhite;
          PanelBox.Color := clWhite;
          timeBox.Font.Color := clBlack;
          saveBox.Font.Color := clBlack;
          enableBox.Font.Color := clBlack;
          createBox.Font.Color := clBlack;

          GroupSPT.Font.Color := clBlack;
        end;

      with FormChangeCFG do
        begin
          Color := clWhite;
          ChangeCFGMemo.Color := clWhite;
          ChangeCFGMemo.Font.Color := clBlack;
        end;
        
    end
  { set Dark-skin version }
  else
    begin
      with FormMain do
        begin
          Color := clBlack;
          InfoMemo.Color := clBlack;
          InfoMemo.Font.Color := clLime;
          TimeLabel.Color := clBlack;
          TimeLabel.Font.Color := clYellow;
        end;

      with FormSettings do
        begin
          Color := clBlack;
          PanelBox.Color := clBlack;
          TimeBox.Font.Color := clLime;
          SaveBox.Font.Color := clLime;
          EnableBox.Font.Color := clLime;
          CreateBox.Font.Color := clLime;

          GroupSPT.Font.Color := clLime;
        end;

      with FormChangeCFG do
        begin
          Color := clBlack;
          ChangeCFGMemo.Color := clBlack;
          ChangeCFGMemo.Font.Color := clLime;
        end;

    end;
end;


procedure TFormSettings.GroupSPTClick(Sender: TObject);
var
  value : string;
begin
  case GroupSPT.ItemIndex of
    0: minutes := 10;
    1: minutes := 30;
    2: minutes := 60;
    3:
      begin
        if (InputQuery('BACKUP v 1.0', 'Input the time count', value)) then
        begin
          if (NotCorrectInput(value)) then
          begin
            ShowMessage('Incorrect Input!');
            exit;
          end;
          minutes := StrToInt(value);
        end
        else exit;
        GroupSPT.Items[3] := 'other [' + value + '] minutes';
      end;
  end;
end;

procedure TFormSettings.SetPasswordBtnClick(Sender: TObject);
begin
  //AssignFile(SettingsFile, 'settings.cfg');
  //Rewrite(SettingsFile);
  //CloseFile(SettingsFile);

end;

procedure TFormSettings.BitBtn1Click(Sender: TObject);
begin
  FormChangeCFG.Visible := true;
  FormChangeCFG.ChangeCFGMemo.Lines.LoadFromFile('settings.cfg');
end;


end.
