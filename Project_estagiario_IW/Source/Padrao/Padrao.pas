unit Padrao;

interface

uses
  Template.StarAdmin, MenuApp,  Projt_estudos.App,
  SweetAlert2,

  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML;

type
  TTpadrao = class(TIWAppForm)
    TPS: TIWTemplateProcessorHTML;
    procedure TPSUnknownTag(const AName: string; var VValue: string);
    procedure IWAppFormCreate(Sender: TObject);
  public
    //DescPageHead :string;
    //AcaoPageHead :string;
    procedure Acoes(EventParams: TStringList);

  end;

var
  Tpadrao: TTpadrao;

implementation

{$R *.dfm}

uses uServerController ,uUserSessionUnit, Login, uFrmIndex;


procedure TTpadrao.IWAppFormCreate(Sender: TObject);
begin
  if Self.Name = 'TLogin' then
  begin
    TPS.MasterTemplate := '';
    TPS.Templates.Default := 'app/'+Self.Name+'.html';
  end
  else
  begin
    TPS.MasterTemplate := 'app/master.html';
    TPS.Templates.Default := 'app/'+Self.Name+'.html';
  end;

  RegisterCallBack('Acoes', Acoes);

end;

procedure TTpadrao.TPSUnknownTag(const AName: string; var VValue: string);
begin
  if AName = 'softHouse' then
    VValue := SoftHouse;

  if AName = 'Version' then
    VValue := Version;

  if AName = 'User_Top' then
    VValue :=  UserSession.UserLogado;

  if AName = 'head' then
    if Self.Name = 'TLogin' then
      VValue := Get_Head_Login + Get_Lib_CSS_SweetAlert2
    else
      VValue := Get_Head;

  if AName = 'footer' then
    if Self.Name = 'TLogin' then
      VValue := Get_Footer_Login + Get_Lib_JS_SweetAlert2
    else
    begin
      if Self.Name = 'FrmCrudPessoa' then
        VValue := Get_Footer + script_Acoes + JqueryMaskPlugin + Get_Lib_JS_SweetAlert2 + Get_Lib_CSS_SweetAlert2
      else
        VValue := Get_Footer + script_Acoes + Get_Lib_JS_SweetAlert2 + Get_Lib_CSS_SweetAlert2;
      //CHAMADA DE SCRIPT E CSS
      if Self.Name = 'FrmCrudFornecedor' then
        VValue := Get_Footer + script_Acoes + JqueryMaskPlugin + Get_Lib_JS_SweetAlert2 + Get_Lib_CSS_SweetAlert2
      else
        VValue := Get_Footer + script_Acoes + Get_Lib_JS_SweetAlert2 + Get_Lib_CSS_SweetAlert2;

    end;

  if AName = 'PageHead' then
    VValue := Get_Page_Head(UserSession.DescPageHead, UserSession.AcaoPageHead);

  if AName = 'Title'  then
    VValue := Self.Title;

  if AName = 'Menu' then
    VValue := get_menu_by_user(UserSession.UserId);

end;

procedure TTpadrao.Acoes(EventParams: TStringList);
var
  sl: TStringList;
  I,IdAcao, CountParam: Integer;
  Acao, s: String;
begin
   sl := TStringList.Create;
   CountParam := 0;

  try

    sl.StrictDelimiter := True;
    sl.CommaText := EventParams.Values['Params'];
    s := sl.CommaText;

    CountParam := TStringList(sl).Count;

    for I := 0 to pred(CountParam) do
    begin
      if I = 0 then
        Acao := sl.ValueFromIndex[I];

      if I = 1 then
        IdAcao := StrToInt(sl.ValueFromIndex[I]);
    end;

    if Acao = 'Fechar' then
    begin
      TIWAppForm(WebApplication.ActiveForm).Release;
      //Self.Release;
      TLogin := TTLogin.Create(WebApplication);
      TLogin.Show;
    end;

          {
    if Acao = 'Home' then
    begin
      Self.Release;
      FrmIndex := TFrmIndex.Create(WebApplication);
      FrmIndex.Show;
    end; }


    if Acao = 'Home' then
    begin
      if not (self.Name = 'FrmIndex') then
      begin
        TIWAppForm(WebApplication.ActiveForm).Release;
        TFrmIndex.Create(WebApplication).Show;
      end;

    end;

    

  except

  end;
end;


end.
