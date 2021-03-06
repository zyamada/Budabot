<?php

use Exception;

class RpcServerStub {
	private $rpcClient = null;

	public function startServer($rpcPort) {

		// wait until the server's json-rpc interface is accessible
		$timeout = time() + 10*60;
		do {
			$socket = @fsockopen('127.0.0.1', $rpcPort, $errno, $errstr, 10);
			if (time() > $timeout) {
				throw new Exception('Failed to connect to aochat server\'s rpc-port!');
			}
			if ($socket === false) {
				print '.';
			}
		} while($socket === false);
		print "Connected to aochat rpc server.\n";
		fclose($socket);

		$this->rpcClient = new JsonRpc\RpcClient("http://127.0.0.1:$rpcPort/");
	}

	public function stopServer() {
		$this->rpcClient = null;
	}

	public function __call($method, $arguments) {
		if (!$this->rpcClient) {
			throw new Exception("No such method, or rpc client/server not running!");
		}

		$response = $this->rpcClient->__call($method, $arguments);
		if (isset($response->error)) {
			throw new Exception($response->error->message, $response->error->code);
		}
		return $response->result;
	}
}

