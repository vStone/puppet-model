# Purpose

Define a puppet tree that should work for most use cases,
be simple for large environments and small.

# Layout

```

/etc/puppet
├── auth.conf
├── environments
│   ├── 0.1
│   │   ├── manifests
│   │   │   ├── classes
│   │   │   └── nodes
│   │   └── modules
│   │       ├── contrib
│   │       │   └── foo
│   │       │       ├── files
│   │       │       ├── manifests
│   │       │       │   ├── init.pp
│   │       │       │   ├── params.pp
│   │       │       │   └── repo.pp
│   │       │       └── templates
│   │       ├── internal
│   │       └── roles
│   ├── &lt;custom branch name&gt;
│   │   ├── manifests
│   │   │   ├── classes
│   │   │   └── nodes
│   │   └── modules
│   │       ├── contrib
│   │       ├── internal
│   │       └── roles
│   └── development
│       ├── manifests
│       │   ├── classes
│       │   └── nodes
│       └── modules
│           ├── contrib
│           ├── internal
│           └── roles
├── fileserver.conf
├── manifests
├── modules
└── puppet.conf

```

# Packaging

## What?

We will need 2 packages at least.

### puppet-tree-base

Most configuration will be done from puppet itself, but we should try
to provide at least a configuration set that will allow people to test
this out in vagrant without a big hassle.

This package will also make sure to have all the dependencies on
technologies or tools we use in this setup.

* Required set of dependencies
  * hieradata stuff
  * ...
* Required set of files
  * puppet.conf:
      Working puppet.conf to run with minimal effort. Properly Documented.
  * hiera.yaml:
      Basic hieradata layout.  Properly documented.
  * README.md:
      Short tutorial on how to use this kind of setup effectively.
      Should document on how to quickly get going.
      Include a Jenkins tutorial for example on how we setup our pipes.
      Preferably we provide a module to setup everything puppet-wize. How
      awesome would that be.
   * modules/README.md:
      More documentation. :)
   * manifests/...:
      Whatever files needed to get this party going..errr documented!
   * environments/:
      Maybe a bootstrap environment? Or a puppet environment?
      Can we trick puppet into submission this way?
      This could include some modules even. Something to manage a pulp repo?
      Who knows, this might play well with our Jenkins tutorial also.
  * hieradata/:
      placeholder, maybe an example file. Something for our bootstrap/puppet
      environment? also, docs.


### puppet-tree-env-&lt;name&gt;

So, once we have the basics laid out out. We can install additional
environments. These babies might certainly include our default set of modules. neatly setup in modules/purrrfect-puppet-installation-magic/&lt;our-modules&gt;

Document on how to make this the active environment for your puppetmaster
so you can start doing awesome things like stored configs, enc and whatever.
Customize your puppetmaster who you can scratch with your eyes closed.

* Required set of dependencies
  * does rpm have something like suggested packages? Debian has.
    who's gonna do Debian packages?
* Required set of files
  * ?? whatever you want I suppose. Whatever you need :)
