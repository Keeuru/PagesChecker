unit PagesChecker.Main.Frame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
