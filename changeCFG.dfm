object FormChangeCFG: TFormChangeCFG
  Left = 1269
  Top = 122
  Width = 272
  Height = 304
  Caption = 'BACKUP v. 1.0'
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ChangeCFGMemo: TMemo
    Left = 8
    Top = 8
    Width = 241
    Height = 217
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'ChangeCFGMemo')
    ParentFont = False
    TabOrder = 0
  end
  object SaveButton: TBitBtn
    Left = 8
    Top = 232
    Width = 241
    Height = 25
    Caption = 'Save Changes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = SaveButtonClick
  end
end
