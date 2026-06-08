let emails = ['admin', 'aluno@sptech.school'];
let senhas = ['admin', 'aluno.sptech'];

console.log(emails, senhas);

let tentativas = 0
// login
function entrar() {
    let login = ipt_email.value;
    let senha = ipt_senha.value;

    let validacao = false;
    let ax_erro = false;

    if (tentativas >= 3) {
        msg_Erro.innerHTML += `<br>Limite de tentativas atingido!`;
        ax_erro = true;
        console.log(ax_erro);
    }

    if (ax_erro == false) {
        for (let i = 0; i < emails.length; i++) {
            if (login == emails[i] && senha == senhas[i]) {
                validacao = true;
                window.location.href = "./dashboard.html";
                break;
            }
        }

        if (!validacao) {
            tentativas++;
            msg_Erro.innerHTML = `Tentativa ${tentativas}: Email/senha incorretos`;
        }
    }
}
// cadastro
function Criar() {

    let emailcad = ipt_email.value;
    let senha = ipt_senha.value;
    let senha_rep = ipt_confirme.value;

    let ax_erro = false;

    msg_Erro.innerHTML = '';

    if (emailcad == "" ||
        (!emailcad.includes('@gmail') &&
            !emailcad.includes('@uol') &&
            !emailcad.includes('@outlook'))
    ) {
        ax_erro = true;
        msg_Erro.innerHTML = 'Digite um e-mail válido';
    }

    if (senha.length < 7 || senha == '' || senha_rep == '') {
        ax_erro = true;
        msg_Erro.innerHTML = 'A senha deve conter no minimo 7 caracteres';
    }

    if (senha_rep != senha) {
        ax_erro = true;
        msg_Erro.innerHTML = 'As senhas não coincidem';
    }

    if (emailcad == "") {
        ax_erro = true;
        msg_Erro.innerHTML = 'O campo de Email esta vazio';
    }

    if (ax_erro == false) {
        emails.push(emailcad);
        senhas.push(senha);
        window.location.href = "./login.html";
    }

}