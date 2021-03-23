object PagesCheckerMainForm: TPagesCheckerMainForm
  Left = 0
  Top = 0
  ClientHeight = 468
  ClientWidth = 1006
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Splitter1: TSplitter
    Left = 500
    Top = 0
    Width = 5
    Height = 468
    Beveled = True
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 468
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 461
    object gpControls: TGridPanel
      Left = 0
      Top = 438
      Width = 500
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 100.000000000000000000
        end
        item
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 3
          Control = btnStartStop
          Row = 0
        end
        item
          Column = 4
          Control = edtInterval
          Row = 0
        end
        item
          Column = 0
          Control = btnSaveChanges
          Row = 0
        end
        item
          Column = 1
          Control = btnCancelChanges
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      ExplicitTop = 431
      object btnStartStop: TButton
        AlignWithMargins = True
        Left = 303
        Top = 3
        Width = 94
        Height = 24
        Align = alClient
        Caption = #1057#1090#1072#1088#1090'/'#1057#1090#1086#1087
        TabOrder = 0
        OnClick = btnStartStopClick
      end
      object edtInterval: TEdit
        AlignWithMargins = True
        Left = 403
        Top = 3
        Width = 94
        Height = 24
        Align = alClient
        TabOrder = 1
        TextHint = #1048#1085#1090#1077#1088#1074#1072#1083', '#1084#1080#1085
        ExplicitHeight = 22
      end
      object btnSaveChanges: TButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 94
        Height = 24
        Align = alClient
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 2
        OnClick = btnSaveChangesClick
        ExplicitTop = 6
      end
      object btnCancelChanges: TButton
        AlignWithMargins = True
        Left = 103
        Top = 3
        Width = 94
        Height = 24
        Align = alClient
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 3
        OnClick = btnCancelChangesClick
        ExplicitLeft = 12
        ExplicitTop = 6
        ExplicitWidth = 75
        ExplicitHeight = 25
      end
    end
    object sbFrames: TScrollBox
      Left = 0
      Top = 0
      Width = 500
      Height = 438
      HorzScrollBar.Visible = False
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      PopupMenu = pmMain
      TabOrder = 1
      ExplicitHeight = 431
    end
  end
  object reWatchLog: TRichEdit
    Left = 505
    Top = 0
    Width = 501
    Height = 468
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    Zoom = 100
    ExplicitLeft = 501
    ExplicitWidth = 505
    ExplicitHeight = 461
  end
  object pmMain: TPopupMenu
    Left = 96
    Top = 296
    object miFrameAdd: TMenuItem
      Tag = 1
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = miFrameAddClick
    end
  end
  object tmrWatch: TTimer
    Left = 192
    Top = 296
  end
end
