object PagesCheckerMainFrame: TPagesCheckerMainFrame
  Left = 0
  Top = 0
  Width = 500
  Height = 36
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Default'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object gpMainFrame: TGridPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 36
    Margins.Top = 6
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        SizeStyle = ssAbsolute
        Value = 30.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 1
        Control = eSearch
        Row = 0
      end
      item
        Column = 2
        Control = eURL
        Row = 0
      end
      item
        Column = 3
        Control = eMinPrice
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 0
    object eSearch: TEdit
      AlignWithMargins = True
      Left = 36
      Top = 6
      Width = 172
      Height = 22
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      TabOrder = 0
      TextHint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      OnChange = eChange
      ExplicitWidth = 173
    end
    object eURL: TEdit
      AlignWithMargins = True
      Left = 220
      Top = 6
      Width = 172
      Height = 22
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      TabOrder = 1
      TextHint = 'URL'
      OnChange = eChange
      ExplicitLeft = 221
      ExplicitWidth = 173
    end
    object eMinPrice: TEdit
      AlignWithMargins = True
      Left = 404
      Top = 6
      Width = 88
      Height = 22
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      TabOrder = 2
      TextHint = #1052#1080#1085'. '#1094#1077#1085#1072
      OnChange = eChange
      ExplicitLeft = 406
    end
  end
  object pmFrame: TPopupMenu
    Left = 344
    object miFrameAdd: TMenuItem
      Tag = 1
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    end
    object miFrameDelete: TMenuItem
      Tag = 2
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object miFrameActive: TMenuItem
      Tag = 3
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083
      OnClick = miFrameActiveClick
    end
  end
end
