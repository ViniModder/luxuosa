local locale = {}

locale['en'] = {
	invalid_command   = '[~r~ERROR~s~] missing argument. Usage: /%s emote_id',
	invalid_command_2 = '[~r~ERROR~s~] %s is not a valid emote.',
	off_vehicle_only  = '[~r~ERROR~s~] You can\'t perform this animation while inside a vehicle.',
	cant_perform_dead = '[~r~ERROR~s~] You can\'t perform this animation while dead.',

	keymapping_hint	  = 'Stop animations',
	keymapping_hint_2 = 'Stop adult animation',
	keymapping_hint_3 = 'Increase animation speed',
	keymapping_hint_4 = 'Slowdown animation speed',

	player_not_found  = '[~r~ERROR~s~] No player nearby.',
	pending_request   = '[~r~ERROR~s~] You still have a pending request, wait 15 seconds.',
	pending_request_2 = '[~r~ERROR~s~] Someone tried to send you a request, but you already have one waiting.',
	request_refused   = '[~r~ERROR~s~] Your request has failed or was refused.',
	anim_error 		  = '[~r~ERROR~s~] An error occurred trying to start the animation.',

	request_prompt    = '~g~%s~s~ | ~r~%s~s~  Accept or decline %s',
	both_none_vehicle = '[~r~ERROR~s~] You both should be inside or outside a vehicle to sync the animation.',

	max_speed_alert   = '[~r~ERROR~s~] You\'ve reached the top speed to the current animation.',
	min_speed_alert   = '[~r~ERROR~s~] You\'ve reached the minimum speed to the current animation.',

	anim_01 = 'Standing Position %s',
	anim_02 = 'Doggy Style %s',
	anim_03 = 'Blowjob %s',
	anim_04 = 'Blowjob 2 %s',
	anim_05 = 'Lotus Position %s',
	anim_06 = 'Inverted Lotus Position %s',
	anim_07 = 'Cowgirl Position %s',
	anim_08 = 'Deep Stick Position %s',

	anim_09 = 'Cowgirl Position',
	anim_10 = 'Blowjob',
	anim_11 = 'Blowjob 2',
	anim_12 = 'Seated Position',
	anim_13 = 'Seated Position 2',
	anim_14 = 'Seated Position 3',
	anim_15 = 'Seated Position (Full)',
	anim_16 = 'Blowjob (Full)',
	anim_17 = 'Seated Position 2 (Full)',
	anim_18 = 'Blowjob 2 (Full)',
	anim_19 = 'Seated Position 3 (Full)',
}

locale['br'] = {
	invalid_command   = '[~r~ERRO~s~] argumento faltando. Uso correto: /%s id_do_emote',
	invalid_command_2 = '[~r~ERRO~s~] %s não é um emote válido.',
	off_vehicle_only  = '[~r~ERRO~s~] Você não pode fazer essa animação de dentro de um veículo.',
	cant_perform_dead = '[~r~ERRO~s~] Você não pode fazer essa animação morto.',

	keymapping_hint	  = 'Parar animações',
	keymapping_hint_2 = 'Parar animação +18',
	keymapping_hint_3 = 'Aumentar velocidade da animação',
	keymapping_hint_4 = 'Reduzir velocidade da animação',

	player_not_found  = '[~r~ERRO~s~] Não há nenhum player próximo.',
	pending_request   = '[~r~ERRO~s~] Você ainda tem uma requisição pendente, aguarde 15 segundos.',
	pending_request_2 = '[~r~ERRO~s~] Alguém tentou enviar um pedido, mas você ainda tem um pendente.',
	request_refused   = '[~r~ERRO~s~] Seu pedido falhou ou foi recusado.',
	anim_error 		  = '[~r~ERRO~s~] Ocorreu um erro ao iniciar a animação.',

	request_prompt    = '~g~%s~s~ | ~r~%s~s~  Aceitar ou recusar %s',
	both_none_vehicle = '[~r~ERRO~s~] Vocês dois devem estar dentro ou fora de um veículo para sincronizar a animação.',

	max_speed_alert   = '[~r~ERRO~s~] Você já atingiu a velocidade máxima dessa animação.',
	min_speed_alert   = '[~r~ERRO~s~] Você já atingiu a velocidade mínima dessa animação.',

	anim_01 = 'Canguru Perneta %s',
	anim_02 = 'De quatro %s',
	anim_03 = 'Oral %s',
	anim_04 = 'Oral 2 %s',
	anim_05 = 'Lotus %s',
	anim_06 = 'Lotus Invertido %s',
	anim_07 = 'Cowgirl %s',
	anim_08 = 'De pé 2 %s',

	anim_09 = 'Cowgirl',
	anim_10 = 'Oral',
	anim_11 = 'Oral 2',
	anim_12 = 'Sentada',
	anim_13 = 'Sentada 2',
	anim_14 = 'Sentada 3',
	anim_15 = 'Sentada (Completa)',
	anim_16 = 'Oral (Completa)',
	anim_17 = 'Sentada 2 (Completa)',
	anim_18 = 'Oral 2 (Completa)',
	anim_19 = 'Sentada 3 (Completa)',
}

function _s(index, ...)
	local lang = locale[Config.Locale]
	if not lang then
		print('^1Locale [^7' .. Config.Locale .. '^1] does not exist, setting to default language.^7')
		Config.Locale = 'en'
		return _s(index)
	end

	if not lang[index] then return '' end
	if not {...} then return lang[index] else return (lang[index]):format(...) end
end