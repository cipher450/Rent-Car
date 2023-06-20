unit Catalogue;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Data.Bind.Components, Data.Bind.DBScope,
  Data.Win.ADODB, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Mask,
  System.IOUtils;

type
  TForm1 = class(TForm)
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    DBText2: TDBText;
    Label2: TLabel;
    DBText3: TDBText;
    Label3: TLabel;
    DBText4: TDBText;
    Label4: TLabel;
    DBText5: TDBText;
    Label5: TLabel;
    DBText6: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    ADODataSet1: TADODataSet;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Button1: TButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    ADOQuery1model: TWideStringField;
    ComboBox1: TComboBox;
    DataSource2: TDataSource;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Label11: TLabel;
    Button2: TButton;
    Panel1: TPanel;
    DBText9: TDBText;
    Edit3: TEdit;
    Label12: TLabel;
    GroupBox3: TGroupBox;
    Image22: TImage;
    DBText1: TDBText;
    Image23: TImage;
    DBText8: TDBText;
    Edit1: TEdit;
    Label8: TLabel;
    Edit2: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure ADODataSet1AfterScroll(DataSet: TDataSet);
    procedure MaskEdit1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ADODataSet1AfterOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);

    procedure Button2Click(Sender: TObject);
    procedure ADODataSet1AfterRefresh(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit4, Unit5;

procedure TForm1.ADODataSet1AfterOpen(DataSet: TDataSet);
var
  i: Integer;

var
  j: Integer;
begin
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    DBGrid1.Columns[i].Width :=
      Canvas.TextWidth(DBGrid1.Columns[i].Field.DisplayLabel) + 10;
    // You can adjust the +10 value to provide additional padding if needed
  end;

  ComboBox1.Items.Add('');
end;

procedure TForm1.ADODataSet1AfterRefresh(DataSet: TDataSet);
begin
  ADODataSet1.Active := false;
  ADODataSet1.CommandText := 'select * from Voiture';
  ADODataSet1.Active := true;
end;

procedure TForm1.ADODataSet1AfterScroll(DataSet: TDataSet);
var
  col: Tcolor;
var
  dispo: bool;
var
  stringColor, DestPath, NotFound: String;
var
  id: Integer;
begin

  col := StringToColor(DBNavigator1.DataSource.DataSet.FieldByName('Couleur')
    .AsString);
  Panel1.Color := col;

  id := DBNavigator1.DataSource.DataSet.FieldByName('ID').AsInteger;
  DestPath := ExtractFilePath(Application.ExeName);
  NotFound := ExtractFilePath(Application.ExeName);
  NotFound := StringReplace(DestPath, 'Projet\Win32\Debug\',
    'Additionnel\Cars\404.jpeg', [rfIgnoreCase]);
  DestPath := StringReplace(DestPath, 'Projet\Win32\Debug\',
    'Additionnel\Cars\' + IntToStr(id) + '.png', [rfIgnoreCase]);
  if TFile.Exists(DestPath) then
    Image1.Picture.LoadFromFile(DestPath)
  else
    Image1.Picture.LoadFromFile(NotFound)
end;

procedure TForm1.Button1Click(Sender: TObject);

var
  UserChoice: Integer;
var
  obj: Unit5.TForm5;
begin

  begin

    UserChoice := MessageDlg('Voulez vous créé un nouveau client ?',
      mtConfirmation, [mbYes, mbNo], 0);

    if UserChoice = mrYes then
    begin

      Form4.show;
      Form4.PageControl1.ActivePageIndex := 0;
      Form4.DBNavigator1.BtnClick(nbInsert);
    end
    else if UserChoice = mrNo then
    begin
    obj:= Unit5.TForm5.Create(nil);

      obj.idvoiture := DBNavigator1.DataSource.DataSet.FieldByName('ID')
        .AsInteger;
      obj.forRent:=true;
      obj.show;
    end;
  end

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  sqlQuery: string;
begin

 if (ComboBox1.Text <> '') and (Edit3.Text <> '') then
  begin

    sqlQuery := 'SELECT * FROM Voiture WHERE Marque = ''' + ComboBox1.Text +
      '''' + ' AND Prix_jour <= ' + Edit3.Text;
    ADODataSet1.Active := false;
    ADODataSet1.CommandText := sqlQuery;
    ADODataSet1.Active := true;
  end
  else
  begin
    if not(Edit3.Text = '') then
    begin
      sqlQuery := 'SELECT * FROM Voiture WHERE Prix_jour <= '+ Edit3.Text;
      ADODataSet1.Active := false;
      ADODataSet1.CommandText := sqlQuery;
      ADODataSet1.Active := true;
    end ;
          
     
   
    if not(ComboBox1.Text = '') then
    begin
     sqlQuery := 'SELECT * FROM Voiture WHERE Marque = ''' +
        ComboBox1.Text + '''';
      ADODataSet1.Active := false;
      ADODataSet1.CommandText := sqlQuery;
      ADODataSet1.Active := true
    end;

  end;

  // ADOQuery1.SQL.Clear;
  // ADOQuery1.SQL.Text := sqlQuery;
  // ADOQuery1.Active := True;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  price, sum: Integer;
begin
  // # ##0,00" DA";-# ##0,00" DA"
  if StrToInt(Edit1.Text) > 0 then
  begin
    price := DBNavigator1.DataSource.DataSet.FieldByName('Prix_jour').AsInteger;
    sum := price * StrToInt(Edit1.Text);
    Edit2.Text := IntToStr(sum) + ' DA';
  end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8]) then
    Key := #0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DataSource1.DataSet.First;
  while not DataSource1.DataSet.Eof do
  begin
   
    ComboBox1.Items.Add(DataSource1.DataSet.FieldByName('Marque').AsString);
    DataSource1.DataSet.Next;

  end;;
  
end;

procedure TForm1.MaskEdit1Change(Sender: TObject);

begin
  // # ##0,00" DA";-# ##0,00" DA"

end;

end.
