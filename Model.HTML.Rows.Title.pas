unit Model.HTML.Rows.Title;

interface

uses
  Model.Interfaces;

Type
  TModelHTMLRowsTitle = class(TInterfacedObject, iModelHTMLRowsTitle)
    private
      [weak]
      FParent : IModelHTMLRows;
      FConfig : IModelRowsTitleConfig<iModelHTMLRowsTitle>;
    public
      constructor Create(Parent : IModelHTMLRows);
      destructor Destroy; override;
      class function New(Parent : IModelHTMLRows) : iModelHTMLRowsTitle;
      function HTML(Value : String) : iModelHTMLRowsTitle; overload;
      function HTML : String; overload;
      function Configuracoes : IModelRowsTitleConfig<iModelHTMLRowsTitle>;
      function &End : IModelHTMLRows;
  end;

implementation

uses
  Model.HTML.Rows.Title.Config, StrUtils;

{ TModelHTMLRowsTitle }

function TModelHTMLRowsTitle.Configuracoes: IModelRowsTitleConfig<iModelHTMLRowsTitle>;
begin
  Result := FConfig;
end;

function TModelHTMLRowsTitle.&End: IModelHTMLRows;
begin
  Result := FParent;
   FParent.HTML('<div class="row">');
   if FConfig.H1 <> '' then
    FParent.HTML('<h1>'+FConfig.H1+'</h1>');
   if FConfig.H2 <> '' then
    FParent.HTML('<h2>'+FConfig.H2+'</h2>');
   if FConfig.H3 <> '' then
    FParent.HTML('<h3>'+FConfig.H3+'</h3>');
   if FConfig.H4 <> '' then
    FParent.HTML('<h4>'+FConfig.H4+'</h4>');
   if FConfig.H5 <> '' then
    FParent.HTML('<h5>'+FConfig.H5+'</h5>');
   FParent.HTML('</div>');
end;

constructor TModelHTMLRowsTitle.Create(Parent : IModelHTMLRows);
begin
  FParent := Parent;
  FConfig := TModelHTMLRowsTitleConfig<iModelHTMLRowsTitle>.New(Self);
end;

destructor TModelHTMLRowsTitle.Destroy;
begin

  inherited;
end;

function TModelHTMLRowsTitle.HTML(Value: String): iModelHTMLRowsTitle;
begin
  Result := Self;
  FParent.HTML(Value);
end;

function TModelHTMLRowsTitle.HTML: String;
begin
  Result := FParent.HTML;
end;

class function TModelHTMLRowsTitle.New(Parent : IModelHTMLRows) : iModelHTMLRowsTitle;
begin
  Result := Self.Create(Parent);
end;

end.
