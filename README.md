# Getting started

## Setup

The following credentials type are supported: Basic Auth (password of the admin
account) or Bearer Auth.

### Password with Environment variable

Specify the admin password by running the following two commands

```bash
export PASSWORD
read -s -p $'Enter your password:\n' -r PASSWORD
```

The variable `API_HOST` contains the path to hawkbit, for example:

```bash
export API_HOST=https://hawkbit.example.com
```

Remember that you will have to reenter your password whenever you switch `API_HOST`

### Password with .netrc

You can also configure your credentials with the help of `~/.netrc` (see
`curl(1) --netrc` for more information)

`~/.netrc` might look like this:

    machine hawkbit.example.com login admin password hunter2

Also remember to set the permissions correctly:

    chmod 600 ~/.netrc

### Bearer Authentication

Get an access_token from an OAUTH2 server plugged to the Hawkbit one.

```
export BEARER_TOKEN
BEARER_TOKEN=$(curl \
                -d "client_id=$OAUTH_CLIENT_ID" \
                -d "client_secret=$OAUTH_CLIENT_SECRET" \
                -d "grant_type=client_credentials" \
                $OAUTH_URL \
               | jq --exit-status --raw-output .access_token)
```

Remember that access tokens could have a short lifetime (several minutes).
Check `expires_in` field of the response.

## Usage

```
Usage: hawkbitctl [<command>] [<args>]
A simple CLI for managing hawkbit

    -h, --help  display this help and exit

Subcommands, for more information for any subcommand use:
hawkbitctl <command> --help

    tags        Manage target tags
    targets     Manage targets
    rollouts    Manage rollouts
```

## Development

For local development, set `HAWKBITCTL_SOURCEDIR="$PWD/src"`

    export HAWKBITCTL_SOURCEDIR="$PWD/src"
