// Protocolo Notificavel que define os requisitos básicos para os canais de notificação
protocol Notificavel {
    var mensagem: Mensagem { get }
    var prioridade: Prioridade { get }
    
    // Método obrigatório que as structs devem implementar
    func enviarNotificacao()
    
    // Método opcional para verificar se a notificação é urgente, com implementação padrão
    func isUrgente()
}

// Extensão do protocolo Notificavel, fornecendo implementação padrão para o método isUrgente
extension Notificavel {
    // Método que verifica se a prioridade é alta e imprime "URGENTE!" se for o caso
    func isUrgente() {
        if prioridade == .alta {
            print("URGENTE!")
        }
    }
    
    // Implementação padrão para o método enviarNotificacao, que pode ser sobrescrito pelas structs
    func enviarNotificacao() {
        print("Enviando notificação...")
    }
}

// Struct Email que conforma o protocolo Notificavel
struct Email: Notificavel {
    var enderecoEmail: String
    var mensagem: Mensagem
    var prioridade: Prioridade

    // Implementação do método enviarNotificacao para Email, sobrescrevendo a implementação padrão
    func enviarNotificacao() {
        // Chama a função isUrgente para verificar se a mensagem é urgente
        isUrgente()
        print("Enviando email para \(enderecoEmail): \(mensagem.conteudo)")
    }
}

// Struct Sms que conforma o protocolo Notificavel
struct Sms: Notificavel {
    var numeroTelefone: String
    var mensagem: Mensagem
    var prioridade: Prioridade

    // Implementação do método enviarNotificacao para SMS, sobrescrevendo a implementação padrão
    func enviarNotificacao() {
        // Chama a função isUrgente para verificar se a mensagem é urgente
        isUrgente()
        print("Enviando SMS para \(numeroTelefone): \(mensagem.conteudo)")
    }
}

// Struct PushNotification que conforma o protocolo Notificavel
struct PushNotification: Notificavel {
    var tokenDispositivo: String
    var mensagem: Mensagem
    var prioridade: Prioridade

    // Implementação do método enviarNotificacao para PushNotification, sobrescrevendo a implementação padrão
    func enviarNotificacao() {
        // Chama a função isUrgente para verificar se a mensagem é urgente
        isUrgente()
        print("Enviando notificação para \(tokenDispositivo): \(mensagem.conteudo)")
    }
}

// Enum que representa os tipos de mensagens possíveis
enum TipoMensagem {
    case promocao
    case lembrete
    case alerta
}

// Struct que representa uma mensagem, com tipo e conteúdo
struct Mensagem {
    var tipo: TipoMensagem
    var conteudo: String
}

// Enum que define as prioridades das notificações
enum Prioridade {
    case baixa
    case media
    case alta
}

// Criando algumas instâncias de mensagens com diferentes tipos e conteúdos
let mensagem1 = Mensagem(tipo: .promocao, conteudo: "Você ganhou 10% de desconto no site!")
let mensagem2 = Mensagem(tipo: .alerta, conteudo: "Você tem uma nova mensagem.")
let mensagem3 = Mensagem(tipo: .lembrete, conteudo: "Seu horário na psicóloga é 14h.")

// Criando o array de notificações com diferentes canais
let notificacoes: [Notificavel] = [
    Email(enderecoEmail: "teste@email.com", mensagem: mensagem1, prioridade: .baixa),
    PushNotification(tokenDispositivo: "Iphone de Kakau", mensagem: mensagem2, prioridade: .media),
    Sms(numeroTelefone: "(49)99953-9249", mensagem: mensagem3, prioridade: .alta)
]

// Iterando sobre o array de notificações e enviando cada uma delas
for notificacao in notificacoes {
    notificacao.enviarNotificacao()
}
