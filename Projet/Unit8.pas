unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw;

type
  TForm8 = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
   var filePath:string;
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.FormShow(Sender: TObject);
begin
  filePath := 'file:///' + StringReplace(filePath, '\', '/', [rfReplaceAll]);
     WebBrowser1.Navigate(filePath);

end;

end.
