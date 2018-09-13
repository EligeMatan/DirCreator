object Form1: TForm1
  Left = -429
  Top = 84
  Width = 381
  Height = 178
  Caption = 'Dir Creator'
  Color = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDblClick = FormDblClick
  OnShow = FormShow
  DesignSize = (
    365
    140)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 40
    Top = 64
    Width = 273
    Height = 49
    AutoSize = True
    BevelOuter = bvSpace
    Caption = 'Create Dir'#39's'
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Poor Richard'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 0
    OnClick = Panel1Click
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 16
    Width = 58
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    Caption = 'StaticText1'
    TabOrder = 1
    Transparent = False
  end
  object OpenDialog1: TOpenDialog
    InitialDir = 'C:\Users\lyashenko-iy\Desktop'
    Options = [ofReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 304
    Top = 72
  end
end
