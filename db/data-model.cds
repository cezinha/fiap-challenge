namespace fiap.challenge;
using { managed } from '@sap/cds/common';

entity Pagamentos : managed {
  key noPagamento: String;
  cnpj: String;
  nomeEmpresa: String;
  status: String;
  dataVencimento: Date;
  dataPagamento: Date;
  eParcelado: Boolean;
  noParcela: Integer;
  qtdParcela: Integer;
  valorParcela: Double;
  valorPagamento: Double;
  aprovadoPor: String;
  agencia: Integer;
  conta: Integer;
  digito: Integer;
  descricao: String;
  categoria: String;
  itens: array of Item;
  empresa: String;
  valorParcelaFmt: String;
  valorPagamentoFmt: String;
  criticality: Integer;
  parcelas: String;
  valido: Boolean;
}

type Item {
  codigo: String;
  descricao: String;
  qtd: Integer;
  precoUnit: Double;
  precoTotal: Double;
  unidade: String;
}
