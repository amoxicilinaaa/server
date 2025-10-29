local msgs = {
        "Não deixe que as pessoas te façam desistir daquilo que você mais quer na vida. Acredite. Lute. Conquiste. E acima de tudo, seja feliz",
        "O importante não é vencer todos os dias, mas lutar sempre",
        "Cada erro tem sua lição,cada lição e um aprendizado, se encontrarem algum bugs reporte a staff",
        "Membros da Staff não pedem suas accs, então não passem elas para ninguem, não nos responsabilizamos por contas e itens perdidos",
}
 
function onThink(interval)
        local msg = msgs[math.random(#msgs)]
 
        for _, uid in pairs(getPlayersOnline()) do
                doScrollMessage(uid, msg)
        end
 
        return true
end