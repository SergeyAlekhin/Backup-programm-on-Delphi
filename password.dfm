object FormPassword: TFormPassword
  Left = 1036
  Top = 120
  Width = 233
  Height = 113
  Caption = 'BACKUP v. 1.0'
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object EnterBtn: TBitBtn
    Left = 8
    Top = 40
    Width = 97
    Height = 25
    Caption = 'Log in'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = EnterBtnClick
  end
  object PasswordEdit: TEdit
    Left = 8
    Top = 8
    Width = 201
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = PasswordEditClick
  end
  object ExitBtn: TBitBtn
    Left = 112
    Top = 40
    Width = 97
    Height = 25
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ExitBtnClick
  end
end
