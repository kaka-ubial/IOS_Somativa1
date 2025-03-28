# Sistema de Notificações

Este projeto simula o envio de notificações através de diferentes canais: Email, SMS e Push Notification. Utiliza o protocolo `Notificavel` e permite a criação de mensagens estruturadas com tipos específicos, como promoção, lembrete e alerta.

## Funcionalidades
- **Canais de Notificação**: Envio de notificações por Email, SMS e Push Notification.
- **Mensagens Estruturadas**: Utiliza o tipo `Mensagem` para definir o conteúdo e tipo da notificação.
- **Protocolos e Extensões**: Uso do protocolo `Notificavel` e extensão para personalização do envio de notificações.

## Como Usar
1. Defina as mensagens usando a struct `Mensagem` e atribua um tipo (`promocao`, `lembrete`, `alerta`).
2. Crie notificações utilizando os canais `Email`, `SMS` ou `PushNotification`, associando a mensagem criada.
3. Envie as notificações iterando sobre um array de canais e chamando o método `enviarNotificacao()`.

## Tecnologias
- Swift

## Aluna
Karen Ubial Pereira
