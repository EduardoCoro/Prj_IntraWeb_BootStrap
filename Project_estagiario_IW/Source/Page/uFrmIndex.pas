unit uFrmIndex;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Padrao, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML;

type
  TFrmIndex = class(TTpadrao)
    procedure IWAppFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmIndex: TFrmIndex;

implementation

{$R *.dfm}

uses Login, uUserSessionUnit, uServerController;


procedure TFrmIndex.IWAppFormCreate(Sender: TObject);
begin
  inherited;
  UserSession.DescPageHead := 'Home';
  UserSession.AcaoPageHead := 'Home';
end;

end.
