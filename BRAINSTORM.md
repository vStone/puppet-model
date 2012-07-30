# Puppet module requirements

## Use parameters

By rule, no user of your module should need to touch any code to change
configuration. An example in it's most primitive form:

Bad:

```
  class x::params {
    $foo = 'bar'
  }
```

Good:

```
  class x::params (
    $foo = 'bar'
  ) {
    $package = $::operatingsystem ? {}
  }

  class x {
    require x::params
    $foo = $::x::params::foo
  }

```

Better:

```
  class x::params(
    $foo = 'bar',
    $os_dep = undef,
  ) {
    $_os_dep = $os_dep ? {
      undef    => $::operatingsystem ? {
        /(?i:centos|redhat)/  => 'redhat_dep',
        default               => 'default_dep',
      },
      default  => $os_dep,
    }
  }

  class x (
    $foo    = $::x::params::foo,
    $os_dep = $::x::params::_os_dep,
  ) inherits ::x::params  {

    # VICTORY, I CAN OVERLOAD SHIT GLOBALLY, AND CLASS SPECIFIC!!

  }

```

## Don't configure repositories.

You can list your required repositories as a requirement in your fine
documentation, but don't force system admins to use a specific repository.
In an environment where you need more control over installed packages, this
can be a mess to deal with.

You can however include a definition for a repository, but don't include it
by default. Allow the user to choose to do so.

