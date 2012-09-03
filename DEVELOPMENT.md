# Introduction

This is a abstract on how development on a puppet tree can/should be done to
be most effective and easy to use/understand by everyone.

# Components

We will first start off by defining a couple of components that make a complete
puppet tree.

* Configuration.
* Environments.
* Puppet (sub)modules.
* Versioning (Not VCS, but actual release versions).
* (Hiera) data.

Some of these obviously also intersect and the order is hard to determine,
they are all equally important and part of the tree.

# Scenario

How should the ideal scenario look like.

* I have the tree, and I'm currently working on something. I commit my changes
  to the development branch (often).
* Our Jenkins (or whatever build infrastructure) picks up on the VCS change and
  starts the pipeline for our tree.
* Syntax/Style checks done, our build infra produces a package (rpm) that gets
  deployed to a repository.
* Our puppetmaster detects a newer version of the development branch (package)
  is available and updates the package.
* I go to the (test) machine, and run puppet (use the develop environment!) and
  see if everything works.
* Repeat the cycle until everything works as expected
* We reached all the milestone goals => Make a release
* Changes are merged to the master branch and a tag is set
* Jenkins builds the release (syntax/style checks are more strict)
* We install the released package to the puppetmaster
* Switch agents to the new puppet environment.

# Some question marks remain...

* How do we update the puppet agents to the new environment? (mcollective ?)
