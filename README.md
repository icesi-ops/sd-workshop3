# sd-workshop1 2024-A
By: Samuel Guerrero

## 1. Open the app-invoice micorservice, and navigate to the kafka consumer foler, and open the TransactionEvent file:
  1. Change the method in transaction event
  ```
      public void processTransactionEvent(ConsumerRecord<Integer, String> consumerRecord) throws JsonProcessingException {
        Invoice event = objectMapper.readValue(consumerRecord.value(), Invoice.class);
        Invoice invoice = _dao.findById(event.getIdInvoice()).get();
        log.info("Actulizando Invoice ***" + event.getIdInvoice());
   		log.info("Se ha pagado la factura # " + event.getIdInvoice());
        invoice.setAmount(invoice.getAmount()-event.getAmount());
        if(invoice.getAmount() < 0){
            invoice.setState(1);
            invoice.setAmount(0.00);
        }
        _dao.save(invoice);
    }
  ```
  2. Re-build the app-invoice image
  3. Re run the microservice 