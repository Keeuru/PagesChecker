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

implementation

procedure SaveData;
var
  pJSONObject, pInnerObject: TJSONObject;
  pJSONArray: TJSONArray;
  i: Integer;
begin
  pJSONObject := TJSONObject.Create;

  for i := 0 to Length(MainFrames) - 1 do
  begin
    pJSONArray := TJSONArray.Create();
    pInnerObject := TJSONObject.Create;
    pInnerObject.AddPair(TJSONPair.Create('name', MainFrames[i].fFrame.Name));
    pInnerObject.AddPair(TJSONPair.Create('active', MainFrames[i].fActive.ToString()));
    pInnerObject.AddPair(TJSONPair.Create('search', MainFrames[i].fSearch));
    pInnerObject.AddPair(TJSONPair.Create('url', MainFrames[i].fURL));
    pInnerObject.AddPair(TJSONPair.Create('min_price', MainFrames[i].fMinPrice.ToString));
    pJSONArray.AddElement(pInnerObject);
  end;
  pJSONObject.AddPair('frames', pJSONArray);
  pJSONObject.AddPair('interval', Interval.ToString);

  with TStringList.Create do
  try
    Text := pJSONObject.ToString;
    SaveToFile('save.txt');
  finally
    Free;
  end;
end;

procedure LoadData;
var
  pJSONObject: TJSONObject;
  pJSONArray: TJSONArray;
  i: Integer;
begin
  FramesClear;

  with TStringList.Create do
  try
    LoadFromFile('save.txt');
    pJSONObject := TJSONObject.Create;
    pJSONObject := TJSONObject(TJSONObject.ParseJSONValue(Text));
  finally
    Free;
  end;
  if not Assigned(pJSONObject) then
    Exit;

  pJSONArray := TJSONArray(pJSONObject.Get('frames').JsonValue);
  try
    for i := 0 to pJSONArray.Size - 1 do
    begin
      FrameAdd(PagesCheckerMainForm.sbFrames);
      MainFrames[Length(MainFrames) - 1].fFrame.Name := TJSONObject(pJSONArray.Get(i)).Get('name').JsonValue.Value;
      MainFrames[Length(MainFrames) - 1].fActive := Boolean(StrToIntDef(TJSONObject(pJSONArray.Get(i)).Get('active').JsonValue.Value, 0));
      MainFrames[Length(MainFrames) - 1].fSearch := TJSONObject(pJSONArray.Get(i)).Get('search').JsonValue.Value;
      MainFrames[Length(MainFrames) - 1].fURL := TJSONObject(pJSONArray.Get(i)).Get('url').JsonValue.Value;
      MainFrames[Length(MainFrames) - 1].fMinPrice := StrToFloatDef(TJSONObject(pJSONArray.Get(i)).Get('min_price').JsonValue.Value, 0.0);

      MainFrames[Length(MainFrames) - 1].fFrame.eSearch.Text := TJSONObject(pJSONArray.Get(i)).Get('search').JsonValue.Value;
      MainFrames[Length(MainFrames) - 1].fFrame.eURL.Text := TJSONObject(pJSONArray.Get(i)).Get('url').JsonValue.Value;
      MainFrames[Length(MainFrames) - 1].fFrame.eMinPrice.Text := TJSONObject(pJSONArray.Get(i)).Get('min_price').JsonValue.Value;
    end;
  finally
    FreeAndNil(pJSONArray);
  end;

  Interval := pJSONObject.Values['interval'].AsType<Integer>;
  PagesCheckerMainForm.edtInterval.Text := Interval.ToString;
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
