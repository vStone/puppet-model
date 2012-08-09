# Purpose

Define a puppet tree that should work for most use cases,
be simple for large environments and small.

# Layout

```

/etc/puppet
├── auth.conf
├── environments
│   ├── 0.1
│   │   ├── hieradata
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
│   ├── <custom branch name>
│   │   ├── hieradata
│   │   ├── manifests
│   │   │   ├── classes
│   │   │   └── nodes
│   │   └── modules
│   │       ├── contrib
│   │       ├── internal
│   │       └── roles
│   └── development
│       ├── hieradata
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
