function RequestManager() {
	var _this = this;
	setInterval(function () { _this.tick(); }, 1000);
	this.requests = []
	this.div = document.createElement("div");
	this.div.classList.add("requestManager");
	document.body.appendChild(this.div);
}

RequestManager.prototype.updateClock = function (id, currentTime, time) {
	const minutes = Math.floor(currentTime / 60);
	const seconds = currentTime % 60;
	$(`#timer-${id}`).html(`${String(minutes).padStart(2, '0') || "00"}:${String(seconds).padStart(2, '0') || "00"}`);
}

RequestManager.prototype.addRequest = function (id, text, time) {
	var request = {}
	request.div = document.createElement("div");
	request.id = id;
	if(!request.time) {
		request.time = time;
	}
	request.currentTime = time - 1;
	request.text = text;
	$('.requestManager').append(`
			<div class='main request-${id}'>
				<div class="flex-between request_title">
					<div class="shape alert_box">
						<img class="alert-logo" src='sinos.png' alt=''>
						<p class="request_text">Atenção</p>
					</div>
					<div class="request-actions">
						<div class="shape request_action request_text">
							<div class="request_key green">Y</div>
							Aceitar
						</div>
						<div class="shape request_action request_text">
							<div class="request_key red">U</div>
							Recusar
						</div>
					</div>
				</div>
				<div class="request_message shape">
					<p>${request.text}</p>
					<p class="request_timer" id="timer-${id}"></p>
					<div class="request_progress" id="progress-${id}"></div>
				</div>
			</div>
		`)
	this.updateClock(id, time - 1, request.time);
	$(`#progress-${id}`).css("animation-duration", time+'s')
	this.requests.push(request);
	this.div.appendChild(request.div);
}

RequestManager.prototype.respond = function (ok) {
	if (this.requests.length > 0) {
		var request = this.requests[0];
		if (this.onResponse)
			this.onResponse(request.id, ok);
		this.div.removeChild(request.div);
		$(`.request-${request.id}`).remove();
		this.requests.splice(0, 1);
	}
}

RequestManager.prototype.tick = function () {
	for (var i = this.requests.length - 1; i >= 0; i--) {
		var request = this.requests[i];
		request.currentTime -= 1;
		this.updateClock(request.id, request.currentTime, request.time);
		if (request.currentTime <= 0) {
			this.div.removeChild(request.div);
			this.requests.splice(i, 1);
			$(`.request-${request.id}`).remove();
		}
	}
}