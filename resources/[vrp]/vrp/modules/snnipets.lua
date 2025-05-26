local pressetHooks = {
    ["ENTRADA"] = { "https://discord.com/api/webhooks/1266976478361292884/dxQ59Z1YBxq5VFJWI8tP48Nv0fn5RTqPIsCtd7jA-19tjguA9tU3HB-XEPN85-nWI7lXv" },--teste
    ["SAIDA"] = { "https://discord.com/api/webhooks/1266976680308899900/52aqSVZLf2YuguRjVuF1fDi8H1Fuu5iF-1asTeXsNdJ1HTqqxRgujMRLbRBqU2U5NGsov" },--teste
    ["DROPAR"] = { "https://discord.com/api/webhooks/1264524232046678046/YqPyMLn-nW-_6Znt5OBHEzpYOs_A-rkxaWNZ_eS-hB6DsffW_HEK-VxL1VkYVyHw92fE" },---OK
    ["ENVIAR"] = { "https://discord.com/api/webhooks/1264528889825202278/MBJAF-u1DO4A8erdhTyuextBLf7kBkld7gT2W4nYGwgGXWp7Sea5BX00ZDIHlzBaF6MS" },--ok
    ["EQUIPAR"] = { "https://discord.com/api/webhooks/1233224296650772511/nuq2WHO6uf2yzAlulNkejiqaF0r6gmiRR0UTmY3at0xQlg7nkjbRFsut0ESKVM4WtXzj" },
    ["GARMAS"] = { "https://discord.com/api/webhooks/1233225084836118608/4oKkikWNxha-2_1caNvkOnvCc_pDzWszmDx7fMyglSrefr2r4dDXgCF3iV3NxcNtAT03" },
    ["SAQUEAR"] = { "https://discord.com/api/webhooks/1233225216486801448/9cmWnUsAaZb9TjSY-bJmWnv08v1YFQ1kgwdcRvdlZXZNGvIGc2Aamr2TuJQIgN-B_QwZ" },
    ["BAUCARRO"] = { "https://discord.com/api/webhooks/1189707217730011236/YWXXBVybWFvvjcOzP6gc0R3j9fuu1WsU8ePhRbcKmjg5PEa_sdUIzt7U_30OarNMuPoe" },
    ["BAUCASAS"] = { "https://discord.com/api/webhooks/1189707407652311100/RF9BH1MHU4lu-t9xtw_wKTfesWqEOMmfUNtTT7l-Lmv3c5p7XEML-Zml52Dr2RQW82t_" },
    ["CRASHS"] = { "https://discord.com/api/webhooks/1189707726314553365/2dxIqFaI6MLECP3svF67BXTvIbY6c30iVVJAi2AVrD_fEEAoErtvDilJqOmY6mYvVDea" },
    ["MORTE"] = { "https://discord.com/api/webhooks/1189707954136547451/yAPgiHXzbO7uiX36z3ynyoDYcUQPq4_NRAkUulNq4Nke_Yk9N482fJrDT_fEvmindNnv" },--
    ["ROUBOGERAIS"] = { "https://discord.com/api/webhooks/1189708403879202856/2-b1Xh4cZqBGIj3GPVkSKXGmE3UyQ4bsTbnH0uF3KrHLe43kXcZJL0CTdRP0uR9dI9yq" },
    ["ROUBOAMMU"] = { "https://discord.com/api/webhooks/1189708678367023135/2Nm8lflEP9uv-3SWx9kzCHn7OHGuJQyEuPBMLYky20pUnb10Y6bDSwRi8gUmZSOkTi1k" },
    ["ROUBOCAIXA"] = { "https://discord.com/api/webhooks/1203142749084454932/EjrWcl8t8218E8HvxTv-6OUHa_uhmqd4Vk8lYanfnrtWWwlhKoSWvbIUWReL1050Ys5i" },
    ["ROUBOREGISTRADORA"] = { "https://discord.com/api/webhooks/1203142749084454932/EjrWcl8t8218E8HvxTv-6OUHa_uhmqd4Vk8lYanfnrtWWwlhKoSWvbIUWReL1050Ys5i" },
    ["BANCODEPOSITAR"] = { "https://discord.com/api/webhooks/1203142749084454932/EjrWcl8t8218E8HvxTv-6OUHa_uhmqd4Vk8lYanfnrtWWwlhKoSWvbIUWReL1050Ys5i" },
    ["BANCOSACAR"] = { "https://discord.com/api/webhooks/1189709176549691493/cnutaducBgNmwR-1yhnVJjPx9L8DNCE_49E84mKCPIg77s3jKIdICzWzteRZb0T-EAlG" },
    ["BANCOENVIAR"] = { "https://discord.com/api/webhooks/1189709280429998161/lFvPjO6j7-uHx6TTIAQEIL8Amjt7iaWgbtvDZ5E0aNrBl2JECELH0W8MztO5bXR7Hiqd" },
    ["COMPRARVEICULO"] = { "https://discord.com/api/webhooks/1264536176228962324/Sd-PCpoc_VwpU7T-pUqmxwttFgWBNVaDfwyQtpVg36olQgH7uj3rTwLPRgkeusYkf4_x" },---
    ["WL"] = { "https://discord.com/api/webhooks/1264522244743368746/kEAS0vVOse41vtJbXs2eiaSCsLZsVpWed8cfTadGcaGUF6rBggvKo1fKF9HDDG66TL7D" },
    ["IDS"] = { "https://discord.com/api/webhooks/1189709972062339072/jMXJwBUBNYfywf7A_EPIlVewS04BNedUKlY6goLOkz70MToJICZC4lYQsC3TE-gu2R4W" },
    ["TPTO"] = { "https://discord.com/api/webhooks/1233575447195947088/kYQByA6grCI9SwQeHC8wyNds9Cte_5dqFk-bUeCyj-8F48faRvJNRoPLkC678YNFs3Pp" },
    ["TPTOME"] = { "https://discord.com/api/webhooks/1189710154845929542/qrjiD2eOwnsDWTJJKRrGkNBjhxBtsiPtdQgjLLA5qBPO3eoB48AZew2UNQ6etPw8bB9W" },
    ["GOD"] = { "https://discord.com/api/webhooks/1298602846262136942/fpSpScVRuekezpvAHZEAJ8C0YzB4instzYvafI9gou57t5laBJH-1FDG56yUIGrsrjnL" },--ok---nova loss
    ["GOID"] = { "https://discord.com/api/webhooks/1233573288689664101/3DV3Q0uOhP8mb7br4n9lnRbAPgLKlcYkYEP52B6AvrMscvYeFaKF2AjtQX1askfypaD1" },
    ["KICK"] = { "https://discord.com/api/webhooks/1266977001265434645/TrwFrmULXitOTdtvzKX1_QRfXFl83lMmfqhgWG_No8-nRS9YuhPIDrMWntDLjccBP2z3" },--teste
    ["BAN"] = { "https://discord.com/api/webhooks/1264530246745587712/3b4rPcC6PtIaMdw6SVoR1DQEGM4R_FMO_4gxZXjrEVcYkmTxRy0Bjby_cxd0j_DqE4XF" },-----
    ["PRENDERADM"] = { "https://discord.com/api/webhooks/1189711070491856918/RcT2kwkzQR2n2ch-bjh5PMiw2E5lzF-7lydsHgGxNpU7d_2Snw41JG89A3qJkL_ze60u" },
    ["AADM"] = { "https://discord.com/api/webhooks/1233271884838342676/QTEnt4ryHxLo5QounisZcNCbTHbn97BtMyU5Jr3LGH1yH8XPQYqYemNTWngUkTc9X84j" },
    ["KILL"] = { "https://discord.com/api/webhooks/1233271884838342676/QTEnt4ryHxLo5QounisZcNCbTHbn97BtMyU5Jr3LGH1yH8XPQYqYemNTWngUkTc9X84j" },
    ["ITEM"] = { "https://discord.com/api/webhooks/1264530671355953202/x1t1PV2ya6VUSSqdhzAjSweEw2GO2z6ygzFD4xb1TdiAILplJVqyjvt2Z5Nb3BKPv2qv" },----ok
    ["TPWAY"] = { "https://discord.com/api/webhooks/1233574766628180029/GRuX3114W7rmHjNfZGGhq2IGL9f2XNiZ31U_xOcd00CB9xlxf8oRy2Ew57RBZCa6VKvQ" },
    ["ACEITARCHAMADOADMIN"] = { "https://discord.com/api/webhooks/1189711460377575525/S4myXJG6RXdyHuLauMbL_M9lPQ6d3zPcdQfAUWd91QrYw6e9hlycLodiNwqotXgCUofC" },
    ["GROUPADD"] = { "https://discord.com/api/webhooks/1298606597244715038/LXr1o_dh-t0vG7-0-X_bbOAM8gHSJu3jO0g_s2ZhVybRm5_8IMVXrqkzrTLXMvX09ve_" },-----ok---NOVA LOG
    ["GROUPREM"] = { "https://discord.com/api/webhooks/1264531484178382900/-AAZMzMfW6Lr4r1l1CV9s93oD8IR2LXPL-2IGVoY77cCvA_CqLgl85FDMcnL0f_F1M7f" },-----ok
    ["SPAWNCAR"] = { "https://discord.com/api/webhooks/1189711766280749086/nPFBdZ4FUkCOV6-t-Q3bjHmPIoYQ8jPfokIghoZuGLcYYNofLgqAA_7S2KovkudLz9XC" },
    ["MONEY"] = { "https://discord.com/api/webhooks/1189711836459831357/K_ergtEWxp6BjMA966S6g01NdK9kNTIdNrWxDMGRNrYZ9Tbac-c0uLd5Jem5NzVnKTTE" },--okk
    ["BATERPONTOBENNYS"] = { "https://discord.com/api/webhooks/1189712417517735946/N1_DHrqYUhhJbdOICPwMNjgEZ1AEsMT1reEX0Z34t2fD7XBvrxQ29kvxSvHFTb_SnFqq" },
    ["BATERPONTOPOLICIA"] = { "https://discord.com/api/webhooks/1189712627937579090/HbdIaotf7mXr3BOTc-HBVhgphPuRsZd6rUQizW9hRpRQjl0s-suME4MIpMcktxC4vVyq" },
    ["BATERPONTOHOSPITAL"] = { "https://discord.com/api/webhooks/1189712979248295956/dNMniBgiyH_bBP5w0eLtRUP0l2PlJP4BBcCDN0gc-lulHycPXSfN95b5HbIEPsVHud8k" },
    ["BATERPONTOADMIN"] = { "https://discord.com/api/webhooks/1298605928769126421/NuU8G1SuFVRVfjTt_iLJtnZ-9LstHLmizRetz8hjWaUw_MXMEKFbmXXcTJ6RV8PRkNCG" },----teste
    ["PRENDER"] = { "https://discord.com/api/webhooks/1189713381532368927/am4A7MyBNgGu5R6LeIAjA6N1Ipth3GaQ0rtJ4TPQREkz_Ip2fXVY-qOMw804yeGkznEn" },
    ["DESMANCHE"] = { "https://discord.com/api/webhooks/1189713574759780363/drZX4t-Dsdz7gLzUIyZPVLl8-GIFdPWG-dvgCHx1A25l7-R-PGLPf6qukWcC9xbcyB_8" },
    ["COPYPRESET"] = { "https://discord.com/api/webhooks/1189713744838807704/l5sfFn8I8ntHXgr6cKpqopPfkilZL3xX2Ltt1Rck9NSZFLMKvgAbD8alZYf947fnQbQp" },
    ["SETPRESET"] = { "https://discord.com/api/webhooks/1189713884991463453/7aLjQel2q9IObl3Wp2jgtsgxGeVbgxuIEoXFmNOvamz8d2AC3A-CxtIMPVJ7i47yTj3O" },
    ["REVISTARADM"] = { "https://discord.com/api/webhooks/1189714031062302851/h7CrYLYo2zJlAa3ueowHeFtQBcTLSoBSr9X3cH4-0T6c3okiSnV2NrKoBObtweHdteaz" },
    ["VAULTADM"] = { "https://discord.com/api/webhooks/1189714271211372674/gbIhx_yNn3sJa8mxUPtM6SRWsQS-yn1SwSdBtRh4nF6_AKXShy22g3dlOnE4o9Ejncy4" },
    ["HOUSEADMCHEST"] = { "https://discord.com/api/webhooks/1189714494197346364/h7cEud8w3X27NCuy5CwRn8XCrdP2MpmRqjoNxxEmJgH4Q1uumA4KpM3obPRUfBolZBtK" },
    ["FUEL"] = { "https://discord.com/api/webhooks/1189714636652675124/pk5_H20KnfB-8qsJBP7ln1WJwGRftRtzK76-FvmXao4o9bSMtb5YTsme-jDG4P9aAJXa" },
    ["LOCKPICK"] = { "https://discord.com/api/webhooks/1189714835290730526/h3chUUmrZMRn1NuXOQGSKEYOYr3L15RRySlL_5EpxNZRtrQn2DtEP9C21hxaXzYAZdYb" },
    ["ADDCARRO"] = { "https://discord.com/api/webhooks/1189715003276796106/5Tap6QPBTUQ1d-RybCiO_4YDtrBJsmFEUM-v1MEi_mE_Q9FxLJw_9tSqPvO-p8wdfr_h" },
    ["RENOMEAR"] = { "https://discord.com/api/webhooks/1189715246793900153/XU5rhMlGNQ-RUhLs4A2b4Cezqr2r49c6NjM4U_25wNhNJRK3f_QZ-Tu-GB3rCTfpyEOE" },
    ["CRAFT"] = { "https://discord.com/api/webhooks/1189715388267761664/Vv7xueQhqM59-GpxCOkXcjoMmvtyLV80DRHBIZ8UYy8KmDLp2QPFGD9qW0Luf_0lmrWu" },
    ["KITMALOKERO"] = { "https://discord.com/api/webhooks/1189715581134438470/OW3ZSLtPprWmqH1J2OFAD-D9GKj53xHhS1_PmpZvc3RA922w5RzMWjDkc98z4-ZIB9gD" },
    ["KITMEC"] = { "https://discord.com/api/webhooks/1194898923530227763/tir-Ygjf9I4Sy_LToSCOMhsIgEhvINVzY94woTD5cG7fcM2QIufMXggCk0bx9iGXJ3Ih" },
    ["GETITEM"] = { "https://discord.com/api/webhooks/1189715753486798949/r_Su4tVYlKwifbNI5yoZHRUapkLyuFNC2oPAXzaMUyWBnwCHnM72Qbu4W-PKzjPm9gTk" },
    ["REMCARRO"] = { "https://discord.com/api/webhooks/1189715913780498442/Von3noxG5F_HM14DvoM8sX1LVCrSLpP0It96CAXv-i8waczDkb0dU4Fy8nnQWE7i5i8u" },
    ["RESETCHAR"] = { "https://discord.com/api/webhooks/1234323409073082408/l-Daqkt7ywaRx7yc-ovNd51dJKFcNAAM0jesszGgNnfcFGv0sJ9kFJ7PYbURbrF2hidr" },
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD WEEBHOOK
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function vRP.sendLog(weebhook, mensagge)
    if weebhook and mensagge then
        if pressetHooks[weebhook] ~= nil then
            SendWebhookMessage(pressetHooks[weebhook][1],mensagge)
        else
            SendWebhookMessage(weebhook,mensagge)
        end
    end
end

function SendWebhookMessage(webhook,message)
    if webhook ~= "none" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- DESLOGAR DENTRO DA PROPRIEDADE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.atualizarPosicao(user_id,x,y,z)
    local data = vRP.getUserDataTable(user_id)
    if user_id then
        if data then
            data.position = { x = x, y = y, z = z }
        end
    end
end

function vRP.limparArmas(user_id)
    local data = vRP.getUserDataTable(user_id)
    if user_id then
        if data then
            data.weapons = {}
        end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OUTROS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('playerDropped', function (reason)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then

        if reason == "Game crashed: gta-core-five.dll!CrashCommand (0x0)" then
            vRP._setBanned(user_id, true, "Usou comando para forjar o crash")
            vRP.sendLog("CRASHS", "O ID "..user_id.." utilizou o comando _crash.")
        end
    end
end)
