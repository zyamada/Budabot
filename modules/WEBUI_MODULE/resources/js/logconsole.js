var LogConsole = (function() {

	logMaxLines = 1000;

	function isLogConsoleAtBottom() {
		if (log_console.scrollTopMax != undefined) {
			return log_console.scrollTop == log_console.scrollTopMax;
		}
		return true;
	}

	function scrollLogConsoleToBottom() {
		if (log_console.scrollTopMax != undefined) {
			log_console.scrollTop = log_console.scrollTopMax;
		} else {
			log_console.scrollTop = 999999999;
		}
	}

	function limitLogConsoleLines() {
		if (log_console.children.length > logMaxLines) {
			$('#log_console').find(':first-child').remove();
		}
	}

	function addMessageToLogConsole(message) {
		var atBottom = isLogConsoleAtBottom();

		var entryDiv = document.createElement('div');
		entryDiv.appendChild(document.createTextNode(message));
		log_console.appendChild(entryDiv);

		limitLogConsoleLines();

		if (atBottom) {
			scrollLogConsoleToBottom();
		}
	}

	function getAttribute(name) {
		return $('#log_console').attr(name);
	}

	$.subscribe('wamp_success', function(topic, session) {
		session.subscribe(getAttribute('data-topic'), function (topic, event) {
			date = new Date(event.time*1000);

			msg = date.toLocaleDateString() + " " + date.toLocaleTimeString();
			msg += " " + event.level;
			msg += " " + event.logger;
			msg += " " + event.msg;

			addMessageToLogConsole(msg);
		});
	});

	$.subscribe('wamp_failed', function(topic, data) {
		addMessageToLogConsole(data.reason);
	});

})();
