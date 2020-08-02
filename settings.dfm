object FormSettings: TFormSettings
  Left = 762
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBox: TPanel
    Left = 8
    Top = 8
    Width = 241
    Height = 105
    Color = clBlack
    TabOrder = 0
    object TimeBox: TCheckBox
      Left = 8
      Top = 8
      Width = 129
      Height = 17
      Caption = 'Show system time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = TimeBoxClick
    end
    object SaveBox: TCheckBox
      Left = 8
      Top = 32
      Width = 185
      Height = 17
      Caption = 'Save info on log-file'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object CreateBox: TCheckBox
      Left = 8
      Top = 56
      Width = 225
      Height = 17
      Caption = 'Create subfolder for folders'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EnableBox: TCheckBox
      Left = 8
      Top = 80
      Width = 177
      Height = 17
      Caption = 'Enable light skin app'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = EnableBoxClick
    end
  end
  object GroupSPT: TRadioGroup
    Left = 8
    Top = 120
    Width = 241
    Height = 105
    Caption = ' Set Period Time '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    Items.Strings = (
      '10 minutes'
      '30 minutes'
      '1 hour'
      'other')
    ParentFont = False
    TabOrder = 1
    OnClick = GroupSPTClick
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 232
    Width = 241
    Height = 25
    Caption = 'Change file configuration'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
end
