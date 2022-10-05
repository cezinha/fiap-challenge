using PaymentsService as service from '../../srv/payments-service';
using from '../../srv/payments-service-ui';
annotate service.Pagamentos with @(
    UI.HeaderInfo : {
        Initials : cnpj,
        TypeName : '{i18n>Pagamento}',
        TypeNamePlural : '{i18n>Pagamentos}',
        Title : {
            $Type : 'UI.DataField',
            Label : 'Empresa',
            Value : empresa,
        },
        Description : {
            $Type : 'UI.DataField',
            Label : 'Nº Pagto.',
            Value : noPagamento,
        },
        TypeImageUrl : 'sap-icon://payment-approval',
    }
);
annotate service.Pagamentos with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : noPagamento,
            Label : '{i18n>NPagto}',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : empresa,
            Label : '{i18n>Empresa}',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Criticality : criticality,
            Label : '{i18n>Status}',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : dataPagamento,
            Label : '{i18n>DataPgto}',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : dataVencimento,
            Label : '{i18n>DataVenc}',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : valorPagamentoFmt,
            Label : '{i18n>ValorPagto}',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : valorParcelaFmt,
            Label : '{i18n>ValorParcela}',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : parcelas,
            Label : '{i18n>NDaParcela}',
            ![@UI.Importance] : #High,
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
            Label : '{i18n>Cnpj}',
        },
        {
            $Type : 'UI.DataField',
            Value : nomeEmpresa,
            Label : '{i18n>NomeDaEmpresa}',
        },
    ]
);
annotate service.Pagamentos with {
    dataVencimento @Common.Label : '{i18n>DataVenc}'
};
annotate service.Pagamentos with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Pagamento}',
            Target : '@UI.FieldGroup#Pagamento',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Valor}',
            Target : '@UI.FieldGroup#Valor',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Empresa}',
            Target : '@UI.FieldGroup#Empresa',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>DadosBancrios}',
            Target : '@UI.FieldGroup#DadosBancarios',
        },
    ],
    UI.FieldGroup #Pagamento : {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status,
                Criticality : criticality,
                Label : '{i18n>Status}',
            },
            {
                $Type : 'UI.DataField',
                Value : dataVencimento,
                Label : '{i18n>DataVenc}',
            },
            {
                $Type : 'UI.DataField',
                Value : dataPagamento,
                Label : '{i18n>DataPgto}',
            },
        ],
    },
    UI.FieldGroup #Valor : {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : parcelas,
                Label : '{i18n>NDaParcela}',
            },
            {
                $Type : 'UI.DataField',
                Value : valorParcelaFmt,
                Label : '{i18n>ValorParcela}',
            },
            {
                $Type : 'UI.DataField',
                Value : valorPagamentoFmt,
                Label : '{i18n>ValorPagto}',
            },
        ],
    },
    UI.FieldGroup #Empresa : {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : cnpj,
                Label : '{i18n>Cnpj}',
            },
            {
                $Type : 'UI.DataField',
                Value : nomeEmpresa,
                Label : '{i18n>NomeDaEmpresa}',
            },
        ],
    },
    UI.FieldGroup #DadosBancarios : {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : agencia,
                Label : '{i18n>Agencia}',
            },
            {
                $Type : 'UI.DataField',
                Value : conta,
                Label : '{i18n>Conta}',
            },
            {
                $Type : 'UI.DataField',
                Value : digito,
                Label : '{i18n>Digito}',
            },
        ],
    }
);
