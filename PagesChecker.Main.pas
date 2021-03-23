unit PagesChecker.Main;

interface

uses
  Vcl.Controls, Vcl.Forms, System.SysUtils,
  //Свои
  PagesChecker.Main.View, PagesChecker.Main.Frame;

type
  TFrames = class
  private
    fFrame: TPagesCheckerMainFrame;
    fActive: Boolean;
    fSearch: string;
    fURL: string;
    fMinPrice: Double;
  public
    property Frame: TPagesCheckerMainFrame read fFrame write fFrame;
    property Active: Boolean read fActive write fActive;
    property Search: string read fSearch write fSearch;
    property URL: string read fURL write fURL;
    property MinPrice: Double read fMinPrice write fMinPrice;
  end;

/// <summary>Сохранить текущие данные</summary>
procedure SaveData;

/// <summary>Загрузить сохраненные данные</summary>
procedure LoadData;

/// <summary>Создать экземпляр фрейма</summary>
procedure FrameAdd(aParent: TWinControl);

var
  MainFrames: array of TFrames;

implementation

procedure SaveData;
begin
//
end;

procedure LoadData;
begin
//
end;

procedure FrameAdd(aParent: TWinControl);
const
  cFameName = 'PagesCheckerMainFrame';
var
  pFrameCnt, pFrameNum: Integer;
begin
  pFrameCnt := 1;
  for pFrameNum := 0 to TScrollBox(aParent).ControlCount - 1 do
    if TScrollBox(aParent).Controls[pFrameNum] is TPagesCheckerMainFrame then
      Inc(pFrameCnt);

  SetLength(MainFrames, Length(MainFrames) + 1);
  MainFrames[Length(MainFrames) - 1] := TFrames.Create;
  MainFrames[Length(MainFrames) - 1].fFrame := TPagesCheckerMainFrame.Create(aParent);
  MainFrames[Length(MainFrames) - 1].fFrame.Parent := aParent;
  MainFrames[Length(MainFrames) - 1].fFrame.Name := cFameName + pFrameCnt.ToString;
  MainFrames[Length(MainFrames) - 1].fFrame.Align := alTop;
  MainFrames[Length(MainFrames) - 1].fFrame.Visible := True;
  MainFrames[Length(MainFrames) - 1].fFrame.Top := 5000;
  MainFrames[Length(MainFrames) - 1].fFrame.ArrayNum := Length(MainFrames) - 1;
  MainFrames[Length(MainFrames) - 1].Active := True;
end;

end.
