using fiap.challenge as db from '../db/data-model.cds';

service PaymentsService {
  entity Pagamentos as projection on db.Pagamentos;
}
