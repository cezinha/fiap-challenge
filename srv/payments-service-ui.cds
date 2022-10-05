using PaymentsService from './payments-service';

annotate PaymentsService.Pagamentos with {
  noPagamento @title : 'Nº Pagto.';
  empresa @title : 'Empresa';
  cnpj @title : 'CNPJ';
  nomeEmpresa @title : 'Nome da Empresa';
  status @title : 'Status';
  dataVencimento @title : 'Data Venc.';
  dataPagamento @title : 'Data Pgto.';
  eParcelado @title : 'É parcelado?';
  parcelas @title : 'Nº da Parcela';
  valorParcelaFmt @title : 'Valor Parcela';
  valorPagamentoFmt @title : 'Valor Pagto.';
  aprovadoPor @title : 'Aprovado por';
  agencia @title : 'agencia';
  conta @title : 'conta';
  digito @title : 'digito';
};

// annotate PaymentsService.Pagamentos with @(
//     Capabilities.UpdateRestrictions : {
//         Updatable : valido
//     }
// );

annotate PaymentsService.Pagamentos with @(
  UI: {
    UpdateHidden: false,
    CreateHidden: false,
		HeaderInfo: {
      Initials: cnpj,
			TypeName: 'Pagamento',
			TypeNamePlural: 'Pagamentos',
      Title : {
          $Type : 'UI.DataField',
          Label : 'Empresa',
          Value : empresa,
      },
      Description: {
          $Type : 'UI.DataField',
          Label : 'Nº Pagto.',
          Value : noPagamento,
      }
    },
    SelectionFields : [
      dataVencimento
    ],
    LineItem : [
      {
          $Type : 'UI.DataField',
          Value : noPagamento,
          ![@UI.Importance] : #High
      },
      {
          $Type : 'UI.DataField',
          Value : empresa,
          ![@UI.Importance] : #High
      },
      {
          $Type : 'UI.DataField',
          Value : status,
          Criticality : criticality,
          ![@UI.Importance] : #High
      },
      {
          $Type : 'UI.DataField',
          Value : dataPagamento,
          ![@UI.Importance] : #High
      },
      {
          $Type : 'UI.DataField',
          Value : dataVencimento,
          ![@UI.Importance] : #High
      },
      {
          $Type : 'UI.DataField',
          Value : valorPagamentoFmt,
          ![@UI.Importance] : #High
      },
      {
          $Type : 'UI.DataField',
          Value : valorParcelaFmt,
          ![@UI.Importance] : #High
      },
      {
          $Type : 'UI.DataField',
          Value : parcelas,
          ![@UI.Importance] : #High
      },
      {
          $Type : 'UI.DataField',
          Value : noParcela,
      },
      {
          $Type : 'UI.DataField',
          Value : qtdParcela,
      },
      {
          $Type : 'UI.DataField',
          Value : valorPagamento,
      },
      {
          $Type : 'UI.DataField',
          Value : valorParcela,
      },
      {
          $Type : 'UI.DataField',
          Value : cnpj,
      },
      {
          $Type : 'UI.DataField',
          Value : nomeEmpresa,
      },
    ],
    Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Pagamento', Target: '@UI.FieldGroup#Pagamento'},
      {$Type: 'UI.ReferenceFacet', Label: 'Valor', Target: '@UI.FieldGroup#Valor'},
      {$Type: 'UI.ReferenceFacet', Label: 'Empresa', Target: '@UI.FieldGroup#Empresa'},
      {$Type: 'UI.ReferenceFacet', Label: 'Dados Bancários', Target: '@UI.FieldGroup#DadosBancarios'}
		],
		FieldGroup#Pagamento: {
			Data: [
        {
					Value: status,
					Criticality: criticality
				},
        {
          Value: dataVencimento
        },
        {
          Value: dataPagamento
        },
      ]
    },
    FieldGroup#Valor: {
      Data: [
        {
          Value: parcelas
        },
        {
          Value: valorParcelaFmt,
        },
        {
          Value: valorPagamentoFmt,
        }
			]
		},
    FieldGroup#Empresa: {
			Data: [
        {
          Value: cnpj
        },
        {
					Value: nomeEmpresa
				},
			]
		},
    FieldGroup#DadosBancarios: {
			Data: [
        {
          Value: agencia
        },
        {
          Value: conta
        },
        {
          Value: digito
        },
			]
		}
  }
);
