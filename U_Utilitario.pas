unit U_Utilitario;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, Buttons, DB, FIBDataSet,
  pFIBDataSet, Grids, DBGrids, rxToolEdit, rxCurrEdit, Provider, COMobj,
  pFIBClientDataSet, DBClient, JvBaseDlg,  Gauges, JvProgressDialog, mxExport, wwExport,
  mxNativeExcel, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, Registry;

type
  TF_Excel = class(TForm)
    btnVendedor: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    RxLabel3: TLabel;
    txt_Loja: TEdit;
    txt_NOME_LOJA: TEdit;
    Data_InI: TDateEdit;
    Data_Fim: TDateEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Data_servidor: TpFIBDataSet;
    Data_servidorCURRENT_DATE: TFIBDateField;
    CALCULA_PRECO: TpFIBStoredProc;
    DS_EstoqueProduto: TDataSource;
    EstoqueExp: TpFIBDataSet;
    EstoqueExpPRODUTO: TFIBIntegerField;
    EstoqueExpPARTNUMBER: TFIBStringField;
    EstoqueExpCNPJFORNERCEDOR: TFIBStringField;
    EstoqueExpQUANTIDADE: TFIBBCDField;
    EstoqueExpLOCAL: TFIBStringField;
    EstoqueExpLOCACAO: TFIBStringField;
    EstoqueExpCODIGO_ORIGINAL: TFIBStringField;
    EstoqueExpCODIGO_ANTERIOR: TFIBStringField;
    Fornecedor: TpFIBDataSet;
    FornecedorCODIGO: TFIBIntegerField;
    FornecedorFANTASIA: TFIBStringField;
    FornecedorRAZAO: TFIBStringField;
    FornecedorPESSOA: TFIBStringField;
    FornecedorCNPJ: TFIBStringField;
    FornecedorINSCRICAO: TFIBStringField;
    FornecedorENDERECO: TFIBStringField;
    FornecedorNUMERO: TFIBStringField;
    FornecedorCOMPLEMENTO: TFIBStringField;
    FornecedorMUNICIPIO: TFIBStringField;
    FornecedorBAIRRO: TFIBStringField;
    FornecedorESTADO: TFIBStringField;
    FornecedorCEP: TFIBStringField;
    FornecedorTELEFONE: TFIBStringField;
    FornecedorTELEFONE2: TFIBStringField;
    FornecedorEMAIL: TFIBStringField;
    FornecedorCONTATO: TFIBStringField;
    FornecedorINICIOATIVIDADE: TFIBStringField;
    FornecedorULTIMACOMPRA: TFIBDateTimeField;
    FornecedorVALORULTIMACOMPRA: TFIBFloatField;
    Cliente: TpFIBDataSet;
    ClienteCODIGO: TFIBIntegerField;
    ClienteRAZAO: TFIBStringField;
    ClienteFANTASIA: TFIBStringField;
    ClientePESSOA: TFIBStringField;
    ClienteCNPJ: TFIBStringField;
    ClienteINSCRICAO: TFIBStringField;
    ClienteATIVOINATIVO: TFIBIntegerField;
    ClienteENDERECO: TFIBStringField;
    ClienteCOMPLEMENTO: TFIBStringField;
    ClienteNUMERO: TFIBStringField;
    ClienteBAIRRO: TFIBStringField;
    ClienteMUNICIPIO: TFIBStringField;
    ClienteESTADO: TFIBStringField;
    ClienteCEP: TFIBStringField;
    ClienteTELEFONE1: TFIBStringField;
    ClienteTELEFONE2: TFIBStringField;
    ClienteEMAIL: TFIBStringField;
    ClienteENDERECOCOBRANCA: TFIBStringField;
    ClienteCOMPLEMENTO1: TFIBStringField;
    ClienteNUMERO1: TFIBStringField;
    ClienteBAIRRO1: TFIBStringField;
    ClienteMUNICIPIO1: TFIBStringField;
    ClienteESTADO1: TFIBStringField;
    ClienteCEP1: TFIBStringField;
    ClienteTELEFONE11: TFIBStringField;
    ClienteTELEFONE21: TFIBStringField;
    ClienteEMAIL1: TFIBStringField;
    ClienteCONTATO: TFIBStringField;
    ClienteTRANSPORTADORAPADRAO: TFIBIntegerField;
    ClienteCANALCONSUMIDOR: TFIBStringField;
    ClienteVENDEDOR: TFIBIntegerField;
    ClienteINICIOATIVIDADE: TFIBDateTimeField;
    ClienteULTIMACOMPRA: TFIBDateTimeField;
    ClienteVALORULTIMACOMPRA: TFIBFloatField;
    ClienteLIMITE_CREDITO: TFIBFloatField;
    ClienteSITUACAOCREDITO: TFIBStringField;
    ClienteCONDICAOPAGAMENTO: TFIBIntegerField;
    ClienteCONTRIBUINTEICMS: TFIBStringField;
    ClienteOBSERVECAO: TFIBBlobField;
    ClienteEMAILNFE: TFIBStringField;
    ClienteVALOR_MAIOR_COMPRA: TFIBFloatField;
    ClienteCOD_GRUPO_TRIBUTO: TFIBIntegerField;
    Produto: TpFIBDataSet;
    ProdutoCODIGO: TFIBIntegerField;
    ProdutoCNPJFORNECEDOR: TFIBStringField;
    ProdutoDESCRICAO: TFIBStringField;
    ProdutoFAMILIA: TFIBStringField;
    ProdutoMARCA: TFIBIntegerField;
    ProdutoNCM: TFIBStringField;
    ProdutoUNIDMEDIDA: TFIBStringField;
    ProdutoPESO: TFIBFloatField;
    ProdutoDATACUSTO: TFIBStringField;
    ProdutoVALORCUSTO: TFIBFloatField;
    ProdutoDT_ULT_COMPRA: TFIBDateTimeField;
    ProdutoVAL_ULT_COMPRA: TFIBFloatField;
    ProdutoFORNECEDOR: TFIBIntegerField;
    ProdutoQUANTIDADEMINEMBALAGEM: TFIBStringField;
    ProdutoORIGEM: TFIBIntegerField;
    ProdutoLINHA: TFIBIntegerField;
    ProdutoDATA_CADASTRO: TFIBDateTimeField;
    ProdutoTRIBUTAIPI: TFIBFloatField;
    ProdutoGRUPO: TFIBIntegerField;
    ProdutoCOMPLEMENTO: TFIBBlobField;
    ProdutoCODIGO_CATALAGO: TFIBStringField;
    ProdutoCODIGO_ORIGINAL: TFIBStringField;
    ProdutoCODIGO_ANTERIOR: TFIBStringField;
    ProdutoSALDO: TFIBBCDField;
    clienteVendaMensal: TpFIBDataSet;
    clienteVendaMensalCODIGO: TFIBIntegerField;
    clienteVendaMensalRAZAO: TFIBStringField;
    clienteVendaMensalCNPJ: TFIBStringField;
    clienteVendaMensalMES_ANO: TFIBStringField;
    clienteVendaMensalTOTALVENDA: TFIBFloatField;
    ProdutoVendaMensal: TpFIBDataSet;
    ProdutoVendaMensalCODIGO: TFIBIntegerField;
    ProdutoVendaMensalDESCRICAO_PRODUTO: TFIBStringField;
    ProdutoVendaMensalCODIGOPECA: TFIBIntegerField;
    ProdutoVendaMensalFORNECEDOR: TFIBIntegerField;
    ProdutoVendaMensalCNPJFORNECEDOR: TFIBStringField;
    ProdutoVendaMensalMES_ANO: TFIBStringField;
    ProdutoVendaMensalQTDE_VENDIDA: TFIBFloatField;
    EstoqueProduto: TpFIBDataSet;
    EstoqueProdutoLOJA: TFIBIntegerField;
    EstoqueProdutoPRODUTO: TFIBIntegerField;
    EstoqueProdutoSALDO_GARANTIA: TFIBBCDField;
    EstoqueProdutoSALDO_INVENTARIO: TFIBBCDField;
    EstoqueProdutoSALDO_3112: TFIBBCDField;
    EstoqueProdutoSALDO: TFIBBCDField;
    EstoqueProdutoSALDO_TRANSPORTE: TFIBBCDField;
    EstoqueProdutoTESTE: TFIBBCDField;
    EstoqueProdutoINICIAL_BKP: TFIBBCDField;
    EstoqueProdutoSALDO_BALANCO: TFIBBCDField;
    EstoqueProdutoEMPRESA: TFIBIntegerField;
    EstoqueProdutoCODIGO: TFIBIntegerField;
    EstoqueProdutoCODIGO_ORIGINAL: TFIBStringField;
    EstoqueProdutoAPLICACAO: TFIBStringField;
    EstoqueProdutoDESCRICAO: TFIBStringField;
    EstoqueProdutoUNIDADE: TFIBStringField;
    EstoqueProdutoDATA_CADASTRO: TFIBDateTimeField;
    EstoqueProdutoTIPO: TFIBStringField;
    EstoqueProdutoLINHA: TFIBIntegerField;
    EstoqueProdutoEQUIVALENTE: TFIBStringField;
    EstoqueProdutoKIT: TFIBStringField;
    EstoqueProdutoPRODUTO_SERVICO: TFIBStringField;
    EstoqueProdutoLIVRO_PRECO: TFIBStringField;
    EstoqueProdutoARGUMENTO_VENDA: TFIBBlobField;
    EstoqueProdutoTIPO_PROMOCAO: TFIBIntegerField;
    EstoqueProdutoDOLAR: TFIBStringField;
    EstoqueProdutoCOD_BARRA: TFIBStringField;
    EstoqueProdutoCODIGO_CATALAGO: TFIBStringField;
    EstoqueProdutoGRUPO: TFIBIntegerField;
    EstoqueProdutoFORNECEDOR: TFIBIntegerField;
    EstoqueProdutoORIGEM: TFIBIntegerField;
    EstoqueProdutoFOTO: TFIBStringField;
    EstoqueProdutoSTATUS: TFIBIntegerField;
    EstoqueProdutoPESO: TFIBFloatField;
    EstoqueProdutoPESO_BRUTO: TFIBFloatField;
    EstoqueProdutoMETRAGEM: TFIBFloatField;
    EstoqueProdutoVENDA_S_CADASTRO: TFIBStringField;
    EstoqueProdutoINTEIRO_FRACIONARIA: TFIBStringField;
    EstoqueProdutoAPLICACAO_COMPLEMENTAR: TFIBStringField;
    EstoqueProdutoOUTRO_CODIGO: TFIBStringField;
    EstoqueProdutoCODIGO_ANTERIOR: TFIBStringField;
    EstoqueProdutoCLASS_FISCAL: TFIBStringField;
    EstoqueProdutoFOTO2: TFIBStringField;
    EstoqueProdutoFOTO3: TFIBStringField;
    EstoqueProdutoCODIGO_FOTO: TFIBIntegerField;
    EstoqueProdutoUSUARIO_CADASTRO: TFIBStringField;
    EstoqueProdutoDESCRICAO_SINTEGRA: TFIBStringField;
    EstoqueProdutoMARCA: TFIBIntegerField;
    EstoqueProdutoTIPO_ITEM: TFIBStringField;
    EstoqueProdutoCOD_ANT: TFIBIntegerField;
    EstoqueProdutoSINCRONIZADO: TFIBStringField;
    EstoqueProdutoCST_IPI: TFIBStringField;
    EstoqueProdutoCOD_ANP: TFIBStringField;
    EstoqueProdutoCOMISSAO_MECANICO: TFIBStringField;
    EstoqueProdutoNUMERO_SERIE: TFIBStringField;
    EstoqueProdutoDESCRICAO_ANP: TFIBStringField;
    EstoqueProdutoCODIGO_ML: TFIBStringField;
    EstoqueProdutoFOTO4: TFIBStringField;
    EstoqueProdutoFOTO5: TFIBStringField;
    EstoqueProdutoARGUMENTO_VENDA_RTF: TFIBStringField;
    EstoqueProdutoPERC_COMISSAO: TFIBFloatField;
    mxNativeExcel1: TmxNativeExcel;
    SaveExcel: TSaveDialog;
    Vendedor: TpFIBDataSet;
    VendedorCODIGO: TFIBIntegerField;
    VendedorNOME: TFIBStringField;
    VendedorEMAIL: TFIBStringField;
    Transportadora: TpFIBDataSet;
    TransportadoraCODIGO: TFIBIntegerField;
    TransportadoraFANTASIA: TFIBStringField;
    TransportadoraRAZAO: TFIBStringField;
    TransportadoraENDERECO: TFIBStringField;
    TransportadoraNUMERO: TFIBStringField;
    TransportadoraCOMPLEMENTO: TFIBStringField;
    TransportadoraBAIRRO: TFIBStringField;
    TransportadoraMUNICIPIO: TFIBStringField;
    TransportadoraESTADO: TFIBStringField;
    TransportadoraCEP: TFIBStringField;
    TransportadoraCNPJ: TFIBStringField;
    TransportadoraINSCRICAO: TFIBStringField;
    TransportadoraTELEFONE: TFIBStringField;
    TransportadoraTELEFONE2: TFIBStringField;
    TransportadoraEMAIL: TFIBStringField;
    TransportadoraCONTATO: TFIBStringField;
    Db: TpFIBDatabase;
    Tr_Db: TpFIBTransaction;
    Loja: TpFIBDataSet;
    LojaEMPRESA: TFIBIntegerField;
    LojaCODIGO: TFIBIntegerField;
    LojaRAZAO_SOCIAL: TFIBStringField;
    LojaNOME_FANTASIA: TFIBStringField;
    LojaPLANO_CONTAS: TFIBStringField;
    LojaNOME_ESTADO: TFIBStringField;
    LojaCONTA_DUP_PAGAR: TFIBIntegerField;
    LojaCONTA_TROCO_DEBITO: TFIBIntegerField;
    LojaCONTA_TROCO_CREDITO: TFIBIntegerField;
    LojaDESCONTO_ACERTO_DUPLICATA: TFIBStringField;
    LojaCONTA_DUP_RECEBER: TFIBIntegerField;
    LojaCGC_CPF: TFIBStringField;
    LojaENDERECO: TFIBStringField;
    LojaBAIRRO: TFIBStringField;
    LojaCEP: TFIBStringField;
    LojaINSC_ESTADUAL: TFIBStringField;
    LojaTELEFONE: TFIBStringField;
    LojaFAX: TFIBStringField;
    LojaNOME_CIDADE: TFIBStringField;
    LojaSUBSTITUTO_TRIB: TFIBStringField;
    LojaTX_COBRANCA: TFIBFloatField;
    LojaNOTA_GERA_DUPLICATA: TFIBStringField;
    LojaNUMERO_SERIE_ECF: TFIBStringField;
    LojaORDEM_PEDIDO: TFIBIntegerField;
    LojaMENSAGEM_PEDIDO: TFIBStringField;
    LojaECF_TIPO_MOV: TFIBIntegerField;
    LojaECF_VISTA: TFIBIntegerField;
    LojaECF_CARTAO: TFIBIntegerField;
    LojaECF_CHEQUE: TFIBIntegerField;
    LojaCAMINHO_DIRETORIO_TEF: TFIBStringField;
    LojaECF_VISTA_PRAZO: TFIBStringField;
    LojaIMP_SERVICO_ECF: TFIBStringField;
    LOJAIMP_BOLETO: TFIBStringField;
    LOJAIMP_BOLETOS: TFIBStringField;
    LOJATIPO_PESSOA: TFIBStringField;
    LojaOSNOTA_VDO: TFIBStringField;
    LojaMENSAGEM_NF: TFIBStringField;
    LojaCHECA_DESCONTO: TFIBStringField;
    LojaCHECA_PRECO: TFIBStringField;
    LojaESTOQUE_NEGATIVO: TFIBStringField;
    LojaDIAS_ATRASO_BLOQUEIO: TFIBIntegerField;
    LojaCHECA_VAL_CADASTRO: TFIBStringField;
    LojaCHECA_LIMITE: TFIBStringField;
    LojaDIAS_PRAZO_1: TFIBIntegerField;
    LojaDIAS_PRAZO_2: TFIBIntegerField;
    LojaDIAS_PRAZO_3: TFIBIntegerField;
    LojaDIAS_PRAZO_4: TFIBIntegerField;
    LojaCONTA_REP: TFIBIntegerField;
    LojaCURVA_A: TFIBFloatField;
    LojaCURVA_B: TFIBFloatField;
    LojaCURVA_C: TFIBFloatField;
    LojaCURVA_D: TFIBFloatField;
    LojaTX_MORA_DUP: TFIBFloatField;
    LojaTX_FIN_DIA: TFIBFloatField;
    LojaTX_FIN_MES: TFIBFloatField;
    LojaVALOR_MIN_FAT: TFIBFloatField;
    LojaVALOR_MIN_CARTAO: TFIBFloatField;
    LojaCOMISSAO_FATURADO: TFIBFloatField;
    LojaCOMISSAO_RECEBIDO: TFIBFloatField;
    LojaLOGOMARCA: TFIBStringField;
    LojaCABECALHO: TFIBStringField;
    LojaCOMPLEMENTO: TFIBStringField;
    LojaCONTATO: TFIBStringField;
    LojaEMAIL: TFIBStringField;
    LojaTIPO_MOV_REQ: TFIBIntegerField;
    LojaISENCAO_IPI: TFIBStringField;
    LojaALIQ_ISS: TFIBFloatField;
    LojaJUCEG: TFIBStringField;
    LojaIMP_MINUTA: TFIBStringField;
    LojaIMP_PROMISSORIA: TFIBStringField;
    LojaIMP_OS: TFIBStringField;
    LojaIMP_NOTA_FISCAL: TFIBStringField;
    LojaIMP_PEDIDO: TFIBStringField;
    LojaDATA_JUCEG: TFIBDateTimeField;
    LojaDIAS_VALIDAR_CADASTRO: TFIBIntegerField;
    LojaDIAS_VALIDADE_COTACAO: TFIBIntegerField;
    LojaCONFIG_REQ: TFIBBlobField;
    LojaDATA_FATURAMENTO_NF: TFIBIntegerField;
    LojaOSRECIBO_VDO: TFIBStringField;
    LojaOS_VDO: TFIBStringField;
    LojaOSDESCONTO_PRODUTO: TFIBFloatField;
    LojaOPCAO_COMISSAO: TFIBStringField;
    LojaIMP_OS_RECIBO: TFIBStringField;
    LojaOS_ACEITA_ITEMVALOR_ZERO: TFIBStringField;
    LojaOS_MOUSE: TFIBStringField;
    LojaNOTA_IMPRESSA_MANUAL: TFIBStringField;
    LojaECF_CONCOMITANTE: TFIBStringField;
    LojaOPCAO_IMPRIME_OS: TFIBIntegerField;
    LojaOPCAO_FORMULARIO: TFIBIntegerField;
    LojaIMP_REQ_COMPRA: TFIBStringField;
    LojaDESCONTO_PROMOCAO: TFIBStringField;
    LojaQTDE_ITENS_PEDIDO: TFIBIntegerField;
    LojaALTERA_PRECO_VENDA: TFIBStringField;
    LojaFOCO: TFIBIntegerField;
    LojaOSACEITA_ITEMVALOR_ZERO: TFIBStringField;
    LojaOS_TRANSP_PADRAO: TFIBIntegerField;
    LojaOS_OPC_DESCONTO: TFIBStringField;
    LojaOS_IMPRIME_RECIBO: TFIBStringField;
    LojaALTERA_CLIENTE: TFIBStringField;
    LojaRENTAB_MIN_VENDA: TFIBFloatField;
    LojaOS_TRANSP: TFIBStringField;
    LojaOPCAO_FORMULARIO_PEDIDO: TFIBIntegerField;
    LojaPESQUISA_PRODUTO_COM_IMPOSTO: TFIBStringField;
    LojaNUM_TARE: TFIBStringField;
    LojaCONTROLE_PEDIDO: TFIBStringField;
    LojaALTERA_DATA_BAIXA: TFIBStringField;
    LojaCONFIGURA_CABECALHO_PEDIDO: TFIBBlobField;
    LojaOP_COMISAO_MECANICO: TFIBStringField;
    LojaPLACA_CHASSI: TFIBStringField;
    LojaESTOQUE_LOJA: TFIBStringField;
    LojaIMP_RECIBO_OS: TFIBStringField;
    LojaLISTA_OS_RECIBO: TFIBStringField;
    LojaESTOQUE_FECHADO: TFIBStringField;
    LojaQTDE_SERVICO_PEDIDO: TFIBIntegerField;
    LojaIMP_FATURAMENTO: TFIBStringField;
    LojaQTDE_CASAS_DECIMAL: TFIBIntegerField;
    LojaTD_ATACADO_APRAZO: TFIBFloatField;
    LojaTD_ATACADO_AVISTA: TFIBFloatField;
    LojaTD_VAREJO_APRAZO: TFIBFloatField;
    LojaTD_VAREJO_AVISTA: TFIBFloatField;
    LojaTD_SERVICO: TFIBFloatField;
    LojaID_ATACADO: TFIBFloatField;
    LojaID_VAREJO: TFIBFloatField;
    LojaID_SERVICO: TFIBFloatField;
    LojaTEMPO_DESCANCO: TFIBStringField;
    LojaOFICINA: TFIBStringField;
    LojaIMPRIME_DESCONTO: TFIBStringField;
    LojaOPCAO_IMP_RECIBO_ENTREGA: TFIBStringField;
    LojaIMP_CATALOGO_COTACAO: TFIBStringField;
    LojaIMPRIME_DESCONTO_RP: TFIBStringField;
    LojaMOSTRA_ARGUMENTO_VENDA: TFIBStringField;
    LojaIMP_ZEBRA: TFIBStringField;
    LojaCHECA_PLACA_OS_ABERTA: TFIBStringField;
    LojaFATURA_ORGAO_PUBLICO: TFIBStringField;
    LojaTIPO_VENDA: TFIBIntegerField;
    LojaDESCONTO_EXTRA_FATURAMENTO: TFIBStringField;
    LojaDESCONTO_PEDIDO: TFIBStringField;
    LojaDESCONTO_ITEM: TFIBStringField;
    LojaCONTA_TROCO: TFIBIntegerField;
    LojaIMPRIME_OS_RECIBO: TFIBStringField;
    LojaOPCAO_ICMS_SIT_TRIBUTARIA: TFIBStringField;
    LojaSUBSTITUTO_TRIB_TODOS_ESTADOS: TFIBStringField;
    LojaOPCAO_REDUCAO_BASE: TFIBStringField;
    LojaTIPO_VENDA_FATURA_OS: TFIBIntegerField;
    LojaCAMINHO_CATALOGO_SERVIDOR_LINUX: TFIBStringField;
    LojaCAMINHO_CATALOGO_ESTACAO_WIN: TFIBStringField;
    LojaCNPJ_CPF_OBRIGATORIO: TFIBStringField;
    LojaCLIENTE_PARCIAL_BANCO: TFIBIntegerField;
    LojaCLIENTE_PARCIAL_STATUS: TFIBIntegerField;
    LojaCLIENTE_PARCIAL_PAGTO: TFIBIntegerField;
    LojaICMS_DIFERENCIADO_PRODUTO: TFIBStringField;
    LojaCABECALHO_ETIQUETA_ZEBRA: TFIBStringField;
    LojaALIQUOTA_PIS: TFIBFloatField;
    LojaALIQUOTA_COFINS: TFIBFloatField;
    LojaSISTEMA_TEF: TFIBIntegerField;
    LojaIMP_PADRAO_USUARIO: TFIBStringField;
    LojaPRODUTO_060_TRIBUTA_FORA_ESTADO: TFIBStringField;
    LojaIMPRIME_ITEM_NEGATIVO_RECIBO: TFIBStringField;
    LojaALTERA_PRECO_VENDIDO: TFIBIntegerField;
    LojaOPCAO_CODIGO_ECF: TFIBStringField;
    LojaVENDEDOR_VISUALIZA_VENDA_OUTRO: TFIBStringField;
    LojaNOME_EMPRESA: TFIBStringField;
    LojaGERA_CONTA_REP: TFIBStringField;
    LojaMENSAGEM_ECF: TFIBStringField;
    LojaMENSAGEM_OS: TFIBStringField;
    LojaSUPER_SIMPLES_SUBSTITUICAO: TFIBStringField;
    LojaTEF: TFIBStringField;
    LojaCRT: TFIBIntegerField;
    LojaOPCAO_FORMULARIO_COMPRA: TFIBIntegerField;
    LojaTIPO_TAXA_COBRANCA: TFIBIntegerField;
    LojaPRECO_TRANSFERENCIA: TFIBIntegerField;
    LojaREGIME_TRIBUTARIO: TFIBIntegerField;
    LojaTIPO_APURACAO_PISCOFINS: TFIBIntegerField;
    LojaOPCAO_PRODUTO_SERVICO_OS: TFIBStringField;
    LojaCAMINHO_DIRETORIO_NFSE: TFIBStringField;
    LojaREQ_VDO: TFIBStringField;
    LojaPEDIDO_VDO: TFIBStringField;
    LojaPRAZO_REQUISICAO: TFIBIntegerField;
    LojaCAMINHO_DIRETORIO_XML: TFIBStringField;
    LojaINSC_MUNICIPAL: TFIBStringField;
    LojaCODIGO_CNAE: TFIBStringField;
    LojaCODIGO_TRIB_MUNICIPIO: TFIBStringField;
    LojaMUNICIPIO_IBGE: TFIBStringField;
    LojaSEPARACAO: TFIBStringField;
    LojaNOTA_MISTA: TFIBStringField;
    LojaIMP_NFCE: TFIBStringField;
    LojaCELULAR: TFIBStringField;
    LojaIBGE_UF: TFIBStringField;
    LojaIMP_PEDIDO_APOS_FATURAMENTO: TFIBStringField;
    LojaMODULO_VENDA: TFIBStringField;
    LojaENVIO_EMAIL_COBRANCA: TFIBStringField;
    LojaCONTA_ENVIO_BOLETO: TFIBIntegerField;
    LojaPEDIDO_COMPRA_VDO: TFIBStringField;
    LojaHORA_ENVIOCOBRANCA: TFIBTimeField;
    LojaINF_MEC_SERVICO: TFIBStringField;
    LojaORDEM_CONFERENCIA: TFIBStringField;
    LojaTIPO_DESPESA_VENDA: TFIBIntegerField;
    LojaCICLO_FATURAMENTO: TFIBIntegerField;
    LojaQTDE_REGISTRO_PESQUISA: TFIBIntegerField;
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure txt_LojaExit(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Excel: TF_Excel;
  Tecla  : string;
  Estado : string;
  Data_now, dia_util: TDateTime;

implementation

{$R *.dfm}

procedure TF_Excel.Button1Click(Sender: TObject);
var
  CAMINHO: STRING;
  var FileName : String;
Begin
   inherited;

   with Cliente do
    begin
      Close;
      Open;
    end;

  if Cliente.RecordCount <> 0 then
    begin
        CAMINHO := ExtractFilePath(Application.ExeName);

        if not DirectoryExists(CAMINHO+'ExcelGerado') then
               ForceDirectories(CAMINHO+'ExcelGerado');

        CAMINHO := CAMINHO+'ExcelGerado\';

        if Application.MessageBox('Confirma a geração da planilha Cliente?','Confirmação\',mb_YesNo) = mrYes then
          begin
           Cliente.First;
             begin

               With mxNativeExcel1 Do
                 begin
                      NewFile;
                      FileName := CAMINHO+'Template_Clientes.xls';
                      ActiveFont := 0;
                      Row := 1;
                      WriteLabel( Row, 1, 'Codigo');
                      WriteLabel( Row, 2, 'Razao' );
                      WriteLabel( Row, 3, 'Fantasia' );
                      WriteLabel( Row, 4, 'Pessoa' );
                      WriteLabel( Row, 5, 'CNPJ' );
                      WriteLabel( Row, 6, 'Inscricao' );
                      WriteLabel( Row, 7, 'Ativo/Inativo' );
                      WriteLabel( Row, 8, 'Endefat' );
                      WriteLabel( Row, 9, 'Complemento' );
                      WriteLabel( Row, 10, 'NumeroFat' );
                      WriteLabel( Row, 11, 'Bairro' );
                      WriteLabel( Row, 12, 'Município' );
                      WriteLabel( Row, 13, 'Estado' );
                      WriteLabel( Row, 14, 'Cep' );
                      WriteLabel( Row, 15, 'Telefone1' );
                      WriteLabel( Row, 16, 'Telefone2' );
                      WriteLabel( Row, 17, 'Email' );
                      WriteLabel( Row, 18, 'EndeCobrança' );
                      WriteLabel( Row, 19, 'Complemento' );
                      WriteLabel( Row, 20, 'Numero' );
                      WriteLabel( Row, 21, 'Bairro');
                      WriteLabel( Row, 22, 'Município' );
                      WriteLabel( Row, 23, 'Estado' );
                      WriteLabel( Row, 24, 'Cep' );
                      WriteLabel( Row, 25, 'Telefone1' );
                      WriteLabel( Row, 26, 'Telefone2' );
                      WriteLabel( Row, 27, 'Email' );
                      WriteLabel( Row, 28, 'Contato' );
                      WriteLabel( Row, 29, 'Transportadora Padrao' );
                      WriteLabel( Row, 30, 'Canal de Consumo' );
                      WriteLabel( Row, 31, 'Vendedor' );
                      WriteLabel( Row, 32, 'Inicio Atividade' );
                      WriteLabel( Row, 33, 'Ultima Compra' );
                      WriteLabel( Row, 34, 'Valor Ultima Compra' );
                      WriteLabel( Row, 35, 'Valor da Maior Compra' );
                      WriteLabel( Row, 36, 'Limite Credito' );
                      WriteLabel( Row, 37, 'Situacao Credito' );
                      WriteLabel( Row, 38, 'Condição Pagamento' );
                      WriteLabel( Row, 39, 'Contribuinte ICMS' );
                      WriteLabel( Row, 40, 'Observacoes' );
                      WriteLabel( Row, 41, 'Grupo Tributario' );

                      Row := Row + 1;

                      While not Cliente.Eof do // LOOP NA TABELA
                      begin
                          WriteLabel( Row, 1, ClienteCODIGO.AsString);
                          WriteLabel( Row, 2, ClienteRAZAO.AsString);
                          WriteLabel( Row, 3, ClienteFANTASIA.AsString);
                          WriteLabel( Row, 4, ClientePESSOA.AsString);
                          WriteLabel( Row, 5, ClienteCNPJ.AsString);
                          WriteLabel( Row, 6, ClienteINSCRICAO.AsString);
                          WriteLabel( Row, 7, ClienteATIVOINATIVO.AsString);
                          WriteLabel( Row, 8, ClienteENDERECO.AsString);
                          WriteLabel( Row, 9, ClienteCOMPLEMENTO.AsString);
                          WriteLabel( Row, 10, ClienteNUMERO.AsString);
                          WriteLabel( Row, 11, ClienteBAIRRO.AsString);
                          WriteLabel( Row, 12, ClienteMUNICIPIO.AsString);
                          WriteLabel( Row, 13, ClienteESTADO.AsString);
                          WriteLabel( Row, 14, ClienteCEP.AsString);
                          WriteLabel( Row, 15, ClienteTELEFONE1.AsString);
                          WriteLabel( Row, 16, ClienteTELEFONE2.AsString);
                          WriteLabel( Row, 17, ClienteEMAIL.AsString);
                          WriteLabel( Row, 18, ClienteENDERECOCOBRANCA.AsString);
                          WriteLabel( Row, 19, ClienteCOMPLEMENTO.AsString);
                          WriteLabel( Row, 20, ClienteNUMERO1.AsString);
                          WriteLabel( Row, 21, ClienteBAIRRO1.AsString);
                          WriteLabel( Row, 22, ClienteMUNICIPIO1.AsString);
                          WriteLabel( Row, 23, ClienteESTADO1.AsString);
                          WriteLabel( Row, 24, ClienteCEP1.AsString);
                          WriteLabel( Row, 25, ClienteTELEFONE11.AsString);
                          WriteLabel( Row, 26, ClienteTELEFONE21.AsString);
                          WriteLabel( Row, 27, ClienteEMAIL1.AsString);
                          WriteLabel( Row, 28, ClienteCONTATO.AsString);
                          WriteLabel( Row, 29, ClienteTRANSPORTADORAPADRAO.AsString);
                          WriteLabel( Row, 30, ClienteCANALCONSUMIDOR.AsString);
                          WriteLabel( Row, 31, ClienteVENDEDOR.AsString);
                          WriteLabel( Row, 32, ClienteINICIOATIVIDADE.AsString);
                          WriteLabel( Row, 33, ClienteULTIMACOMPRA.AsString);
                          WriteLabel( Row, 34, ClienteVALORULTIMACOMPRA.AsString);
                          WriteLabel( Row, 35, ClienteVALOR_MAIOR_COMPRA.AsString);
                          WriteLabel( Row, 36, ClienteLIMITE_CREDITO.AsString);
                          WriteLabel( Row, 37, ClienteSITUACAOCREDITO.AsString);
                          WriteLabel( Row, 38, ClienteCONDICAOPAGAMENTO.AsString);
                          WriteLabel( Row, 39, ClienteCONTRIBUINTEICMS.AsString);
                          WriteLabel( Row, 40, ClienteOBSERVECAO.AsString);
                          WriteLabel( Row, 41, ClienteCOD_GRUPO_TRIBUTO.AsString);

                          Cliente.Next;
                          Row := Row + 1;
                      end;

                   CloseFile;
                   SaveToFile;

                   Application.MessageBox(PChar('Planilha' + ' Template_Clientes.xls' + ' gerada. Local do Arquivo ' + caminho),'Aviso\',mb_Ok);
                 end;

             end;
          end;
    end
  else
    begin
      ShowMessage('Atenção! Não Existe dados para ser Exportado!');
    end;
End;

procedure TF_Excel.Button2Click(Sender: TObject);
var
  CAMINHO: STRING;
  var FileName : String;
Begin
   inherited;

   if txt_Loja.Text = '' then
    begin
      ShowMessage('Atenção! É necessário informar a Loja.');
      txt_Loja.SetFocus;
      Abort;
    end;

    if (Data_InI.Text = '  /  /    ') or (Data_Fim.Text = '  /  /    ') then
    begin
      showmessage('Atenção! O período deve ser informado!');
      Data_InI.SetFocus;
      abort;
    end;

   with clienteVendaMensal do
    begin
      Close;
      ParamByName('cod_loja').AsInteger := StrToInt(txt_Loja.text);
      ParamByName('data_ini').AsDate := Data_InI.Date;
      ParamByName('data_fim').AsDate := Data_Fim.Date;
      Open;
    end;

  if clienteVendaMensal.RecordCount <> 0 then
    begin
        CAMINHO := ExtractFilePath(Application.ExeName);

        if not DirectoryExists(CAMINHO+'ExcelGerado') then
               ForceDirectories(CAMINHO+'ExcelGerado');

        CAMINHO := CAMINHO+'ExcelGerado\';

        if Application.MessageBox('Confirma a geração da planilha Quantidade Cliente Venda Mensal?','Confirmação\',mb_YesNo) = mrYes then
          begin
           clienteVendaMensal.First;
             begin

               With mxNativeExcel1 Do
                 begin
                      NewFile;
                      FileName := CAMINHO+'Template_Clientes_VendasMensal.xls';
                      ActiveFont := 0;
                      Row := 1;
                      WriteLabel( Row, 1, 'Codigo');
                      WriteLabel( Row, 2, 'Razao Social' );
                      WriteLabel( Row, 3, 'CNPJ' );
                      WriteLabel( Row, 4, 'Mes_Ano' );
                      WriteLabel( Row, 5, 'Total Venda' );

                      Row := Row + 1;

                      While not clienteVendaMensal.Eof do // LOOP NA TABELA
                      begin
                          WriteLabel( Row, 1, clienteVendaMensalCODIGO.AsString);
                          WriteLabel( Row, 2, clienteVendaMensalRAZAO.AsString);
                          WriteLabel( Row, 3, clienteVendaMensalCNPJ.AsString);
                          WriteLabel( Row, 4, clienteVendaMensalMES_ANO.AsString);
                          WriteLabel( Row, 5, clienteVendaMensalTOTALVENDA.AsString);

                          clienteVendaMensal.Next;
                          Row := Row + 1;
                      end;

                   CloseFile;
                   SaveToFile;

                   Button2.Enabled := False;
                   Application.MessageBox(PChar('Planilha' + ' Template_Clientes_VendasMensal.xls' + ' gerada. Local do Arquivo ' + caminho),'Aviso\',mb_Ok);
                 end;

             end;
          end;
    end
  else
    begin
      ShowMessage('Atenção! Não Existe dados para ser Exportado!');
    end;
End;

procedure TF_Excel.Button3Click(Sender: TObject);
var
  CAMINHO: STRING;
  var FileName : String;
Begin
   inherited;

   if txt_Loja.Text = '' then
    begin
      ShowMessage('Atenção! É necessário informar a Loja.');
      txt_Loja.SetFocus;
      Abort;
    end;

   with EstoqueExp do
    begin
      Close;
      ParamByName('loja').AsInteger := StrToInt(txt_Loja.text);
      Open;
    end;

  if EstoqueExp.RecordCount <> 0 then
    begin
        CAMINHO := ExtractFilePath(Application.ExeName);

        if not DirectoryExists(CAMINHO+'ExcelGerado') then
               ForceDirectories(CAMINHO+'ExcelGerado');

        CAMINHO := CAMINHO+'ExcelGerado\';

        if Application.MessageBox('Confirma a geração da planilha Estoque?','Confirmação\',mb_YesNo) = mrYes then
          begin
           EstoqueExp.First;
             begin

               With mxNativeExcel1 Do
                 begin
                      NewFile;
                      FileName := CAMINHO+'Template_Estoque.xls';
                      ActiveFont := 0;
                      Row := 1;
                      WriteLabel( Row, 1, 'Código');
                      WriteLabel( Row, 2, 'Part Number' );
                      WriteLabel( Row, 3, 'Cnpj Fornecedor' );
                      WriteLabel( Row, 4, 'quantidade' );
                      WriteLabel( Row, 5, 'Local' );
                      WriteLabel( Row, 6, 'locacao' );
                      WriteLabel( Row, 7, 'Original' );
                      WriteLabel( Row, 8, 'Codigo Anterior' );

                      Row := Row + 1;

                      While not EstoqueExp.Eof do // LOOP NA TABELA
                      begin
                          WriteLabel( Row, 1, EstoqueExpProduto.AsString);
                          WriteLabel( Row, 2, EstoqueExpPARTNUMBER.AsString);
                          WriteLabel( Row, 3, EstoqueExpCNPJFORNERCEDOR.AsString);
                          WriteLabel( Row, 4, EstoqueExpQUANTIDADE.AsString);
                          WriteLabel( Row, 5, EstoqueExpLOCAL.AsString);
                          WriteLabel( Row, 6, EstoqueExpLOCACAO.AsString);
                          WriteLabel( Row, 7, EstoqueExpCODIGO_ORIGINAL.AsString);
                          WriteLabel( Row, 8, EstoqueExpCODIGO_ANTERIOR.AsString);
                          EstoqueExp.Next;
                          Row := Row + 1;
                      end;

                   CloseFile;
                   SaveToFile;

                   Application.MessageBox(PChar('Planilha' + ' Template_Estoque.xls' + ' gerada. Local do Arquivo ' + caminho),'Aviso\',mb_Ok);
                 end;

             end;
          end;
    end
  else
    begin
      ShowMessage('Atenção! Não Existe dados para ser Exportado!');
    end;
End;
procedure TF_Excel.Button4Click(Sender: TObject);
var
  CAMINHO: STRING;
  var FileName : String;
Begin
   inherited;

    if txt_Loja.Text = '' then
      begin
        ShowMessage('Atenção! É necessário informar a Loja.');
        txt_Loja.SetFocus;
        Abort;
      end;

   with Produto do
    begin
      Close;
      Open;
    end;

  if Produto.RecordCount <> 0 then
    begin
        CAMINHO := ExtractFilePath(Application.ExeName);

        if not DirectoryExists(CAMINHO+'ExcelGerado') then
               ForceDirectories(CAMINHO+'ExcelGerado');

        CAMINHO := CAMINHO+'ExcelGerado\';

        if Application.MessageBox('Confirma a geração da planilha Produto. ?','Confirmação\',mb_YesNo) = mrYes then
          begin
           Produto.First;
             begin

               With mxNativeExcel1 Do
                 begin
                      NewFile;
                      FileName := CAMINHO+'Template_Produto.xls';
                      ActiveFont := 0;
                      Row := 1;
                      WriteLabel( Row, 1, 'Código');
                      WriteLabel( Row, 2, 'Part Number');
                      WriteLabel( Row, 3, 'CNPJ Fornecedor' );
                      WriteLabel( Row, 4, 'Descricao' );
                      WriteLabel( Row, 5, 'Família' );
                      WriteLabel( Row, 6, 'Marca' );
                      WriteLabel( Row, 7, 'NCM' );
                      WriteLabel( Row, 8, 'Unid Medica' );
                      WriteLabel( Row, 9, 'Peso' );
                      WriteLabel( Row, 10, 'Data Custo' );
                      WriteLabel( Row, 11, 'Valor Custo' );
                      WriteLabel( Row, 12, 'PrecoVendaAtacado' );
                      WriteLabel( Row, 13, 'PrecoVendaVareja' );
                      WriteLabel( Row, 14, 'DataUltCompra' );
                      WriteLabel( Row, 15, 'ValorUltCompra' );
                      WriteLabel( Row, 16, 'FornecedorUltCompra' );
                      WriteLabel( Row, 17, 'Quantidade Mínima por Embalagem' );
                      WriteLabel( Row, 18, 'Origem' );
                      WriteLabel( Row, 19, 'Linha' );
                      WriteLabel( Row, 20, 'Data Inclusao' );
                      WriteLabel( Row, 21, 'Tributacao IPI' );
                      WriteLabel( Row, 22, 'GrupoProduto' );
                      WriteLabel( Row, 23, 'Complemento' );
                      WriteLabel( Row, 24, 'Original' );
                      WriteLabel( Row, 25, 'Codigo Anterior' );
                      WriteLabel( Row, 26, 'Saldo' );

                      Row := Row + 1;

                      While not Produto.Eof do // LOOP NA TABELA
                      begin
                          WriteLabel( Row, 1, ProdutoCODIGO.AsString);
                          WriteLabel( Row, 2, ProdutoCODIGO_CATALAGO.AsString);
                          WriteLabel( Row, 3, ProdutoCNPJFORNECEDOR.AsString);
                          WriteLabel( Row, 4, ProdutoDESCRICAO.AsString);
                          WriteLabel( Row, 5, ProdutoFAMILIA.AsString);
                          WriteLabel( Row, 6, ProdutoMARCA.AsString);
                          WriteLabel( Row, 7, ProdutoNCM.AsString);
                          WriteLabel( Row, 8, ProdutoUNIDMEDIDA.AsString);
                          WriteLabel( Row, 9, ProdutoPESO.AsString);
                          WriteLabel( Row, 10, ProdutoDATACUSTO.AsString);
                          WriteLabel( Row, 11, ProdutoVALORCUSTO.AsString);

                          Calcula_Preco.Params[0].AsInteger := LojaEMPRESA.Value;
                          Calcula_preco.Params[1].AsInteger := ProdutoCODIGO.Value;
                          Calcula_preco.Params[2].AsInteger := LojaCODIGO.Value;
                          Calcula_preco.Params[3].AsInteger := 0;
                          Calcula_preco.Params[4].AsString := 'N';
                          Calcula_Preco.Params[5].AsString := 'N';
                          Calcula_preco.ExecProc;


                          WriteLabel( Row, 12, Calcula_Preco.FieldByName('PRECO_ATACADO').AsString);
                          WriteLabel( Row, 13, Calcula_Preco.FieldByName('PRECO_CHEIO').AsString);
                          WriteLabel( Row, 14, ProdutoDT_ULT_COMPRA.AsString);
                          WriteLabel( Row, 15, ProdutoVAL_ULT_COMPRA.AsString);
                          WriteLabel( Row, 16, ProdutoFORNECEDOR.AsString);
                          WriteLabel( Row, 17, ProdutoQUANTIDADEMINEMBALAGEM.AsString);
                          WriteLabel( Row, 18, ProdutoORIGEM.AsString);
                          WriteLabel( Row, 19, ProdutoLINHA.AsString);
                          WriteLabel( Row, 20, ProdutoDATA_CADASTRO.AsString);
                          WriteLabel( Row, 21, ProdutoTRIBUTAIPI.AsString);
                          WriteLabel( Row, 22, ProdutoGRUPO.AsString);
                          WriteLabel( Row, 23, ProdutoCOMPLEMENTO.AsString);
                          WriteLabel( Row, 24, ProdutoCODIGO_ORIGINAL.AsString);
                          WriteLabel( Row, 25, ProdutoCODIGO_ANTERIOR.AsString);
                          WriteLabel( Row, 26, ProdutoSALDO.AsString);
                          Produto.Next;
                          Row := Row + 1;
                      end;

                   CloseFile;
                   SaveToFile;
                   Button4.Enabled := False;
                   Application.MessageBox(PChar('Planilha' + ' Template_Produto.xls' + ' gerada. Local do Arquivo ' + caminho),'Aviso\',mb_Ok);
                 end;

             end;
          end;
    end
  else
    begin
      ShowMessage('Atenção! Não Existe dados para ser Exportado!');
    end;
End;
procedure TF_Excel.Button5Click(Sender: TObject);
var
  CAMINHO: STRING;
  var FileName : String;
Begin
   inherited;

   with Fornecedor do
    begin
      Close;
      Open;
    end;

  if Fornecedor.RecordCount <> 0 then
    begin
        CAMINHO := ExtractFilePath(Application.ExeName);

        if not DirectoryExists(CAMINHO+'ExcelGerado') then
               ForceDirectories(CAMINHO+'ExcelGerado');

        CAMINHO := CAMINHO+'ExcelGerado\';

        if Application.MessageBox('Confirma a geração da planilha Fornecedor?','Confirmação\',mb_YesNo) = mrYes then
          begin
           Fornecedor.First;
             begin

               With mxNativeExcel1 Do
                 begin
                      NewFile;
                      FileName := CAMINHO+'Template_Fornecedor.xls';
                      ActiveFont := 0;
                      Row := 1;
                      WriteLabel( Row, 1, 'Codigo');
                      WriteLabel( Row, 2, 'Fantasia' );
                      WriteLabel( Row, 3, 'Razao' );
                      WriteLabel( Row, 4, 'Pessoa' );
                      WriteLabel( Row, 5, 'CNPJ' );
                      WriteLabel( Row, 6, 'Inscricao' );
                      WriteLabel( Row, 7, 'Endereco' );
                      WriteLabel( Row, 8, 'Numero' );
                      WriteLabel( Row, 9, 'Complemento' );
                      WriteLabel( Row, 10, 'Municipio' );
                      WriteLabel( Row, 11, 'Bairro' );
                      WriteLabel( Row, 12, 'Estado' );
                      WriteLabel( Row, 13, 'Cep' );
                      WriteLabel( Row, 14, 'Telefone' );
                      WriteLabel( Row, 15, 'Telefone2' );
                      WriteLabel( Row, 16, 'Email' );
                      WriteLabel( Row, 17, 'Contato' );
                      WriteLabel( Row, 18, 'InicioAtividade' );
                      WriteLabel( Row, 19, 'UltimaCompra' );
                      WriteLabel( Row, 20, 'ValorUltimacompra' );

                      Row := Row + 1;

                      While not Fornecedor.Eof do // LOOP NA TABELA
                      begin
                          WriteLabel( Row, 1, FornecedorCODIGO.AsString);
                          WriteLabel( Row, 2, FornecedorFANTASIA.AsString);
                          WriteLabel( Row, 3, FornecedorRAZAO.AsString);
                          WriteLabel( Row, 4, FornecedorPESSOA.AsString);
                          WriteLabel( Row, 5, FornecedorCNPJ.AsString);
                          WriteLabel( Row, 6, FornecedorINSCRICAO.AsString);
                          WriteLabel( Row, 7, FornecedorENDERECO.AsString);
                          WriteLabel( Row, 8, FornecedorNUMERO.AsString);
                          WriteLabel( Row, 9, FornecedorCOMPLEMENTO.AsString);
                          WriteLabel( Row, 10, FornecedorMUNICIPIO.AsString);
                          WriteLabel( Row, 11, FornecedorBAIRRO.AsString);
                          WriteLabel( Row, 12, FornecedorESTADO.AsString);
                          WriteLabel( Row, 13, FornecedorCEP.AsString);
                          WriteLabel( Row, 14, FornecedorTELEFONE.AsString);
                          WriteLabel( Row, 15, FornecedorTELEFONE2.AsString);
                          WriteLabel( Row, 16, FornecedorEMAIL.AsString);
                          WriteLabel( Row, 17, FornecedorCONTATO.AsString);
                          WriteLabel( Row, 18, FornecedorINICIOATIVIDADE.AsString);
                          WriteLabel( Row, 19, FornecedorULTIMACOMPRA.AsString);
                          WriteLabel( Row, 20, FornecedorVALORULTIMACOMPRA.AsString);
                          Fornecedor.Next;
                          Row := Row + 1;
                      end;

                   CloseFile;
                   SaveToFile;

                   Application.MessageBox(PChar('Planilha' + ' Template_Fornecedor.xls' + ' gerada. Local do Arquivo ' + caminho),'Aviso\',mb_Ok);
                 end;

             end;
          end;
    end
  else
    begin
      ShowMessage('Atenção! Não Existe dados para ser Exportado!');
    end;
End;
procedure TF_Excel.Button6Click(Sender: TObject);
var
  CAMINHO: STRING;
  var FileName : String;
Begin
   inherited;

   if txt_Loja.Text = '' then
    begin
      ShowMessage('Atenção! É necessário informar a Loja.');
      txt_Loja.SetFocus;
      Abort;
    end;

    if (Data_InI.Text = '  /  /    ') or (Data_Fim.Text = '  /  /    ') then
    begin
      showmessage('Atenção! O período deve ser informado!');
      Data_InI.SetFocus;
      abort;
    end;

   with ProdutoVendaMensal do
    begin
      Close;
      ParamByName('cod_loja').AsInteger := StrToInt(txt_Loja.text);
      ParamByName('data_ini').AsDate := Data_InI.Date;
      ParamByName('data_fim').AsDate := Data_Fim.Date;
      Open;
    end;

  if ProdutoVendaMensal.RecordCount <> 0 then
    begin
        CAMINHO := ExtractFilePath(Application.ExeName);

        if not DirectoryExists(CAMINHO+'ExcelGerado') then
               ForceDirectories(CAMINHO+'ExcelGerado');

        CAMINHO := CAMINHO+'ExcelGerado\';

        if Application.MessageBox('Confirma a geração da planilha Quantidade Produto Vendas Mensal?','Confirmação\',mb_YesNo) = mrYes then
          begin
           ProdutoVendaMensal.First;
             begin

               With mxNativeExcel1 Do
                 begin
                      NewFile;
                      FileName := CAMINHO+'Template_Produto_QuantidadeVendasMensal.xls';
                      ActiveFont := 0;
                      Row := 1;
                      WriteLabel( Row, 1, 'Codigo');
                      WriteLabel( Row, 2, 'Descricao' );
                      WriteLabel( Row, 3, 'Codigo Peca' );
                      WriteLabel( Row, 4, 'Fornecedor' );
                      WriteLabel( Row, 5, 'Cnpj Fornecedor' );
                      WriteLabel( Row, 6, 'Mes_Ano' );
                      WriteLabel( Row, 7, 'Qtde Vendida' );

                      Row := Row + 1;

                      While not ProdutoVendaMensal.Eof do // LOOP NA TABELA
                      begin
                          WriteLabel( Row, 1, ProdutoVendaMensalCODIGO.AsString);
                          WriteLabel( Row, 2, ProdutoVendaMensalDESCRICAO_PRODUTO.AsString);
                          WriteLabel( Row, 3, ProdutoVendaMensalCODIGOPECA.AsString);
                          WriteLabel( Row, 4, ProdutoVendaMensalFORNECEDOR.AsString);
                          WriteLabel( Row, 5, ProdutoVendaMensalCNPJFORNECEDOR.AsString);
                          WriteLabel( Row, 6, ProdutoVendaMensalMES_ANO.AsString);
                          WriteLabel( Row, 7, ProdutoVendaMensalQTDE_VENDIDA.AsString);

                          ProdutoVendaMensal.Next;
                          Row := Row + 1;
                      end;

                   CloseFile;
                   SaveToFile;

                   Button6.Enabled := False;
                   Application.MessageBox(PChar('Planilha' + ' Template_Produto_QuantidadeVendasMensal.xls' + ' gerada. Local do Arquivo ' + caminho),'Aviso\',mb_Ok);
                 end;

             end;
          end;
    end
  else
    begin
      ShowMessage('Atenção! Não Existe dados para ser Exportado!');
    end;
End;
procedure TF_Excel.Button7Click(Sender: TObject);
var
  CAMINHO: STRING;
  var FileName : String;
Begin
   inherited;

   with Transportadora do
    begin
      Close;
      Open;
    end;

  if Transportadora.RecordCount <> 0 then
    begin
        CAMINHO := ExtractFilePath(Application.ExeName);

        if not DirectoryExists(CAMINHO+'ExcelGerado') then
               ForceDirectories(CAMINHO+'ExcelGerado');

        CAMINHO := CAMINHO+'ExcelGerado\';

        if Application.MessageBox('Confirma a geração da planilha Transportadora?','Confirmação\',mb_YesNo) = mrYes then
          begin
           Transportadora.First;
             begin

               With mxNativeExcel1 Do
                 begin
                      NewFile;
                      FileName := CAMINHO+'Template_Trasnportadora.xls';
                      ActiveFont := 0;
                      Row := 1;
                      WriteLabel( Row, 1, 'Codigo');
                      WriteLabel( Row, 2, 'Fantasia' );
                      WriteLabel( Row, 3, 'Razao' );
                      WriteLabel( Row, 4, 'Endereco' );
                      WriteLabel( Row, 5, 'Numero' );
                      WriteLabel( Row, 6, 'Complemento' );
                      WriteLabel( Row, 7, 'Bairro' );
                      WriteLabel( Row, 8, 'Municipio' );
                      WriteLabel( Row, 9, 'Estado' );
                      WriteLabel( Row, 10, 'CEP' );
                      WriteLabel( Row, 11, 'CNPJ' );
                      WriteLabel( Row, 12, 'Inscricao' );
                      WriteLabel( Row, 13, 'Telefone' );
                      WriteLabel( Row, 14, 'Telefone2' );
                      WriteLabel( Row, 15, 'Email' );
                      WriteLabel( Row, 16, 'Contato' );
                      Row := Row + 1;

                      While not Transportadora.Eof do // LOOP NA TABELA
                      begin
                          WriteLabel( Row, 1, TransportadoraCODIGO.AsString);
                          WriteLabel( Row, 2, TransportadoraFANTASIA.AsString);
                          WriteLabel( Row, 3, TransportadoraRAZAO.AsString);
                          WriteLabel( Row, 4, TransportadoraENDERECO.AsString);
                          WriteLabel( Row, 5, TransportadoraNUMERO.AsString);
                          WriteLabel( Row, 6, TransportadoraCOMPLEMENTO.AsString);
                          WriteLabel( Row, 7, TransportadoraBAIRRO.AsString);
                          WriteLabel( Row, 8, TransportadoraMUNICIPIO.AsString);
                          WriteLabel( Row, 9, TransportadoraESTADO.AsString);
                          WriteLabel( Row, 10, TransportadoraCEP.AsString);
                          WriteLabel( Row, 11, TransportadoraCNPJ.AsString);
                          WriteLabel( Row, 12, TransportadoraINSCRICAO.AsString);
                          WriteLabel( Row, 13, TransportadoraTELEFONE.AsString);
                          WriteLabel( Row, 14, TransportadoraTELEFONE2.AsString);
                          WriteLabel( Row, 15, TransportadoraEMAIL.AsString);
                          WriteLabel( Row, 16, TransportadoraCONTATO.AsString);
                          Transportadora.Next;
                          Row := Row + 1;
                      end;

                   CloseFile;
                   SaveToFile;

                   Application.MessageBox(PChar('Planilha' + ' Template_Vendedor.xls' + ' gerada. Local do Arquivo ' + caminho),'Aviso\',mb_Ok);
                 end;

             end;
          end;
    end
  else
    begin
      ShowMessage('Atenção! Não Existe dados para ser Exportado!');
    end;
End;
procedure TF_Excel.Button8Click(Sender: TObject);
var
  PLANILHA : Variant;
  Linha : Integer;
  CAMINHO: STRING;
  var FileName : String;
Begin
   inherited;

   with Vendedor do
    begin
      Close;
      Open;
    end;

  if Vendedor.RecordCount <> 0 then
    begin
       //DBGridExport.DataSource := DS_Vendedor;

        CAMINHO := ExtractFilePath(Application.ExeName);

        if not DirectoryExists(caminho+'ExcelGerado') then
               ForceDirectories(caminho+'ExcelGerado');

        CAMINHO := caminho+'ExcelGerado\';

        if Application.MessageBox('Confirma a geração da planilha Vendedor?','Confirmação\',mb_YesNo) = mrYes then
          begin
          Vendedor.First;
             begin

               With mxNativeExcel1 Do
                 begin
                      NewFile;
                      FileName := CAMINHO+'Template_Vendedor.xls';
                      //AddFont( Button8.Font );
                      ActiveFont := 0;
                      Row := 1;
                      WriteLabel( Row, 1, 'Código');
                      WriteLabel( Row, 2, 'Nome' );
                      WriteLabel( Row, 3, 'Email' );
                      Row := Row + 1;

                      While not Vendedor.Eof do // LOOP NA TABELA
                      begin
                          WriteLabel( Row, 1, VendedorCODIGO.AsString);
                          WriteLabel( Row, 2, VendedorNOME.AsString);
                          WriteLabel( Row, 3, VendedorEMAIL.AsString);
                          Vendedor.Next;
                          Row := Row + 1;
                      end;

                   CloseFile;
                   SaveToFile;

                   Application.MessageBox(PChar('Planilha' + ' Template_Vendedor.xls' + ' gerada. Local do Arquivo ' + caminho),'Aviso\',mb_Ok);
                 end;

             end;
          end;

       {Linha :=2;
       PLANILHA := CreateOleObject('Excel.Application');
       PLANILHA.Caption := 'Template_Vendedor';
       PLANILHA.Visible := False;
       PLANILHA.WorkBooks.add(1);

                // TITULO DAS COLUNAS
       PLANILHA.Cells[1,1] := 'Código';
       PLANILHA.Cells[1,2] := 'Nome';
       PLANILHA.Cells[1,3] := 'Email';

       Vendedor.DisableControls;

     // PRRENCHIMENTO DAS CÉLULAS COM OS VALORES DOS CAMPOS DA TABELA
       Try
          While not Vendedor.Eof do
          Begin
             PLANILHA.Cells[Linha,1] := VendedorCODIGO.Value;
             PLANILHA.Cells[linha,2] := VendedorNOME.Value;
             PLANILHA.Cells[Linha,3] := VendedorEMAIL.Value;

             Linha := Linha + 1;
             Vendedor.Next;
          End;
           PLANILHA.Columns.AutoFit;



           PLANILHA.SaveAs(CAMINHO+'Template_Vendedor.xls');
           PLANILHA.Visible := True;

       Finally
          Vendedor.EnableControls;
          PLANILHA := Unassigned;
       end; // TRY
            }
    end
  else
   begin
     ShowMessage('Atenção! Não existe dados para ser exportado');
   end;
End;

function TS_IsRemoteSession: boolean;
const
    sm_RemoteSession = $1000;
begin
    result  :=  GetSystemMetrics(sm_RemoteSession)  <>  0;
end;

// Remove caracteres de uma string deixando apenas numeros
function RemoveCaracteres(Const texto: String): String;
var
  I: Integer;
  s: string;
begin
  s := '';
  for I := 1 To Length(texto) Do
  begin
    if (texto[I] in ['0' .. '9']) then
    begin
      s := s + Copy(texto, I, 1);
    end;
  end;
  Result := s;
end;

procedure TF_Excel.FormCreate(Sender: TObject);
var
  Registro: TRegistry;
  Pnl     : TPanel;
  var_Server, var_Porta, var_Db : string;
  sPos: Integer;
begin
  DB.Connected               := False;

  Registro := TRegistry.Create;

  try
    if Registro.OpenKey('\Software\Desenvol\Aplicativo', False) then
        begin
              if TS_IsRemoteSession = False then
                  begin
                      if RemoveCaracteres ( Registro.ReadString('Server') ) = '' then
                          begin
                                                          (*
                                // Criando o Panel e o Label
                                                             Pnl             := TPanel.Create(MainForm);
                                                             Pnl.Parent      := MainForm;
                                                             Pnl.width       := 600;
                                                             Pnl.Height      := 50;
                                                             Pnl.Font.Size   := 12;
                                                             Pnl.Color       := $00E9E9E9;
                                                             Pnl.Font.Color  := clRed;
                                                             Pnl.Font.Style  := [fsBold];
                                                             Pnl.Top         := 216; //round(Pnl.Height / 2);
                                                             Pnl.Left        := round(MainForm.width / 2) - round(Pnl.width / 2);
                                                             Pnl.caption     := 'Atenção. É necessário Informar IP válido para conexão !';
                                                             Application.ProcessMessages;
                                                             Sleep(4000);
                                                             Pnl.free;
                                                             Halt(0);
                             *)
                          end
                      else
                        begin
                          var_Server   :=  Registro.ReadString('Server');
                          sPos         :=  Pos('/', var_Server);
                          var_Server   :=  copy(var_Server,1, sPos-1);

                          if var_server = '' then
                            begin
                               var_Porta := '3050:';
                               var_server := Registro.ReadString('Server');
                               var_Db       :=  Registro.ReadString('DatabaseName');
                               DB.DBName                     := var_Server + '/' + var_Porta + Registro.ReadString('DatabaseName');

                            end
                          else
                            begin
                              DB.DBName                     := Registro.ReadString('Server') + ':' + Registro.ReadString('DatabaseName');

                            end;

                        end;
                  end
              else
                begin
                    DB.DBName                     := Registro.ReadString('Server') + ':' + Registro.ReadString('DatabaseName');
                end;

        end
    else
      begin
          // Criando o Panel e o Label
                  (*
            Pnl             := TPanel.Create(MainForm);
                     Pnl.Parent      := MainForm;
                     Pnl.width       := 600;
                     Pnl.Height      := 50;
                     Pnl.Font.Size   := 12;
                     Pnl.Color       := $00E9E9E9;
                     Pnl.Font.Color  := clRed;
                     Pnl.Font.Style  := [fsBold];
                     Pnl.Top         := 216;
                     Pnl.Left        := round(MainForm.width / 2) - round(Pnl.width / 2);
                     Pnl.caption     := 'Atenção. É necessário fazer a configuração do Banco de dados';
                     Application.ProcessMessages;
                     Sleep(4000);
                     Pnl.free;
                     Halt(0);
         *)
      end;
  finally
    Registro.CloseKey;
    Registro.Free;
  end;

  Registro := nil;

  with DB do
  begin
    Connected   := true;
  end;

  With Tr_Db do
  begin
    Active := True;
  end;

end;

procedure TF_Excel.FormKeyPress(Sender: TObject; var Key: Char);
begin
 Case Key of
    '-':
      Key := #0;
    '+':
      Key := #0;
    #13:
      begin
        Tecla := 'ENTER';
        Key := #0;
        perform(WM_NextDlgCtl, 0, 0);
      end;
    #27:
      begin
        Tecla := 'ESC';
        Key := #0;
        perform(WM_NextDlgCtl, 1, 0);
      end;
  end;

  if not (Key in ['0'..'9', '.', ',', #8, #13]) then
    Key := #0;

  if Key in [',', '.'] then
    Key := DecimalSeparator;

  if Key = DecimalSeparator then
    if pos(Key, TEdit(Sender).Text) <> 0 then
      Key := #0;

  if (Key in ['0'..'9']) then
  begin
    if TEdit(Sender).SelStart > pos(DecimalSeparator, TEdit(Sender).Text) - 1 then
      if pos(DecimalSeparator, TEdit(Sender).Text) <> 0 then // jía digitou a vírgula
        if length(TEdit(Sender).Text) > pos(DecimalSeparator, TEdit(Sender).Text) + 1 then
          Key := #0;
  end;
end;

procedure TF_Excel.txt_LojaExit(Sender: TObject);
begin
  if txt_Loja.Text <> '' then
    begin
      with Loja do
      begin
        Close;
        ParamByName('Codigo').AsInteger := StrToInt(txt_Loja.text);
        Open;
      end;

      If Loja.RecordCount = 0 then
      begin
        showmessage('Atenção! Loja não cadastrada!');
        txt_Loja.SetFocus;
        exit;
      end
      else
      begin
        txt_NOME_LOJA.Text  := LojaRAZAO_SOCIAL.Value;
        Button6.Enabled := True;
        Button4.Enabled := True;
        Button3.Enabled := True;
        Button2.Enabled := True;
      end;
    end;
end;

end.
