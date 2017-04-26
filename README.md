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
## Accessing host file system
Note that Vagrant mounts the working directory (the one with the Vagrantfile in)
at /vagrant on the guest (the VM). You can access files by copying them to the
working directory of the host. If you would like them to persist in the guest's
image just copy them to somewhere within the guest filesystem such as the home
vagrant user home directory.

## Packaging vagrant boxes
Sometimes it is useful to package an entire VM running the Monax platform 
capturing any configuration of chain state that has been developed.

Once you have configured a state you would like to save from the host do the
following (using v0.16.0 as our example branch):

```shell
# Half VM to snapshot
vagrant halt v0.16.0
# Create Vagrant package containing VM and metadata
vagrant package v0.16.0
```

A file called `package.box` will have been created in the local directory. You
can send that to others to use or you can add it to your own local Vagrant image
repository to be used as a base to build other machines.

To add the box to a machine's Vagrant image repository do the following:

```
# The name can be whatever you choose, but will be used to refer to the new base box
vagrant box add --name monax-0.16.0-with-bells package.box 
```

To use the Vagrant image as base create a new project directory with the following
`Vagrantfile` at its root:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "monax-0.16.0-with-bells"
end
```

Then run:

```shell
vagrant up
vagrant ssh
```

You will now be in a Vagrant file with the state you persisted. You can make
as many different machines as you like from this state either by copying the
stub Vagrantfile above or by defining new machines like this:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "monax-0.16.0-with-bells"
  config.vm.define "foo"
  config.vm.define "bar"
end
```

You can then work with two isolated Vagrant boxes from the same project directory:

```
vagrant up foo
vagrant up bar
```

