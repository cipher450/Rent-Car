object Client: TClient
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Employe'
  ClientHeight = 401
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 278
    Top = 208
    Width = 32
    Height = 13
    Caption = 'Salaire'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 1
    Width = 825
    Height = 400
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Ajouter / Modifier'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object DBNavigator1: TDBNavigator
        Left = 3
        Top = 321
        Width = 560
        Height = 41
        DataSource = DataSource1
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 3
        Width = 560
        Height = 302
        TabOrder = 1
        object Label6: TLabel
          Left = 17
          Top = 234
          Width = 104
          Height = 16
          Caption = 'Date de naissance'
        end
        object Label4: TLabel
          Left = 16
          Top = 126
          Width = 43
          Height = 16
          Caption = 'Contact'
        end
        object Label7: TLabel
          Left = 272
          Top = 18
          Width = 95
          Height = 16
          Caption = 'Debut du contrat'
        end
        object Label1: TLabel
          Left = 16
          Top = 18
          Width = 26
          Height = 16
          Caption = 'Nom'
        end
        object Label5: TLabel
          Left = 17
          Top = 178
          Width = 46
          Height = 16
          Caption = 'Adresse'
        end
        object Label2: TLabel
          Left = 16
          Top = 74
          Width = 44
          Height = 16
          Caption = 'Prenom'
        end
        object Label3: TLabel
          Left = 272
          Top = 74
          Width = 79
          Height = 16
          Caption = 'Fin du contrat'
        end
        object Label8: TLabel
          Left = 271
          Top = 126
          Width = 40
          Height = 16
          Caption = 'Salaire'
        end
        object Label10: TLabel
          Left = 272
          Top = 180
          Width = 25
          Height = 16
          Caption = 'Role'
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 40
          Width = 209
          Height = 24
          DataField = 'Nom'
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 17
          Top = 200
          Width = 209
          Height = 24
          DataField = 'Adresse'
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 17
          Top = 148
          Width = 209
          Height = 24
          DataField = 'Contact'
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 16
          Top = 96
          Width = 209
          Height = 24
          DataField = 'Prenom'
          DataSource = DataSource1
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 271
          Top = 148
          Width = 209
          Height = 24
          DataField = 'Salaire'
          DataSource = DataSource1
          TabOrder = 4
        end
        object DBEdit7: TDBEdit
          Left = 272
          Top = 40
          Width = 209
          Height = 24
          DataField = 'D_Embauche'
          DataSource = DataSource1
          TabOrder = 5
        end
        object DBEdit8: TDBEdit
          Left = 272
          Top = 96
          Width = 209
          Height = 24
          DataField = 'D_Embauche_Fin'
          DataSource = DataSource1
          TabOrder = 6
        end
        object DBEdit9: TDBEdit
          Left = 17
          Top = 256
          Width = 209
          Height = 24
          DataField = 'D_D_N'
          DataSource = DataSource1
          TabOrder = 7
        end
        object DBEdit6: TDBEdit
          Left = 272
          Top = 202
          Width = 209
          Height = 24
          DataField = 'Role'
          DataSource = DataSource1
          TabOrder = 8
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'List'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = -4
        Top = 0
        Width = 574
        Height = 375
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from Employe'
    Parameters = <>
    Left = 440
    Top = 65528
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    MasterSource = DataSource1
    TableName = 'Contrat'
    Left = 624
    Top = 8
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\Lenov0\Desktop\RentCar\Base\database.mdb;Mode=Share Deny Non' +
      'e;Persist Security Info=False;Jet OLEDB:System database="";Jet O' +
      'LEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:E' +
      'ngine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global ' +
      'Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLED' +
      'B:New Database Password="";Jet OLEDB:Create System Database=Fals' +
      'e;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale o' +
      'n Compact=False;Jet OLEDB:Compact Without Replica Repair=False;J' +
      'et OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 576
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 392
    Top = 65528
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\Lenov0\Desktop\RentCar\Base\database.mdb;Mode=Share Deny Non' +
      'e;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OL' +
      'EDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Datab' +
      'ase Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB' +
      ':Global Bulk Transactions=1;Jet OLEDB:New Database Password="";J' +
      'et OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database' +
      '=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Co' +
      'mpact Without Replica Repair=False;Jet OLEDB:SFP=False;'
    Parameters = <>
    Left = 496
    Top = 65528
  end
end
