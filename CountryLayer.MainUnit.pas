unit CountryLayer.MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Data.Bind.DBScope, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  System.JSON;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    Label1: TLabel;
    Edit1: TEdit;
    BtnSearch: TButton;
    Memo1: TMemo;
    Label2: TLabel;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    FDMemTable2: TFDMemTable;
    Button1: TButton;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure BtnSearchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.BtnSearchClick(Sender: TObject);
begin
  RESTClient2.ResetToDefaults;
  RESTClient2.Accept := 'application/json';
  RESTClient2.AcceptCharset := 'UTF-8, *;q=0.8';
  RESTClient2.BaseURL := Format('http://api.countrylayer.com/v2/name/%s?access_key=%s&fullText=%s', [Edit1.Text, 'a27f44dd66e6153fa97baf552a367554', 'True']);

  RESTRequest2.Execute;

  var JSONValue := TJSONObject.ParseJSONValue(RESTResponse2.Content);
  var JSONArray := JSONValue.GetValue<TJSONArray>('');

  for var ArrayElement in JSONArray do
  begin
    Memo1.Lines.Append('Name: ' + ArrayElement.GetValue<String>('name'));
    Memo1.Lines.Append('Alpha2Code: ' + ArrayElement.GetValue<String>('alpha2Code'));
    Memo1.Lines.Append('Capital: ' + ArrayElement.GetValue<String>('capital'));
    Memo1.Lines.Append('Region: ' + ArrayElement.GetValue<String>('region'));
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTRequest1.Execute;
end;

end.
