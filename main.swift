protocol Notificavel {
  var mensagem: Mensagem { get }

  func enviarNotificacao() 
}

extension Notificavel{
  func enviarNotificacao() {
    print("Enviando notificação...")
  }
}

struct Email: Notificavel {
  var enderecoEmail: String
  var mensagem: Mensagem

  func enviarNotificacao() {
    print("Enviando email para \(enderecoEmail): \(mensagem.conteudo)")
  }
}

struct Sms: Notificavel {
  var numeroTelefone: String
  var mensagem: Mensagem

  func enviarNotificacao() {
    print("Enviando SMS para \(numeroTelefone): \(mensagem.conteudo)")
  }
}

struct PushNotification: Notificavel {
  var tokenDispositivo: String
  var mensagem: Mensagem

  func enviarNotificacao() {
    print("Enviando notificação para \(tokenDispositivo): \(mensagem.conteudo)")
  }
}

enum TipoMensagem{
  case promocao
  case lembrete
  case alerta
}

struct Mensagem{
  var tipo: TipoMensagem
  var conteudo: String
}

let mensagem1 = Mensagem(tipo: .promocao, conteudo: "Bem-vindo!")
let mensagem2 = Mensagem(tipo: .alerta, conteudo: "Você tem uma nova mensagem.")
let mensagem3 = Mensagem(tipo: .lembrete, conteudo: "Seu código de verificação é 1234.")

let notificacoes: [Notificavel] = [
    Email(enderecoEmail: "teste@email.com", mensagem: mensagem1),
    PushNotification(tokenDispositivo: "Iphone de Kakau", mensagem: mensagem2),
    Sms(numeroTelefone: "(49)99953-9249", mensagem: mensagem3)
]

for notificacao in notificacoes {
  notificacao.enviarNotificacao()
}

