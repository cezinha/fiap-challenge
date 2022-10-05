const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {
  this.after("READ", "Pagamentos", (data) => {
    const list = Array.isArray(data) ? data : [data];
    const currency = new Intl.NumberFormat("pt-BR", {
      style: "currency",
      currency: "BRL",
    });
    list.forEach((pagto) => {
      pagto.valorPagamentoFmt = `${currency.format(pagto.valorPagamento)}`;
      pagto.valorParcelaFmt = `${currency.format(pagto.valorParcela)}`;
      pagto.parcelas = `${pagto.noParcela} / ${pagto.qtdParcela}`;
      pagto.empresa = `${pagto.nomeEmpresa} (${pagto.cnpj})`;
      if (pagto.status === "Pago") {
        pagto.criticality = 3;
      }
      if (pagto.status === "A pagar") {
        pagto.criticality = 2;
      }
      if (pagto.status === "Cancelado") {
        pagto.criticality = 1;
      }
      pagto.valido =
        pagto.status === "A pagar" &&
        new Date(pagto.dataVencimento) > new Date();
      console.log(pagto.valido, pagto.dataVencimento);
    });
  });
});
