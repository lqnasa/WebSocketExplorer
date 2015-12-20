<html>
<body>
	<div>
		<input type="submit" value="Start" onclick="start()" />
	</div>
	<div id="messages"></div>
	<script type="text/javascript">
		var webSocket = new WebSocket(
				'ws://localhost:8080/websocket/chat');

		webSocket.onerror = function(event) {
			onError(event)
		};

		webSocket.onopen = function(event) {
			onOpen(event)
		};

		webSocket.onmessage = function(event) {
			onMessage(event)
		};

		function onMessage(event) {
			document.getElementById('messages').innerHTML += '<br />'
					+ event.data;
		}

		function onOpen(event) {
			document.getElementById('messages').innerHTML = 'Connection established';
		}

		function onError(event) {
			document.getElementById('messages').innerHTML = "<b style='color:red;'>Connected faild</b>";
		}

		function start() {
			webSocket.send('hello');
			return false;
		}
	</script>
</body>
</html>
