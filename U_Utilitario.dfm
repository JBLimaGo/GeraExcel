object F_Excel: TF_Excel
  Left = 326
  Top = 170
  Caption = 'Excel'
  ClientHeight = 264
  ClientWidth = 1098
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object btnVendedor: TPanel
    Left = 0
    Top = -5
    Width = 1097
    Height = 94
    TabOrder = 0
    object Label10: TLabel
      Left = 91
      Top = 13
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Loja:'
    end
    object Label11: TLabel
      Left = 79
      Top = 39
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Periodo'
    end
    object RxLabel3: TLabel
      Left = 221
      Top = 41
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txt_Loja: TEdit
      Left = 117
      Top = 9
      Width = 51
      Height = 19
      Hint = 'Informe a Loja.'
      CharCase = ecUpperCase
      Color = clWhite
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = txt_LojaExit
    end
    object txt_NOME_LOJA: TEdit
      Left = 169
      Top = 9
      Width = 317
      Height = 19
      TabStop = False
      CharCase = ecUpperCase
      Color = 14811135
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Data_InI: TDateEdit
      Left = 118
      Top = 37
      Width = 102
      Height = 19
      Hint = 'Informe a Data Inicial.'
      CheckOnExit = True
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      YearDigits = dyFour
      TabOrder = 2
    end
    object Data_Fim: TDateEdit
      Left = 232
      Top = 37
      Width = 102
      Height = 19
      Hint = 'Informe a Data Final.'
      CheckOnExit = True
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      YearDigits = dyFour
      TabOrder = 3
    end
  end
  object Button1: TButton
    Left = 0
    Top = 146
    Width = 137
    Height = 109
    Align = alCustom
    Caption = 'Cliente'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 146
    Width = 137
    Height = 109
    Align = alCustom
    Caption = 'Cliente Venda Mensal'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 272
    Top = 146
    Width = 137
    Height = 109
    Align = alCustom
    Caption = 'Estoque'
    Enabled = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 408
    Top = 146
    Width = 137
    Height = 109
    Align = alCustom
    Caption = 'Produto'
    Enabled = False
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 544
    Top = 146
    Width = 137
    Height = 109
    Align = alCustom
    Caption = 'Fornecedor'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 680
    Top = 146
    Width = 137
    Height = 109
    Align = alCustom
    Caption = 'Produto Venda Mensal'
    Enabled = False
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 816
    Top = 146
    Width = 137
    Height = 109
    Align = alCustom
    Caption = 'Transportadora'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 952
    Top = 146
    Width = 137
    Height = 109
    Align = alCustom
    Caption = 'Vendedor'
    TabOrder = 8
    OnClick = Button8Click
  end
  object Data_servidor: TpFIBDataSet
    SelectSQL.Strings = (
      'select current_date from rdb$database')
    Transaction = Tr_Db
    Database = Db
    Left = 96
    Top = 216
    object Data_servidorCURRENT_DATE: TFIBDateField
      FieldName = 'CURRENT_DATE'
    end
  end
  object CALCULA_PRECO: TpFIBStoredProc
    Transaction = Tr_Db
    Database = Db
    SQL.Strings = (
      
        'EXECUTE PROCEDURE CALCULO_PRECO (?EMPRESA, ?PRODUTO, ?LOJA, ?CLI' +
        'ENTE,?CALCULA_IPI,?CALCULA_IMPOSTO)')
    StoredProcName = 'CALCULO_PRECO'
    Left = 416
    Top = 152
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object DS_EstoqueProduto: TDataSource
    DataSet = EstoqueProduto
    Left = 497
    Top = 113
  end
  object EstoqueExp: TpFIBDataSet
    SelectSQL.Strings = (
      'select estoque.produto,'
      '       produto.codigo_catalago as PartNumber,'
      '       fornecedor.cgc_cpf as cnpjFornercedor,'
      '       estoque.saldo as quantidade,'
      '       produto_informacoes.endereco as local,'
      '       '#39#39' as locacao,'
      '       produto.codigo_original,'
      '       produto.codigo_anterior'
      '   from estoque'
      
        '   inner join produto_informacoes on (estoque.produto = produto_' +
        'informacoes.cod_produto)'
      
        '                                  and (estoque.loja = produto_in' +
        'formacoes.loja)'
      '   inner join produto on (estoque.produto = produto.codigo)'
      
        '   inner join fornecedor on (produto.fornecedor = fornecedor.cod' +
        'igo)'
      ''
      '   where estoque.loja = :loja')
    Transaction = Tr_Db
    Database = Db
    Left = 528
    Top = 75
    object EstoqueExpPRODUTO: TFIBIntegerField
      FieldName = 'PRODUTO'
    end
    object EstoqueExpPARTNUMBER: TFIBStringField
      FieldName = 'PARTNUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object EstoqueExpCNPJFORNERCEDOR: TFIBStringField
      FieldName = 'CNPJFORNERCEDOR'
      Size = 18
      EmptyStrToNull = True
    end
    object EstoqueExpQUANTIDADE: TFIBBCDField
      FieldName = 'QUANTIDADE'
      Size = 3
    end
    object EstoqueExpLOCAL: TFIBStringField
      FieldName = 'LOCAL'
      Size = 50
      EmptyStrToNull = True
    end
    object EstoqueExpLOCACAO: TFIBStringField
      FieldName = 'LOCACAO'
      Size = 0
      EmptyStrToNull = True
    end
    object EstoqueExpCODIGO_ORIGINAL: TFIBStringField
      FieldName = 'CODIGO_ORIGINAL'
      Size = 15
      EmptyStrToNull = True
    end
    object EstoqueExpCODIGO_ANTERIOR: TFIBStringField
      FieldName = 'CODIGO_ANTERIOR'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object Fornecedor: TpFIBDataSet
    SelectSQL.Strings = (
      'select fornecedor.codigo as codigo,'
      '       fornecedor.nome_fantasia as fantasia,'
      '       fornecedor.razao_social as razao,'
      '       fornecedor.tp_pessoa as Pessoa,'
      '       fornecedor.cgc_cpf as CNPJ,'
      '       fornecedor.insc_estadual as Inscricao,'
      '       fornecedor.endereco as Endereco,'
      '       fornecedor.numero as Numero,'
      '       fornecedor.complemento as Complemento,'
      '       endereco.cidade as Municipio,'
      '       fornecedor.bairro as Bairro,'
      '       uf.estado as Estado,'
      '       fornecedor.cep as Cep,'
      '       fornecedor.Fone as Telefone,'
      '       fornecedor.fax as Telefone2,'
      '       fornecedor.e_mail as Email,'
      '       '#39#39' as Contato,'
      '       '#39#39' as InicioAtividade,'
      '       fornecedor.dt_ult_compra as UltimaCompra,'
      '       fornecedor.vl_ult_compra as ValorUltimacompra'
      ' from fornecedor'
      '  INNER JOIN endereco on (fornecedor.cep = endereco.cep)'
      '  INNER JOIN UF ON (endereco.uf_ibge  = UF.ibge)'
      '')
    Transaction = Tr_Db
    Database = Db
    Left = 544
    Top = 16
    object FornecedorCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object FornecedorFANTASIA: TFIBStringField
      FieldName = 'FANTASIA'
      Size = 70
      EmptyStrToNull = True
    end
    object FornecedorRAZAO: TFIBStringField
      FieldName = 'RAZAO'
      Size = 70
      EmptyStrToNull = True
    end
    object FornecedorPESSOA: TFIBStringField
      FieldName = 'PESSOA'
      Size = 1
      EmptyStrToNull = True
    end
    object FornecedorCNPJ: TFIBStringField
      FieldName = 'CNPJ'
      Size = 18
      EmptyStrToNull = True
    end
    object FornecedorINSCRICAO: TFIBStringField
      FieldName = 'INSCRICAO'
      Size = 30
      EmptyStrToNull = True
    end
    object FornecedorENDERECO: TFIBStringField
      FieldName = 'ENDERECO'
      Size = 70
      EmptyStrToNull = True
    end
    object FornecedorNUMERO: TFIBStringField
      FieldName = 'NUMERO'
      Size = 10
      EmptyStrToNull = True
    end
    object FornecedorCOMPLEMENTO: TFIBStringField
      FieldName = 'COMPLEMENTO'
      Size = 50
      EmptyStrToNull = True
    end
    object FornecedorMUNICIPIO: TFIBStringField
      FieldName = 'MUNICIPIO'
      Size = 100
      EmptyStrToNull = True
    end
    object FornecedorBAIRRO: TFIBStringField
      FieldName = 'BAIRRO'
      Size = 35
      EmptyStrToNull = True
    end
    object FornecedorESTADO: TFIBStringField
      FieldName = 'ESTADO'
      Size = 100
      EmptyStrToNull = True
    end
    object FornecedorCEP: TFIBStringField
      FieldName = 'CEP'
      Size = 8
      EmptyStrToNull = True
    end
    object FornecedorTELEFONE: TFIBStringField
      FieldName = 'TELEFONE'
      Size = 15
      EmptyStrToNull = True
    end
    object FornecedorTELEFONE2: TFIBStringField
      FieldName = 'TELEFONE2'
      Size = 15
      EmptyStrToNull = True
    end
    object FornecedorEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 60
      EmptyStrToNull = True
    end
    object FornecedorCONTATO: TFIBStringField
      FieldName = 'CONTATO'
      Size = 0
      EmptyStrToNull = True
    end
    object FornecedorINICIOATIVIDADE: TFIBStringField
      FieldName = 'INICIOATIVIDADE'
      Size = 0
      EmptyStrToNull = True
    end
    object FornecedorULTIMACOMPRA: TFIBDateTimeField
      FieldName = 'ULTIMACOMPRA'
    end
    object FornecedorVALORULTIMACOMPRA: TFIBFloatField
      FieldName = 'VALORULTIMACOMPRA'
    end
  end
  object Cliente: TpFIBDataSet
    SelectSQL.Strings = (
      'select Cliente.codigo as codigo,'
      '       cliente.razao_social as razao,'
      '       Cliente.nome_fantasia as fantasia,'
      '       cliente.tipo_pessoa as Pessoa,'
      '       cliente.cgc_cpf as CNPJ,'
      '       cliente.insc_estadual as Inscricao,'
      '       cliente.status as AtivoInativo,'
      '       cliente.endereco as Endereco,'
      '       cliente.complemento as Complemento,'
      '       cliente.numero as Numero,'
      '       cliente.bairro as Bairro,'
      '       endereco.cidade as Municipio,'
      '       uf.estado as Estado,'
      '       cliente.cep as Cep,'
      '       cliente.telefone as Telefone1,'
      '       cliente.fax as Telefone2,'
      '       cliente.email as Email,'
      '       cliente.endereco as EnderecoCobranca,'
      '       cliente.complemento as Complemento,'
      '       cliente.numero as Numero,'
      '       cliente.bairro as Bairro,'
      '       endereco.cidade as Municipio,'
      '       uf.estado as Estado,'
      '       cliente.cep as Cep,'
      '       cliente.telefone as Telefone1,'
      '       cliente.fax as Telefone2,'
      '       cliente.email as Email,'
      '       cliente.contato as Contato,'
      '       cliente.cod_transp as transportadoraPadrao,'
      '       '#39#39' as canalConsumidor,'
      '       cliente.vendedor_int as vendedor,'
      '       cliente.data_cadastro as InicioAtividade,'
      '       cliente.dt_ult_compra as UltimaCompra,'
      '       cliente.valor_ult_compra as ValorUltimacompra,'
      '       cliente.valor_maior_compra,'
      '       cliente.limite_credito,'
      '       '#39#39' as situacaoCredito,'
      '       cliente.prazo as condicaoPagamento,'
      '       cliente.contribuinte as contribuinteIcms,'
      '       cliente.obs_financeiro as observecao,'
      '       cliente.email as emailNFE,'
      '       cliente.cod_grupo_tributo'
      ' from cliente'
      '  INNER JOIN endereco on (cliente.cep = endereco.cep)'
      '  INNER JOIN UF ON (endereco.uf_ibge  = UF.ibge)')
    Transaction = Tr_Db
    Database = Db
    Left = 464
    Top = 16
    object ClienteCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object ClienteRAZAO: TFIBStringField
      FieldName = 'RAZAO'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteFANTASIA: TFIBStringField
      FieldName = 'FANTASIA'
      Size = 70
      EmptyStrToNull = True
    end
    object ClientePESSOA: TFIBStringField
      FieldName = 'PESSOA'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteCNPJ: TFIBStringField
      FieldName = 'CNPJ'
      Size = 18
      EmptyStrToNull = True
    end
    object ClienteINSCRICAO: TFIBStringField
      FieldName = 'INSCRICAO'
      EmptyStrToNull = True
    end
    object ClienteATIVOINATIVO: TFIBIntegerField
      FieldName = 'ATIVOINATIVO'
    end
    object ClienteENDERECO: TFIBStringField
      FieldName = 'ENDERECO'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteCOMPLEMENTO: TFIBStringField
      FieldName = 'COMPLEMENTO'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteNUMERO: TFIBStringField
      FieldName = 'NUMERO'
      Size = 10
      EmptyStrToNull = True
    end
    object ClienteBAIRRO: TFIBStringField
      FieldName = 'BAIRRO'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteMUNICIPIO: TFIBStringField
      FieldName = 'MUNICIPIO'
      Size = 100
      EmptyStrToNull = True
    end
    object ClienteESTADO: TFIBStringField
      FieldName = 'ESTADO'
      Size = 100
      EmptyStrToNull = True
    end
    object ClienteCEP: TFIBStringField
      FieldName = 'CEP'
      Size = 8
      EmptyStrToNull = True
    end
    object ClienteTELEFONE1: TFIBStringField
      FieldName = 'TELEFONE1'
      Size = 15
      EmptyStrToNull = True
    end
    object ClienteTELEFONE2: TFIBStringField
      FieldName = 'TELEFONE2'
      Size = 15
      EmptyStrToNull = True
    end
    object ClienteEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 100
      EmptyStrToNull = True
    end
    object ClienteENDERECOCOBRANCA: TFIBStringField
      FieldName = 'ENDERECOCOBRANCA'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteCOMPLEMENTO1: TFIBStringField
      FieldName = 'COMPLEMENTO1'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteNUMERO1: TFIBStringField
      FieldName = 'NUMERO1'
      Size = 10
      EmptyStrToNull = True
    end
    object ClienteBAIRRO1: TFIBStringField
      FieldName = 'BAIRRO1'
      Size = 70
      EmptyStrToNull = True
    end
    object ClienteMUNICIPIO1: TFIBStringField
      FieldName = 'MUNICIPIO1'
      Size = 100
      EmptyStrToNull = True
    end
    object ClienteESTADO1: TFIBStringField
      FieldName = 'ESTADO1'
      Size = 100
      EmptyStrToNull = True
    end
    object ClienteCEP1: TFIBStringField
      FieldName = 'CEP1'
      Size = 8
      EmptyStrToNull = True
    end
    object ClienteTELEFONE11: TFIBStringField
      FieldName = 'TELEFONE11'
      Size = 15
      EmptyStrToNull = True
    end
    object ClienteTELEFONE21: TFIBStringField
      FieldName = 'TELEFONE21'
      Size = 15
      EmptyStrToNull = True
    end
    object ClienteEMAIL1: TFIBStringField
      FieldName = 'EMAIL1'
      Size = 100
      EmptyStrToNull = True
    end
    object ClienteCONTATO: TFIBStringField
      FieldName = 'CONTATO'
      Size = 52
      EmptyStrToNull = True
    end
    object ClienteTRANSPORTADORAPADRAO: TFIBIntegerField
      FieldName = 'TRANSPORTADORAPADRAO'
    end
    object ClienteCANALCONSUMIDOR: TFIBStringField
      FieldName = 'CANALCONSUMIDOR'
      Size = 0
      EmptyStrToNull = True
    end
    object ClienteVENDEDOR: TFIBIntegerField
      FieldName = 'VENDEDOR'
    end
    object ClienteINICIOATIVIDADE: TFIBDateTimeField
      FieldName = 'INICIOATIVIDADE'
    end
    object ClienteULTIMACOMPRA: TFIBDateTimeField
      FieldName = 'ULTIMACOMPRA'
    end
    object ClienteVALORULTIMACOMPRA: TFIBFloatField
      FieldName = 'VALORULTIMACOMPRA'
    end
    object ClienteLIMITE_CREDITO: TFIBFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object ClienteSITUACAOCREDITO: TFIBStringField
      FieldName = 'SITUACAOCREDITO'
      Size = 0
      EmptyStrToNull = True
    end
    object ClienteCONDICAOPAGAMENTO: TFIBIntegerField
      FieldName = 'CONDICAOPAGAMENTO'
    end
    object ClienteCONTRIBUINTEICMS: TFIBStringField
      FieldName = 'CONTRIBUINTEICMS'
      Size = 1
      EmptyStrToNull = True
    end
    object ClienteOBSERVECAO: TFIBBlobField
      FieldName = 'OBSERVECAO'
      Size = 8
    end
    object ClienteEMAILNFE: TFIBStringField
      FieldName = 'EMAILNFE'
      Size = 100
      EmptyStrToNull = True
    end
    object ClienteVALOR_MAIOR_COMPRA: TFIBFloatField
      FieldName = 'VALOR_MAIOR_COMPRA'
    end
    object ClienteCOD_GRUPO_TRIBUTO: TFIBIntegerField
      FieldName = 'COD_GRUPO_TRIBUTO'
    end
  end
  object Produto: TpFIBDataSet
    SelectSQL.Strings = (
      ' select produto.codigo as codigo,'
      '       produto.codigo_catalago,'
      '       fornecedor.cgc_cpf as CNPJFornecedor,'
      '       produto.descricao as descricao,'
      '       '#39#39' as familia,'
      '       produto.marca as Marca,'
      '       produto.class_fiscal as NCM,'
      '       produto.unidade as UnidMedida,'
      '       produto.peso,'
      '       '#39#39' as DataCusto,'
      '       produto_preco.pr_lista as ValorCusto,'
      '       produto_informacoes.dt_ult_compra,'
      '       produto_informacoes.val_ult_compra,'
      '       produto.fornecedor,'
      '       '#39#39' as quantidadeMinEmbalagem,'
      '       produto.origem,'
      '       produto.linha,'
      '       produto.data_cadastro,'
      '       produto_preco.ipi_venda as tributaIPI,'
      '       produto.grupo,'
      '       produto.argumento_venda as complemento,'
      '       produto.codigo_original,'
      '       produto.codigo_anterior,'
      '       estoque.saldo'
      ' from produto'
      
        ' inner join fornecedor on (produto.fornecedor = fornecedor.codig' +
        'o)'
      ' inner join estoque on (produto.codigo = estoque.produto)'
      '                     and (1 = estoque.loja)'
      
        ' inner join produto_preco on (produto.codigo = produto_preco.cod' +
        '_produto)'
      '                          and(1 = produto_preco.loja)'
      
        ' inner join produto_informacoes on (produto.codigo = produto_inf' +
        'ormacoes.cod_produto)'
      '                          and(1 = produto_informacoes.loja)')
    Transaction = Tr_Db
    Database = Db
    Left = 464
    Top = 75
    object ProdutoCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object ProdutoCNPJFORNECEDOR: TFIBStringField
      FieldName = 'CNPJFORNECEDOR'
      Size = 18
      EmptyStrToNull = True
    end
    object ProdutoDESCRICAO: TFIBStringField
      FieldName = 'DESCRICAO'
      Size = 70
      EmptyStrToNull = True
    end
    object ProdutoFAMILIA: TFIBStringField
      FieldName = 'FAMILIA'
      Size = 0
      EmptyStrToNull = True
    end
    object ProdutoMARCA: TFIBIntegerField
      FieldName = 'MARCA'
    end
    object ProdutoNCM: TFIBStringField
      FieldName = 'NCM'
      Size = 15
      EmptyStrToNull = True
    end
    object ProdutoUNIDMEDIDA: TFIBStringField
      FieldName = 'UNIDMEDIDA'
      Size = 3
      EmptyStrToNull = True
    end
    object ProdutoPESO: TFIBFloatField
      FieldName = 'PESO'
    end
    object ProdutoDATACUSTO: TFIBStringField
      FieldName = 'DATACUSTO'
      Size = 0
      EmptyStrToNull = True
    end
    object ProdutoVALORCUSTO: TFIBFloatField
      FieldName = 'VALORCUSTO'
    end
    object ProdutoDT_ULT_COMPRA: TFIBDateTimeField
      FieldName = 'DT_ULT_COMPRA'
    end
    object ProdutoVAL_ULT_COMPRA: TFIBFloatField
      FieldName = 'VAL_ULT_COMPRA'
    end
    object ProdutoFORNECEDOR: TFIBIntegerField
      FieldName = 'FORNECEDOR'
    end
    object ProdutoQUANTIDADEMINEMBALAGEM: TFIBStringField
      FieldName = 'QUANTIDADEMINEMBALAGEM'
      Size = 0
      EmptyStrToNull = True
    end
    object ProdutoORIGEM: TFIBIntegerField
      FieldName = 'ORIGEM'
    end
    object ProdutoLINHA: TFIBIntegerField
      FieldName = 'LINHA'
    end
    object ProdutoDATA_CADASTRO: TFIBDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object ProdutoTRIBUTAIPI: TFIBFloatField
      FieldName = 'TRIBUTAIPI'
    end
    object ProdutoGRUPO: TFIBIntegerField
      FieldName = 'GRUPO'
    end
    object ProdutoCOMPLEMENTO: TFIBBlobField
      FieldName = 'COMPLEMENTO'
      Size = 8
    end
    object ProdutoCODIGO_CATALAGO: TFIBStringField
      FieldName = 'CODIGO_CATALAGO'
      Size = 30
      EmptyStrToNull = True
    end
    object ProdutoCODIGO_ORIGINAL: TFIBStringField
      FieldName = 'CODIGO_ORIGINAL'
      Size = 15
      EmptyStrToNull = True
    end
    object ProdutoCODIGO_ANTERIOR: TFIBStringField
      FieldName = 'CODIGO_ANTERIOR'
      Size = 30
      EmptyStrToNull = True
    end
    object ProdutoSALDO: TFIBBCDField
      FieldName = 'SALDO'
      Size = 3
    end
  end
  object clienteVendaMensal: TpFIBDataSet
    SelectSQL.Strings = (
      'select nota_fiscal.cod_cliente as Codigo,'
      '       nota_fiscal.nome_comprador as Razao,'
      '       cliente.cgc_cpf as Cnpj,'
      
        '       right('#39'00'#39'||extract(month from nota_fiscal.data_faturamen' +
        'to),2) || '#39'/'#39' || extract(year from  nota_fiscal.data_faturamento' +
        ') as Mes_Ano,'
      '       nota_fiscal.total as totalVenda'
      ' from nota_fiscal'
      
        ' inner join cliente on (nota_fiscal.cod_cliente = cliente.codigo' +
        ')'
      
        ' inner join tipo_mov    on (nota_fiscal.cod_tipo_mov  = tipo_mov' +
        '.codigo)'
      'where nota_fiscal.cod_loja = :cod_loja'
      'and nota_fiscal.data_faturamento between :data_ini and :data_fim'
      'and TIPO_MOV.grupo_mov IN (1,4,6,15)')
    Transaction = Tr_Db
    Database = Db
    Left = 616
    Top = 83
    object clienteVendaMensalCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object clienteVendaMensalRAZAO: TFIBStringField
      FieldName = 'RAZAO'
      Size = 70
      EmptyStrToNull = True
    end
    object clienteVendaMensalCNPJ: TFIBStringField
      FieldName = 'CNPJ'
      Size = 18
      EmptyStrToNull = True
    end
    object clienteVendaMensalMES_ANO: TFIBStringField
      FieldName = 'MES_ANO'
      Size = 15
      EmptyStrToNull = True
    end
    object clienteVendaMensalTOTALVENDA: TFIBFloatField
      FieldName = 'TOTALVENDA'
    end
  end
  object ProdutoVendaMensal: TpFIBDataSet
    SelectSQL.Strings = (
      'select itens_nota.cod_produto as Codigo,'
      '       itens_nota.descricao_produto,'
      '       itens_nota.cod_produto as CodigoPeca,'
      '       produto.fornecedor as Fornecedor,'
      '       fornecedor.cgc_cpf as CnpjFornecedor,'
      
        '       right('#39'00'#39'||extract(month from itens_nota.data),2) || '#39'/'#39 +
        ' || extract(year from  itens_nota.data) as Mes_Ano,'
      '       itens_nota.qtde_atendida as Qtde_Vendida'
      ' from itens_nota'
      ' inner join Produto on (itens_nota.cod_produto = produto.codigo)'
      
        ' inner join fornecedor on (produto.fornecedor = fornecedor.codig' +
        'o)'
      
        ' inner join tipo_mov    on (itens_nota.cod_tipo_mov  = tipo_mov.' +
        'codigo)'
      'where itens_nota.cod_loja = :cod_loja'
      'and itens_nota.data between :data_ini and :data_fim'
      'and TIPO_MOV.grupo_mov IN (1,4,6,15)')
    Transaction = Tr_Db
    Database = Db
    Left = 632
    Top = 11
    object ProdutoVendaMensalCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object ProdutoVendaMensalDESCRICAO_PRODUTO: TFIBStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 80
      EmptyStrToNull = True
    end
    object ProdutoVendaMensalCODIGOPECA: TFIBIntegerField
      FieldName = 'CODIGOPECA'
    end
    object ProdutoVendaMensalFORNECEDOR: TFIBIntegerField
      FieldName = 'FORNECEDOR'
    end
    object ProdutoVendaMensalCNPJFORNECEDOR: TFIBStringField
      FieldName = 'CNPJFORNECEDOR'
      Size = 18
      EmptyStrToNull = True
    end
    object ProdutoVendaMensalMES_ANO: TFIBStringField
      FieldName = 'MES_ANO'
      Size = 15
      EmptyStrToNull = True
    end
    object ProdutoVendaMensalQTDE_VENDIDA: TFIBFloatField
      FieldName = 'QTDE_VENDIDA'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
  end
  object EstoqueProduto: TpFIBDataSet
    SelectSQL.Strings = (
      'select first 200 * from estoque'
      'inner join produto on (estoque.produto = produto.codigo)'
      'where estoque.loja = :cod_loja'
      'and estoque.saldo > 0'
      'and produto.tipo_item = '#39'00'#39
      'and produto.produto_servico in ('#39'P'#39','#39'B'#39')')
    Transaction = Tr_Db
    Database = Db
    Left = 689
    Top = 145
    object EstoqueProdutoLOJA: TFIBIntegerField
      FieldName = 'LOJA'
    end
    object EstoqueProdutoPRODUTO: TFIBIntegerField
      FieldName = 'PRODUTO'
    end
    object EstoqueProdutoSALDO_GARANTIA: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'SALDO_GARANTIA'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
      Size = 3
    end
    object EstoqueProdutoSALDO_INVENTARIO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'SALDO_INVENTARIO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
      Size = 3
    end
    object EstoqueProdutoSALDO_3112: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'SALDO_3112'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
      Size = 3
    end
    object EstoqueProdutoSALDO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
      Size = 3
    end
    object EstoqueProdutoSALDO_TRANSPORTE: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'SALDO_TRANSPORTE'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
      Size = 3
    end
    object EstoqueProdutoTESTE: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'TESTE'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
      Size = 3
    end
    object EstoqueProdutoINICIAL_BKP: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'INICIAL_BKP'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
      Size = 3
    end
    object EstoqueProdutoSALDO_BALANCO: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'SALDO_BALANCO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
      Size = 3
    end
    object EstoqueProdutoEMPRESA: TFIBIntegerField
      FieldName = 'EMPRESA'
    end
    object EstoqueProdutoCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object EstoqueProdutoCODIGO_ORIGINAL: TFIBStringField
      FieldName = 'CODIGO_ORIGINAL'
      Size = 15
      EmptyStrToNull = True
    end
    object EstoqueProdutoAPLICACAO: TFIBStringField
      FieldName = 'APLICACAO'
      Size = 70
      EmptyStrToNull = True
    end
    object EstoqueProdutoDESCRICAO: TFIBStringField
      FieldName = 'DESCRICAO'
      Size = 70
      EmptyStrToNull = True
    end
    object EstoqueProdutoUNIDADE: TFIBStringField
      FieldName = 'UNIDADE'
      Size = 3
      EmptyStrToNull = True
    end
    object EstoqueProdutoDATA_CADASTRO: TFIBDateTimeField
      FieldName = 'DATA_CADASTRO'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object EstoqueProdutoTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoLINHA: TFIBIntegerField
      FieldName = 'LINHA'
    end
    object EstoqueProdutoEQUIVALENTE: TFIBStringField
      FieldName = 'EQUIVALENTE'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoKIT: TFIBStringField
      FieldName = 'KIT'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoPRODUTO_SERVICO: TFIBStringField
      FieldName = 'PRODUTO_SERVICO'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoLIVRO_PRECO: TFIBStringField
      FieldName = 'LIVRO_PRECO'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoARGUMENTO_VENDA: TFIBBlobField
      FieldName = 'ARGUMENTO_VENDA'
      Size = 8
    end
    object EstoqueProdutoTIPO_PROMOCAO: TFIBIntegerField
      FieldName = 'TIPO_PROMOCAO'
    end
    object EstoqueProdutoDOLAR: TFIBStringField
      FieldName = 'DOLAR'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoCOD_BARRA: TFIBStringField
      FieldName = 'COD_BARRA'
      EmptyStrToNull = True
    end
    object EstoqueProdutoCODIGO_CATALAGO: TFIBStringField
      FieldName = 'CODIGO_CATALAGO'
      Size = 30
      EmptyStrToNull = True
    end
    object EstoqueProdutoGRUPO: TFIBIntegerField
      FieldName = 'GRUPO'
    end
    object EstoqueProdutoFORNECEDOR: TFIBIntegerField
      FieldName = 'FORNECEDOR'
    end
    object EstoqueProdutoORIGEM: TFIBIntegerField
      FieldName = 'ORIGEM'
    end
    object EstoqueProdutoFOTO: TFIBStringField
      FieldName = 'FOTO'
      Size = 100
      EmptyStrToNull = True
    end
    object EstoqueProdutoSTATUS: TFIBIntegerField
      FieldName = 'STATUS'
    end
    object EstoqueProdutoPESO: TFIBFloatField
      FieldName = 'PESO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object EstoqueProdutoPESO_BRUTO: TFIBFloatField
      FieldName = 'PESO_BRUTO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object EstoqueProdutoMETRAGEM: TFIBFloatField
      FieldName = 'METRAGEM'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object EstoqueProdutoVENDA_S_CADASTRO: TFIBStringField
      FieldName = 'VENDA_S_CADASTRO'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoINTEIRO_FRACIONARIA: TFIBStringField
      DefaultExpression = #39'I'#39
      FieldName = 'INTEIRO_FRACIONARIA'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoAPLICACAO_COMPLEMENTAR: TFIBStringField
      FieldName = 'APLICACAO_COMPLEMENTAR'
      Size = 70
      EmptyStrToNull = True
    end
    object EstoqueProdutoOUTRO_CODIGO: TFIBStringField
      FieldName = 'OUTRO_CODIGO'
      Size = 30
      EmptyStrToNull = True
    end
    object EstoqueProdutoCODIGO_ANTERIOR: TFIBStringField
      FieldName = 'CODIGO_ANTERIOR'
      Size = 30
      EmptyStrToNull = True
    end
    object EstoqueProdutoCLASS_FISCAL: TFIBStringField
      FieldName = 'CLASS_FISCAL'
      Size = 15
      EmptyStrToNull = True
    end
    object EstoqueProdutoFOTO2: TFIBStringField
      FieldName = 'FOTO2'
      Size = 100
      EmptyStrToNull = True
    end
    object EstoqueProdutoFOTO3: TFIBStringField
      FieldName = 'FOTO3'
      Size = 100
      EmptyStrToNull = True
    end
    object EstoqueProdutoCODIGO_FOTO: TFIBIntegerField
      FieldName = 'CODIGO_FOTO'
    end
    object EstoqueProdutoUSUARIO_CADASTRO: TFIBStringField
      FieldName = 'USUARIO_CADASTRO'
      Size = 35
      EmptyStrToNull = True
    end
    object EstoqueProdutoDESCRICAO_SINTEGRA: TFIBStringField
      FieldName = 'DESCRICAO_SINTEGRA'
      Size = 50
      EmptyStrToNull = True
    end
    object EstoqueProdutoMARCA: TFIBIntegerField
      FieldName = 'MARCA'
    end
    object EstoqueProdutoTIPO_ITEM: TFIBStringField
      FieldName = 'TIPO_ITEM'
      Size = 2
      EmptyStrToNull = True
    end
    object EstoqueProdutoCOD_ANT: TFIBIntegerField
      FieldName = 'COD_ANT'
    end
    object EstoqueProdutoSINCRONIZADO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'SINCRONIZADO'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoCST_IPI: TFIBStringField
      FieldName = 'CST_IPI'
      Size = 2
      EmptyStrToNull = True
    end
    object EstoqueProdutoCOD_ANP: TFIBStringField
      FieldName = 'COD_ANP'
      Size = 10
      EmptyStrToNull = True
    end
    object EstoqueProdutoCOMISSAO_MECANICO: TFIBStringField
      FieldName = 'COMISSAO_MECANICO'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoNUMERO_SERIE: TFIBStringField
      FieldName = 'NUMERO_SERIE'
      Size = 1
      EmptyStrToNull = True
    end
    object EstoqueProdutoDESCRICAO_ANP: TFIBStringField
      FieldName = 'DESCRICAO_ANP'
      Size = 100
      EmptyStrToNull = True
    end
    object EstoqueProdutoCODIGO_ML: TFIBStringField
      FieldName = 'CODIGO_ML'
      Size = 50
      EmptyStrToNull = True
    end
    object EstoqueProdutoFOTO4: TFIBStringField
      FieldName = 'FOTO4'
      Size = 100
      EmptyStrToNull = True
    end
    object EstoqueProdutoFOTO5: TFIBStringField
      FieldName = 'FOTO5'
      Size = 100
      EmptyStrToNull = True
    end
    object EstoqueProdutoARGUMENTO_VENDA_RTF: TFIBStringField
      FieldName = 'ARGUMENTO_VENDA_RTF'
      Size = 10000
      EmptyStrToNull = True
    end
    object EstoqueProdutoPERC_COMISSAO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
  end
  object mxNativeExcel1: TmxNativeExcel
    ActiveFont = 0
    Borders = []
    Shading = False
    Version = '1.26'
    Left = 1032
    Top = 104
  end
  object SaveExcel: TSaveDialog
    Left = 1032
    Top = 56
  end
  object Vendedor: TpFIBDataSet
    SelectSQL.Strings = (
      'select rep.codigo,rep.nome, '#39#39' as email from rep')
    Transaction = Tr_Db
    Database = Db
    Left = 1032
    Top = 8
    object VendedorCODIGO: TFIBIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object VendedorNOME: TFIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
      EmptyStrToNull = True
    end
    object VendedorEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 0
      EmptyStrToNull = True
    end
  end
  object Transportadora: TpFIBDataSet
    SelectSQL.Strings = (
      'select transportadora.codigo as Codigo,'
      '       transportadora.nome_fantasia as Fantasia,'
      '       transportadora.razao_social as Razao,'
      '       transportadora.endereco as Endereco,'
      '       '#39#39' as Numero,'
      '       '#39#39' as Complemento,'
      '       transportadora.bairro as Bairro,'
      '       endereco.cidade as Municipio,'
      '       uf.estado as Estado,'
      '       transportadora.cep as CEP,'
      '       transportadora.cnpj_cpf as CNPJ,'
      '       transportadora.insc_est as Inscricao,'
      '       transportadora.telefone as Telefone,'
      '       transportadora.fax as Telefone2,'
      '       '#39#39' as Email,'
      '       '#39#39' as Contato'
      '       from transportadora'
      
        '       INNER JOIN endereco on (transportadora.cep = endereco.cep' +
        ')'
      '       INNER JOIN UF ON (endereco.uf_ibge  = UF.ibge)')
    Transaction = Tr_Db
    Database = Db
    Left = 968
    Top = 8
    object TransportadoraCODIGO: TFIBIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object TransportadoraFANTASIA: TFIBStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'FANTASIA'
      Size = 70
      EmptyStrToNull = True
    end
    object TransportadoraRAZAO: TFIBStringField
      DisplayLabel = 'Razao'
      FieldName = 'RAZAO'
      Size = 70
      EmptyStrToNull = True
    end
    object TransportadoraENDERECO: TFIBStringField
      DisplayLabel = 'Endereco'
      FieldName = 'ENDERECO'
      Size = 70
      EmptyStrToNull = True
    end
    object TransportadoraNUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Size = 0
      EmptyStrToNull = True
    end
    object TransportadoraCOMPLEMENTO: TFIBStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 0
      EmptyStrToNull = True
    end
    object TransportadoraBAIRRO: TFIBStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 70
      EmptyStrToNull = True
    end
    object TransportadoraMUNICIPIO: TFIBStringField
      DisplayLabel = 'Municipio'
      FieldName = 'MUNICIPIO'
      Size = 100
      EmptyStrToNull = True
    end
    object TransportadoraESTADO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 100
      EmptyStrToNull = True
    end
    object TransportadoraCEP: TFIBStringField
      DisplayLabel = 'Cep'
      FieldName = 'CEP'
      Size = 8
      EmptyStrToNull = True
    end
    object TransportadoraCNPJ: TFIBStringField
      DisplayLabel = 'Cnpj'
      FieldName = 'CNPJ'
      Size = 18
      EmptyStrToNull = True
    end
    object TransportadoraINSCRICAO: TFIBStringField
      DisplayLabel = 'Inscricao'
      FieldName = 'INSCRICAO'
      EmptyStrToNull = True
    end
    object TransportadoraTELEFONE: TFIBStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Size = 15
      EmptyStrToNull = True
    end
    object TransportadoraTELEFONE2: TFIBStringField
      DisplayLabel = 'Telefone2'
      FieldName = 'TELEFONE2'
      Size = 15
      EmptyStrToNull = True
    end
    object TransportadoraEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 0
      EmptyStrToNull = True
    end
    object TransportadoraCONTATO: TFIBStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 0
      EmptyStrToNull = True
    end
  end
  object Db: TpFIBDatabase
    DBName = '192.168.1.40/3051:F:\Dados\BD_SouzaNeto\GUARA.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'sql_role_name='
      'lc_ctype=ISO8859_1'
      'password=cinco.25')
    DefaultTransaction = Tr_Db
    DefaultUpdateTransaction = Tr_Db
    SQLDialect = 3
    Timeout = 0
    LibraryName = 'fbclient.dll'
    WaitForRestoreConnect = 0
    Left = 760
    Top = 94
  end
  object Tr_Db: TpFIBTransaction
    DefaultDatabase = Db
    TimeoutAction = TACommitRetaining
    TRParams.Strings = (
      'write'
      'isc_tpb_nowait'
      'read_committed'
      'rec_version')
    TPBMode = tpbDefault
    Left = 767
    Top = 17
  end
  object Loja: TpFIBDataSet
    CachedUpdates = True
    SelectSQL.Strings = (
      'select'
      'distinct LOJA.CEP,'
      'Loja.*,'
      'Empresa.Razao_Social as Nome_Empresa,'
      'Empresa.Tef,'
      'Uf.Uf  as Nome_Estado,'
      'Endereco.Cidade as Nome_Cidade,'
      'Endereco.municipio_ibge,'
      'uf.ibge ibge_uf'
      'FROM Loja'
      '   INNER JOIN EMPRESA ON  (LOJA.EMPRESA = EMPRESA.CODIGO)  '
      '   INNER JOIN Endereco   ON  (Loja.Cep = Endereco.Cep)'
      '   INNER JOIN UF ON   (UF.ibge = ENDERECO.uf_ibge)'
      'WHERE Loja.CODIGO =:Codigo')
    Transaction = Tr_Db
    Database = Db
    AutoCommit = True
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy hh:mm'
    DefaultFormats.DisplayFormatTime = 'hh:mm'
    Left = 600
    Top = 142
    poSQLINT64ToBCD = True
    object LojaEMPRESA: TFIBIntegerField
      FieldName = 'EMPRESA'
    end
    object LojaCODIGO: TFIBIntegerField
      FieldName = 'CODIGO'
    end
    object LojaRAZAO_SOCIAL: TFIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaNOME_FANTASIA: TFIBStringField
      FieldName = 'NOME_FANTASIA'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaPLANO_CONTAS: TFIBStringField
      FieldName = 'PLANO_CONTAS'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaNOME_ESTADO: TFIBStringField
      FieldName = 'NOME_ESTADO'
      Size = 2
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCONTA_DUP_PAGAR: TFIBIntegerField
      FieldName = 'CONTA_DUP_PAGAR'
    end
    object LojaCONTA_TROCO_DEBITO: TFIBIntegerField
      FieldName = 'CONTA_TROCO_DEBITO'
    end
    object LojaCONTA_TROCO_CREDITO: TFIBIntegerField
      FieldName = 'CONTA_TROCO_CREDITO'
    end
    object LojaDESCONTO_ACERTO_DUPLICATA: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'DESCONTO_ACERTO_DUPLICATA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCONTA_DUP_RECEBER: TFIBIntegerField
      FieldName = 'CONTA_DUP_RECEBER'
    end
    object LojaCGC_CPF: TFIBStringField
      FieldName = 'CGC_CPF'
      Size = 18
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaENDERECO: TFIBStringField
      FieldName = 'ENDERECO'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaBAIRRO: TFIBStringField
      FieldName = 'BAIRRO'
      Size = 30
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCEP: TFIBStringField
      FieldName = 'CEP'
      Size = 8
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaINSC_ESTADUAL: TFIBStringField
      FieldName = 'INSC_ESTADUAL'
      Size = 15
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaTELEFONE: TFIBStringField
      FieldName = 'TELEFONE'
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaFAX: TFIBStringField
      FieldName = 'FAX'
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaNOME_CIDADE: TFIBStringField
      FieldName = 'NOME_CIDADE'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaSUBSTITUTO_TRIB: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'SUBSTITUTO_TRIB'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaTX_COBRANCA: TFIBFloatField
      FieldName = 'TX_COBRANCA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaNOTA_GERA_DUPLICATA: TFIBStringField
      FieldName = 'NOTA_GERA_DUPLICATA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaNUMERO_SERIE_ECF: TFIBStringField
      FieldName = 'NUMERO_SERIE_ECF'
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaORDEM_PEDIDO: TFIBIntegerField
      FieldName = 'ORDEM_PEDIDO'
    end
    object LojaMENSAGEM_PEDIDO: TFIBStringField
      FieldName = 'MENSAGEM_PEDIDO'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaECF_TIPO_MOV: TFIBIntegerField
      FieldName = 'ECF_TIPO_MOV'
    end
    object LojaECF_VISTA: TFIBIntegerField
      FieldName = 'ECF_VISTA'
    end
    object LojaECF_CARTAO: TFIBIntegerField
      FieldName = 'ECF_CARTAO'
    end
    object LojaECF_CHEQUE: TFIBIntegerField
      FieldName = 'ECF_CHEQUE'
    end
    object LojaCAMINHO_DIRETORIO_TEF: TFIBStringField
      FieldName = 'CAMINHO_DIRETORIO_TEF'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaECF_VISTA_PRAZO: TFIBStringField
      FieldName = 'ECF_VISTA_PRAZO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_SERVICO_ECF: TFIBStringField
      FieldName = 'IMP_SERVICO_ECF'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LOJAIMP_BOLETO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'IMP_BOLETO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LOJAIMP_BOLETOS: TFIBStringField
      FieldName = 'IMP_BOLETOS'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LOJATIPO_PESSOA: TFIBStringField
      FieldName = 'TIPO_PESSOA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOSNOTA_VDO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'OSNOTA_VDO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaMENSAGEM_NF: TFIBStringField
      FieldName = 'MENSAGEM_NF'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCHECA_DESCONTO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'CHECA_DESCONTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCHECA_PRECO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'CHECA_PRECO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaESTOQUE_NEGATIVO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'ESTOQUE_NEGATIVO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaDIAS_ATRASO_BLOQUEIO: TFIBIntegerField
      FieldName = 'DIAS_ATRASO_BLOQUEIO'
    end
    object LojaCHECA_VAL_CADASTRO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'CHECA_VAL_CADASTRO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCHECA_LIMITE: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'CHECA_LIMITE'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaDIAS_PRAZO_1: TFIBIntegerField
      FieldName = 'DIAS_PRAZO_1'
    end
    object LojaDIAS_PRAZO_2: TFIBIntegerField
      FieldName = 'DIAS_PRAZO_2'
    end
    object LojaDIAS_PRAZO_3: TFIBIntegerField
      FieldName = 'DIAS_PRAZO_3'
    end
    object LojaDIAS_PRAZO_4: TFIBIntegerField
      FieldName = 'DIAS_PRAZO_4'
    end
    object LojaCONTA_REP: TFIBIntegerField
      FieldName = 'CONTA_REP'
    end
    object LojaCURVA_A: TFIBFloatField
      FieldName = 'CURVA_A'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaCURVA_B: TFIBFloatField
      FieldName = 'CURVA_B'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaCURVA_C: TFIBFloatField
      FieldName = 'CURVA_C'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaCURVA_D: TFIBFloatField
      FieldName = 'CURVA_D'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaTX_MORA_DUP: TFIBFloatField
      FieldName = 'TX_MORA_DUP'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaTX_FIN_DIA: TFIBFloatField
      FieldName = 'TX_FIN_DIA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaTX_FIN_MES: TFIBFloatField
      FieldName = 'TX_FIN_MES'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaVALOR_MIN_FAT: TFIBFloatField
      FieldName = 'VALOR_MIN_FAT'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaVALOR_MIN_CARTAO: TFIBFloatField
      FieldName = 'VALOR_MIN_CARTAO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaCOMISSAO_FATURADO: TFIBFloatField
      FieldName = 'COMISSAO_FATURADO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaCOMISSAO_RECEBIDO: TFIBFloatField
      FieldName = 'COMISSAO_RECEBIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaLOGOMARCA: TFIBStringField
      FieldName = 'LOGOMARCA'
      Size = 80
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCABECALHO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'CABECALHO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCOMPLEMENTO: TFIBStringField
      FieldName = 'COMPLEMENTO'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCONTATO: TFIBStringField
      FieldName = 'CONTATO'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaTIPO_MOV_REQ: TFIBIntegerField
      FieldName = 'TIPO_MOV_REQ'
    end
    object LojaISENCAO_IPI: TFIBStringField
      FieldName = 'ISENCAO_IPI'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaALIQ_ISS: TFIBFloatField
      FieldName = 'ALIQ_ISS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaJUCEG: TFIBStringField
      FieldName = 'JUCEG'
      Size = 15
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_MINUTA: TFIBStringField
      FieldName = 'IMP_MINUTA'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_PROMISSORIA: TFIBStringField
      FieldName = 'IMP_PROMISSORIA'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_OS: TFIBStringField
      FieldName = 'IMP_OS'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_NOTA_FISCAL: TFIBStringField
      FieldName = 'IMP_NOTA_FISCAL'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_PEDIDO: TFIBStringField
      FieldName = 'IMP_PEDIDO'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaDATA_JUCEG: TFIBDateTimeField
      FieldName = 'DATA_JUCEG'
      DisplayFormat = 'dd.mm.yyyy hh:mm'
    end
    object LojaDIAS_VALIDAR_CADASTRO: TFIBIntegerField
      FieldName = 'DIAS_VALIDAR_CADASTRO'
    end
    object LojaDIAS_VALIDADE_COTACAO: TFIBIntegerField
      FieldName = 'DIAS_VALIDADE_COTACAO'
    end
    object LojaCONFIG_REQ: TFIBBlobField
      FieldName = 'CONFIG_REQ'
      Size = 8
    end
    object LojaDATA_FATURAMENTO_NF: TFIBIntegerField
      FieldName = 'DATA_FATURAMENTO_NF'
    end
    object LojaOSRECIBO_VDO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'OSRECIBO_VDO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOS_VDO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'OS_VDO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOSDESCONTO_PRODUTO: TFIBFloatField
      FieldName = 'OSDESCONTO_PRODUTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaOPCAO_COMISSAO: TFIBStringField
      FieldName = 'OPCAO_COMISSAO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_OS_RECIBO: TFIBStringField
      FieldName = 'IMP_OS_RECIBO'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOS_ACEITA_ITEMVALOR_ZERO: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'OS_ACEITA_ITEMVALOR_ZERO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOS_MOUSE: TFIBStringField
      FieldName = 'OS_MOUSE'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaNOTA_IMPRESSA_MANUAL: TFIBStringField
      FieldName = 'NOTA_IMPRESSA_MANUAL'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaECF_CONCOMITANTE: TFIBStringField
      FieldName = 'ECF_CONCOMITANTE'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOPCAO_IMPRIME_OS: TFIBIntegerField
      FieldName = 'OPCAO_IMPRIME_OS'
    end
    object LojaOPCAO_FORMULARIO: TFIBIntegerField
      FieldName = 'OPCAO_FORMULARIO'
    end
    object LojaIMP_REQ_COMPRA: TFIBStringField
      FieldName = 'IMP_REQ_COMPRA'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaDESCONTO_PROMOCAO: TFIBStringField
      FieldName = 'DESCONTO_PROMOCAO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaQTDE_ITENS_PEDIDO: TFIBIntegerField
      FieldName = 'QTDE_ITENS_PEDIDO'
    end
    object LojaALTERA_PRECO_VENDA: TFIBStringField
      FieldName = 'ALTERA_PRECO_VENDA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaFOCO: TFIBIntegerField
      FieldName = 'FOCO'
    end
    object LojaOSACEITA_ITEMVALOR_ZERO: TFIBStringField
      FieldName = 'OSACEITA_ITEMVALOR_ZERO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOS_TRANSP_PADRAO: TFIBIntegerField
      FieldName = 'OS_TRANSP_PADRAO'
    end
    object LojaOS_OPC_DESCONTO: TFIBStringField
      FieldName = 'OS_OPC_DESCONTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOS_IMPRIME_RECIBO: TFIBStringField
      FieldName = 'OS_IMPRIME_RECIBO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaALTERA_CLIENTE: TFIBStringField
      FieldName = 'ALTERA_CLIENTE'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaRENTAB_MIN_VENDA: TFIBFloatField
      FieldName = 'RENTAB_MIN_VENDA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaOS_TRANSP: TFIBStringField
      FieldName = 'OS_TRANSP'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOPCAO_FORMULARIO_PEDIDO: TFIBIntegerField
      FieldName = 'OPCAO_FORMULARIO_PEDIDO'
    end
    object LojaPESQUISA_PRODUTO_COM_IMPOSTO: TFIBStringField
      FieldName = 'PESQUISA_PRODUTO_COM_IMPOSTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaNUM_TARE: TFIBStringField
      FieldName = 'NUM_TARE'
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCONTROLE_PEDIDO: TFIBStringField
      FieldName = 'CONTROLE_PEDIDO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaALTERA_DATA_BAIXA: TFIBStringField
      FieldName = 'ALTERA_DATA_BAIXA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCONFIGURA_CABECALHO_PEDIDO: TFIBBlobField
      FieldName = 'CONFIGURA_CABECALHO_PEDIDO'
      Size = 8
    end
    object LojaOP_COMISAO_MECANICO: TFIBStringField
      FieldName = 'OP_COMISAO_MECANICO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaPLACA_CHASSI: TFIBStringField
      FieldName = 'PLACA_CHASSI'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaESTOQUE_LOJA: TFIBStringField
      FieldName = 'ESTOQUE_LOJA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_RECIBO_OS: TFIBStringField
      FieldName = 'IMP_RECIBO_OS'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaLISTA_OS_RECIBO: TFIBStringField
      FieldName = 'LISTA_OS_RECIBO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaESTOQUE_FECHADO: TFIBStringField
      FieldName = 'ESTOQUE_FECHADO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaQTDE_SERVICO_PEDIDO: TFIBIntegerField
      FieldName = 'QTDE_SERVICO_PEDIDO'
    end
    object LojaIMP_FATURAMENTO: TFIBStringField
      FieldName = 'IMP_FATURAMENTO'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaQTDE_CASAS_DECIMAL: TFIBIntegerField
      FieldName = 'QTDE_CASAS_DECIMAL'
    end
    object LojaTD_ATACADO_APRAZO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TD_ATACADO_APRAZO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaTD_ATACADO_AVISTA: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TD_ATACADO_AVISTA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaTD_VAREJO_APRAZO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TD_VAREJO_APRAZO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaTD_VAREJO_AVISTA: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TD_VAREJO_AVISTA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaTD_SERVICO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'TD_SERVICO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaID_ATACADO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ID_ATACADO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaID_VAREJO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ID_VAREJO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaID_SERVICO: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ID_SERVICO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
    end
    object LojaTEMPO_DESCANCO: TFIBStringField
      FieldName = 'TEMPO_DESCANCO'
      Size = 11
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOFICINA: TFIBStringField
      FieldName = 'OFICINA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMPRIME_DESCONTO: TFIBStringField
      FieldName = 'IMPRIME_DESCONTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOPCAO_IMP_RECIBO_ENTREGA: TFIBStringField
      FieldName = 'OPCAO_IMP_RECIBO_ENTREGA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_CATALOGO_COTACAO: TFIBStringField
      FieldName = 'IMP_CATALOGO_COTACAO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMPRIME_DESCONTO_RP: TFIBStringField
      FieldName = 'IMPRIME_DESCONTO_RP'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaMOSTRA_ARGUMENTO_VENDA: TFIBStringField
      FieldName = 'MOSTRA_ARGUMENTO_VENDA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_ZEBRA: TFIBStringField
      FieldName = 'IMP_ZEBRA'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCHECA_PLACA_OS_ABERTA: TFIBStringField
      FieldName = 'CHECA_PLACA_OS_ABERTA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaFATURA_ORGAO_PUBLICO: TFIBStringField
      FieldName = 'FATURA_ORGAO_PUBLICO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaTIPO_VENDA: TFIBIntegerField
      FieldName = 'TIPO_VENDA'
    end
    object LojaDESCONTO_EXTRA_FATURAMENTO: TFIBStringField
      FieldName = 'DESCONTO_EXTRA_FATURAMENTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaDESCONTO_PEDIDO: TFIBStringField
      FieldName = 'DESCONTO_PEDIDO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaDESCONTO_ITEM: TFIBStringField
      FieldName = 'DESCONTO_ITEM'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCONTA_TROCO: TFIBIntegerField
      FieldName = 'CONTA_TROCO'
    end
    object LojaIMPRIME_OS_RECIBO: TFIBStringField
      FieldName = 'IMPRIME_OS_RECIBO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOPCAO_ICMS_SIT_TRIBUTARIA: TFIBStringField
      FieldName = 'OPCAO_ICMS_SIT_TRIBUTARIA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaSUBSTITUTO_TRIB_TODOS_ESTADOS: TFIBStringField
      FieldName = 'SUBSTITUTO_TRIB_TODOS_ESTADOS'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaOPCAO_REDUCAO_BASE: TFIBStringField
      FieldName = 'OPCAO_REDUCAO_BASE'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaTIPO_VENDA_FATURA_OS: TFIBIntegerField
      FieldName = 'TIPO_VENDA_FATURA_OS'
    end
    object LojaCAMINHO_CATALOGO_SERVIDOR_LINUX: TFIBStringField
      FieldName = 'CAMINHO_CATALOGO_SERVIDOR_LINUX'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCAMINHO_CATALOGO_ESTACAO_WIN: TFIBStringField
      FieldName = 'CAMINHO_CATALOGO_ESTACAO_WIN'
      Size = 70
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCNPJ_CPF_OBRIGATORIO: TFIBStringField
      DefaultExpression = #39'S'#39
      FieldName = 'CNPJ_CPF_OBRIGATORIO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCLIENTE_PARCIAL_BANCO: TFIBIntegerField
      FieldName = 'CLIENTE_PARCIAL_BANCO'
    end
    object LojaCLIENTE_PARCIAL_STATUS: TFIBIntegerField
      FieldName = 'CLIENTE_PARCIAL_STATUS'
    end
    object LojaCLIENTE_PARCIAL_PAGTO: TFIBIntegerField
      FieldName = 'CLIENTE_PARCIAL_PAGTO'
    end
    object LojaICMS_DIFERENCIADO_PRODUTO: TFIBStringField
      FieldName = 'ICMS_DIFERENCIADO_PRODUTO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCABECALHO_ETIQUETA_ZEBRA: TFIBStringField
      DefaultExpression = #39'S'#39
      FieldName = 'CABECALHO_ETIQUETA_ZEBRA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaALIQUOTA_PIS: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ALIQUOTA_PIS'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object LojaALIQUOTA_COFINS: TFIBFloatField
      DefaultExpression = '0'
      FieldName = 'ALIQUOTA_COFINS'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
    end
    object LojaSISTEMA_TEF: TFIBIntegerField
      DefaultExpression = '0'
      FieldName = 'SISTEMA_TEF'
    end
    object LojaIMP_PADRAO_USUARIO: TFIBStringField
      FieldName = 'IMP_PADRAO_USUARIO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaPRODUTO_060_TRIBUTA_FORA_ESTADO: TFIBStringField
      FieldName = 'PRODUTO_060_TRIBUTA_FORA_ESTADO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMPRIME_ITEM_NEGATIVO_RECIBO: TFIBStringField
      FieldName = 'IMPRIME_ITEM_NEGATIVO_RECIBO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaALTERA_PRECO_VENDIDO: TFIBIntegerField
      FieldName = 'ALTERA_PRECO_VENDIDO'
    end
    object LojaOPCAO_CODIGO_ECF: TFIBStringField
      FieldName = 'OPCAO_CODIGO_ECF'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaVENDEDOR_VISUALIZA_VENDA_OUTRO: TFIBStringField
      FieldName = 'VENDEDOR_VISUALIZA_VENDA_OUTRO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaNOME_EMPRESA: TFIBStringField
      FieldName = 'NOME_EMPRESA'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaGERA_CONTA_REP: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'GERA_CONTA_REP'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaMENSAGEM_ECF: TFIBStringField
      FieldName = 'MENSAGEM_ECF'
      Size = 45
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaMENSAGEM_OS: TFIBStringField
      FieldName = 'MENSAGEM_OS'
      Size = 35
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaSUPER_SIMPLES_SUBSTITUICAO: TFIBStringField
      FieldName = 'SUPER_SIMPLES_SUBSTITUICAO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaTEF: TFIBStringField
      FieldName = 'TEF'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCRT: TFIBIntegerField
      FieldName = 'CRT'
    end
    object LojaOPCAO_FORMULARIO_COMPRA: TFIBIntegerField
      FieldName = 'OPCAO_FORMULARIO_COMPRA'
    end
    object LojaTIPO_TAXA_COBRANCA: TFIBIntegerField
      FieldName = 'TIPO_TAXA_COBRANCA'
    end
    object LojaPRECO_TRANSFERENCIA: TFIBIntegerField
      FieldName = 'PRECO_TRANSFERENCIA'
    end
    object LojaREGIME_TRIBUTARIO: TFIBIntegerField
      FieldName = 'REGIME_TRIBUTARIO'
    end
    object LojaTIPO_APURACAO_PISCOFINS: TFIBIntegerField
      FieldName = 'TIPO_APURACAO_PISCOFINS'
    end
    object LojaOPCAO_PRODUTO_SERVICO_OS: TFIBStringField
      FieldName = 'OPCAO_PRODUTO_SERVICO_OS'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCAMINHO_DIRETORIO_NFSE: TFIBStringField
      FieldName = 'CAMINHO_DIRETORIO_NFSE'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaREQ_VDO: TFIBStringField
      FieldName = 'REQ_VDO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaPEDIDO_VDO: TFIBStringField
      FieldName = 'PEDIDO_VDO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaPRAZO_REQUISICAO: TFIBIntegerField
      FieldName = 'PRAZO_REQUISICAO'
    end
    object LojaCAMINHO_DIRETORIO_XML: TFIBStringField
      FieldName = 'CAMINHO_DIRETORIO_XML'
      Size = 100
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaINSC_MUNICIPAL: TFIBStringField
      FieldName = 'INSC_MUNICIPAL'
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCODIGO_CNAE: TFIBStringField
      FieldName = 'CODIGO_CNAE'
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCODIGO_TRIB_MUNICIPIO: TFIBStringField
      FieldName = 'CODIGO_TRIB_MUNICIPIO'
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaMUNICIPIO_IBGE: TFIBStringField
      FieldName = 'MUNICIPIO_IBGE'
      Size = 8
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaSEPARACAO: TFIBStringField
      FieldName = 'SEPARACAO'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaNOTA_MISTA: TFIBStringField
      FieldName = 'NOTA_MISTA'
      Size = 1
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaIMP_NFCE: TFIBStringField
      FieldName = 'IMP_NFCE'
      Size = 60
      Transliterate = False
      EmptyStrToNull = True
    end
    object LojaCELULAR: TFIBStringField
      FieldName = 'CELULAR'
      Size = 60
      EmptyStrToNull = True
    end
    object LojaIBGE_UF: TFIBStringField
      FieldName = 'IBGE_UF'
      Size = 2
      EmptyStrToNull = True
    end
    object LojaIMP_PEDIDO_APOS_FATURAMENTO: TFIBStringField
      FieldName = 'IMP_PEDIDO_APOS_FATURAMENTO'
      Size = 1
      EmptyStrToNull = True
    end
    object LojaMODULO_VENDA: TFIBStringField
      DefaultExpression = #39'N'#39
      FieldName = 'MODULO_VENDA'
      Size = 1
      EmptyStrToNull = True
    end
    object LojaENVIO_EMAIL_COBRANCA: TFIBStringField
      FieldName = 'ENVIO_EMAIL_COBRANCA'
      Size = 1
      EmptyStrToNull = True
    end
    object LojaCONTA_ENVIO_BOLETO: TFIBIntegerField
      FieldName = 'CONTA_ENVIO_BOLETO'
    end
    object LojaPEDIDO_COMPRA_VDO: TFIBStringField
      FieldName = 'PEDIDO_COMPRA_VDO'
      Size = 1
      EmptyStrToNull = True
    end
    object LojaHORA_ENVIOCOBRANCA: TFIBTimeField
      FieldName = 'HORA_ENVIOCOBRANCA'
      DisplayFormat = 'hh:mm'
    end
    object LojaINF_MEC_SERVICO: TFIBStringField
      FieldName = 'INF_MEC_SERVICO'
      Size = 1
      EmptyStrToNull = True
    end
    object LojaORDEM_CONFERENCIA: TFIBStringField
      FieldName = 'ORDEM_CONFERENCIA'
      Size = 1
      EmptyStrToNull = True
    end
    object LojaTIPO_DESPESA_VENDA: TFIBIntegerField
      FieldName = 'TIPO_DESPESA_VENDA'
    end
    object LojaCICLO_FATURAMENTO: TFIBIntegerField
      FieldName = 'CICLO_FATURAMENTO'
    end
    object LojaQTDE_REGISTRO_PESQUISA: TFIBIntegerField
      FieldName = 'QTDE_REGISTRO_PESQUISA'
    end
  end
end
