unit changeCFG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormChangeCFG = class(TForm)
    ChangeCFGMemo: TMemo;
    SaveButton: TBitBtn;
    procedure SaveButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormChangeCFG: TFormChangeCFG;

implementation

{$R *.dfm}

procedure TFormChangeCFG.SaveButtonClick(Sender: TObject);
begin
  ChangeCFGMemo.Lines.SaveToFile('settings.cfg');
  ChangeCFGMemo.Text := 'File settings.cfg successfull saved';
  SaveButton.Enabled := false;
end;

procedure TFormChangeCFG.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveButton.Enabled := true;
end;

end.
