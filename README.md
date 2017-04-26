# Vagrant Environments for Monax CLI
This Vagrant repository provides one with repeatable virtualbox machine builds
of the Monax CLI tool for running Burrow chains. It supports building machines
with the `monax` tool pre-installed. Simply run the command below replacing
`<release tag>` with one of: `v0.12.0`, `v0.16.0`, or `v0.17.0`

```shell
vagrant up <release tag>
vagrant ssh <release tag>
monax version
```
Also available is the `eenv` tool for setting environment variables `$chain_id`
and `$addr` for 'simplechains' (chains with a single full participant). Just run

```shell
eenv <chain name>
```

And `$chain_id` will be set to chain id and `$addr` will be set to the EVM address of
the single full participant so `monax pkgs do` can be run as:

```shell
monax pkgs do -c $chain_id -a $addr
```
