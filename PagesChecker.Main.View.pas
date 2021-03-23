unit PagesChecker.Main.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TPagesCheckerMainForm = class(TForm)
    Splitter1: TSplitter;
    pnlMain: TPanel;
    gpControls: TGridPanel;
    btnStartStop: TButton;
    edtInterval: TEdit;
    sbFrames: TScrollBox;
    reWatchLog: TRichEdit;
    pmMain: TPopupMenu;
    miFrameAdd: TMenuItem;
    tmrWatch: TTimer;
    btnSaveChanges: TButton;
    btnCancelChanges: TButton;
    procedure miFrameAddClick(Sender: TObject);
    procedure btnSaveChangesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagesCheckerMainForm: TPagesCheckerMainForm;

implementation

uses
  PagesChecker.Main;

{$R *.dfm}

procedure TPagesCheckerMainForm.btnSaveChangesClick(Sender: TObject);
begin
  SaveData;
end;

procedure TPagesCheckerMainForm.miFrameAddClick(Sender: TObject);
begin
  FrameAdd(Self.sbFrames);
end;

end.
