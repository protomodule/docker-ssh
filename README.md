<div align="center">
	<br>
	<div>
		<img width="256" height="256" src="https://upload.wikimedia.org/wikipedia/commons/0/00/Unofficial_SSH_Logo.svg" alt="ssh">
	</div>
	<br>
	<br>
  <h1>protomodule/ssh</h1>
  <p>
    <sup>
      Hardened & containerized OpenSSH client 
    </sup>
  </p>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</div>

> `protomodule/ssh` is a container for running OpenSSH client.

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Goals of `protomodule/ssh`

- Provide a containerized SSH client
- Harden default settings for OpenSSH
- Additional features like automatic key scanning
- Fun terminal output

## Usage

Run this image with docker as you would run `ssh`:

```sh
docker run --rm -it protomodule/ssh root@localhost
```

Or supply a custom private key:

```sh
docker run -e SSH_PRIVATE_KEY="$(cat ~/.ssh/id_ed25519)" --rm -it protomodule/ssh root@localhost
```

### Secure copy

To copy a file with SCP you also need to mount a volume into the container:

```sh
docker run -e SSH_PRIVATE_KEY="$(cat ~/.ssh/id_ed25519)" -v $(pwd):/local --rm protomodule/ssh scp /local/test.txt root@localhost:/tmp/test.txt
```

## Configuration

Options for scanning may be provided as environment variables:

 * `SSH_PRIVATE_KEY` ... Provide a custom private key for authentication
 * `KNOWN_HOST` ... Automatically perform keyscan on this host
 * `KNOWN_PORT` ... Use non default port for this host
 * `QUIET` ... Minimize terminal output

<br>
<br>

<img src="https://upload.wikimedia.org/wikipedia/commons/0/00/Unofficial_SSH_Logo.svg" width="20"/>

###### SSH logo attribution [Jessie Kirk, CC BY 4.0](https://commons.wikimedia.org/wiki/File:Unofficial_SSH_Logo.svg)
