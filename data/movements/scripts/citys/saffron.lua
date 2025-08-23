function onStepIn(cid, item, position, fromPosition)
    local townId = 1
    local townName = getTownName(townId)

    -- Define a cidade do jogador
    doPlayerSetTown(cid, townId)

    -- Mensagem aprimorada
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
        "Parab�ns! Voc� agora � oficialmente um cidad�o de "..townName..".\nSeu templo foi atualizado e voc� ser� teleportado para l�.")

    -- Teleporta o jogador para o templo da cidade
    local templePos = getTownTemplePosition(townId)
    doTeleportThing(cid, templePos)
    doSendMagicEffect(templePos, CONST_ME_TELEPORT)
end
