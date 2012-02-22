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
  class x::params(
    $foo = 'bar'
  ) {
  }
```

## Don't configure repositories.

You can list your required repositories as a requirement in your fine
documentation, but don't force system admins to use a specific repository.
In an environment where you need more controll over installed packages, this
can be a mess to deal with.

You can however include a definition for a repository, but don't include it
by default. Allow the user to choose to do so.

