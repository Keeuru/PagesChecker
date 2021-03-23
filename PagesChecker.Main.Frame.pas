unit PagesChecker.Main.Frame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, System.StrUtils;

type
  TPagesCheckerMainFrame = class(TFrame)
    gpMainFrame: TGridPanel;
    eSearch: TEdit;
    eURL: TEdit;
    eMinPrice: TEdit;
    pmFrame: TPopupMenu;
    miFrameAdd: TMenuItem;
    miFrameDelete: TMenuItem;
    miFrameActive: TMenuItem;
    procedure miFrameActiveClick(Sender: TObject);
    procedure eChange(Sender: TObject);
  private
    fArrayNum: Integer;
    { Private declarations }
  public
    property ArrayNum: Integer read fArrayNum write fArrayNum;
    { Public declarations }
  end;

implementation

uses
  PagesChecker.Main;

{$R *.dfm}

procedure TPagesCheckerMainFrame.eChange(Sender: TObject);
begin
  case IndexStr(TControl(Sender).Name, ['eSearch', 'eURL', 'eMinPrice']) of
    0:
      MainFrames[ArrayNum].Search := eSearch.Text;
    1:
      MainFrames[ArrayNum].URL := eURL.Text;
    2:
      MainFrames[ArrayNum].MinPrice := StrToFloatDef(StringReplace(eMinPrice.Text, '.', ',', []), 0.0);
  end;
end;

procedure TPagesCheckerMainFrame.miFrameActiveClick(Sender: TObject);
var
  i: integer;
begin
  MainFrames[ArrayNum].Active := not MainFrames[ArrayNum].Active;
  for i := 0 to gpMainFrame.ControlCount - 1 do
    gpMainFrame.Controls[i].Enabled := MainFrames[ArrayNum].Active;
end;

end.
