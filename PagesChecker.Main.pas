unit PagesChecker.Main;

interface

uses
  Vcl.Controls, Vcl.Forms, System.SysUtils, System.JSON, System.Classes,
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

/// <summary>Очистить массив фреймов</summary>
procedure FramesClear;

/// <summary>Создать экземпляр фрейма</summary>
/// <param name="aParent">Компонент, на котором должен лежать фрейм</param>
procedure FrameAdd(aParent: TWinControl);

var
  MainFrames: array of TFrames;
  Interval: Integer;

const
  cSaveFileName = 'save.txt';
  cFrameBaseName = 'PagesCheckerMainFrame';
  cJSON_frames = 'frames';
  cJSON_interval = 'interval';
  cJSON_name = 'name';
  cJSON_active = 'active';
  cJSON_search = 'search';
  cJSON_url = 'url';
  cJSON_price = 'min_price';

implementation

uses
  XSuperObject,
  XSuperJson;

procedure SaveData;
var
  pSObject: ISuperObject;
  pNum: Integer;
begin
  pSObject := SO;
  try
    for pNum := 0 to Length(MainFrames) - 1 do
    begin
      pSObject.A[cJSON_frames].O[pNum].V[cJSON_name] := MainFrames[pNum].fFrame.Name;
      pSObject.A[cJSON_frames].O[pNum].V[cJSON_active] := MainFrames[pNum].fActive;
      pSObject.A[cJSON_frames].O[pNum].V[cJSON_search] := MainFrames[pNum].fSearch;
      pSObject.A[cJSON_frames].O[pNum].V[cJSON_url] := MainFrames[pNum].fURL;
      pSObject.A[cJSON_frames].O[pNum].V[cJSON_price] := MainFrames[pNum].fMinPrice;
    end;
    pSObject.V[cJSON_interval] := Interval;
    pSObject.SaveTo(cSaveFileName);
  finally
    pSObject := nil;
  end;
end;

procedure LoadData;
var
  pSObject: ISuperObject;
  pNum: Integer;
begin
  FramesClear;
  //читаем JSON из файла
  with TStringList.Create do
  try
    LoadFromFile(cSaveFileName);
    pSObject := SO(Text);
  finally
    Free;
  end;
  //создаем фреймы
  try
    for pNum := 0 to pSObject.A[cJSON_frames].Length - 1 do
    begin
      FrameAdd(PagesCheckerMainForm.sbFrames);
      MainFrames[Length(MainFrames) - 1].fFrame.Name := pSObject.A[cJSON_frames].O[pNum].S[cJSON_name];
      MainFrames[Length(MainFrames) - 1].fActive := pSObject.A[cJSON_frames].O[pNum].B[cJSON_active];
      MainFrames[Length(MainFrames) - 1].fSearch := pSObject.A[cJSON_frames].O[pNum].S[cJSON_search];
      MainFrames[Length(MainFrames) - 1].fURL := pSObject.A[cJSON_frames].O[pNum].S[cJSON_url];
      MainFrames[Length(MainFrames) - 1].fMinPrice := pSObject.A[cJSON_frames].O[pNum].F[cJSON_price];
      //отображение значений на форме
      MainFrames[Length(MainFrames) - 1].fFrame.eSearch.Text := MainFrames[Length(MainFrames) - 1].fSearch;
      MainFrames[Length(MainFrames) - 1].fFrame.eURL.Text := MainFrames[Length(MainFrames) - 1].fURL;
      MainFrames[Length(MainFrames) - 1].fFrame.eMinPrice.Text := MainFrames[Length(MainFrames) - 1].fMinPrice.ToString;
    end;
    Interval := pSObject.I[cJSON_interval];
    PagesCheckerMainForm.edtInterval.Text := Interval.ToString;
  finally
    pSObject := nil;
  end;
end;

procedure FramesClear;
var
  pFrameNum: Integer;
begin
  for pFrameNum := 0 to Length(MainFrames) - 1 do
    if Assigned(MainFrames[pFrameNum]) then
    begin
      FreeAndNil(MainFrames[pFrameNum].Frame);
      FreeAndNil(MainFrames[pFrameNum]);
    end;
  SetLength(MainFrames, 0);
end;

procedure FrameAdd(aParent: TWinControl);
var
  pFrameCnt, pFrameNum: Integer;
begin
  pFrameCnt := 1;
  for pFrameNum := 0 to TScrollBox(aParent).ControlCount - 1 do
    if Assigned(PagesCheckerMainForm.sbFrames.FindComponent(cFrameBaseName + pFrameCnt.ToString)) then
      Inc(pFrameCnt)
    else
      Break;

  SetLength(MainFrames, Length(MainFrames) + 1);
  MainFrames[Length(MainFrames) - 1] := TFrames.Create;
  MainFrames[Length(MainFrames) - 1].fFrame := TPagesCheckerMainFrame.Create(aParent);
  MainFrames[Length(MainFrames) - 1].fFrame.Parent := aParent;
  MainFrames[Length(MainFrames) - 1].fFrame.Name := cFrameBaseName + pFrameCnt.ToString;
  MainFrames[Length(MainFrames) - 1].fFrame.Align := alTop;
  MainFrames[Length(MainFrames) - 1].fFrame.Visible := True;
  MainFrames[Length(MainFrames) - 1].fFrame.Top := 5000;
  MainFrames[Length(MainFrames) - 1].fFrame.ArrayNum := Length(MainFrames) - 1;
  MainFrames[Length(MainFrames) - 1].Active := True;
end;

end.
