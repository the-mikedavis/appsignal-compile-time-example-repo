# Asdf

> This repo is a minimum example for
> [`appsignal/appsignal-elixir#643`](https://github.com/appsignal/appsignal-elixir/issues/643).
> This has been patched since v2.1.6! Thanks appsignal team :)

---

Fails to compile without the appsignal configuration being set at compile-time.

Steps to make one of these repos:

```
mix archive.install hex phx_new --force
mix phx.new asdf
cd asdf
mix deps.get
yarn install --cwd assets # not necessary, just muscle memory
iex -S mix phx.server
```

Then add these dependencies to the `mix.exs`:

```elixir
{:appsignal_phoenix, "~> 2.0"},
{:appsignal, "~> 2.1"},
```

And instrument the endpoint with appsignal_phoenix:

```elixir
# lib/asdf_web/endpoint.ex
defmodule AsdfWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :asdf

  use Appsignal.Phoenix

  ..
```

and compile again:

```
$ mix compile --force --warnings-as-errors
Compiling 14 files (.ex)

== Compilation error in file lib/asdf_web/endpoint.ex ==
** (ArgumentError) could not fetch application environment :config for application :appsignal because configuration at :config was not set
    (elixir 1.11.0) lib/application.ex:656: Application.fetch_env!/2
    (appsignal 2.1.5) lib/appsignal/config.ex:121: Appsignal.Config.debug?/0
    (appsignal 2.1.5) lib/appsignal/logger.ex:11: Appsignal.Logger.debug/1
    lib/asdf_web/endpoint.ex:4: (module)
    (stdlib 3.13.2) erl_eval.erl:680: :erl_eval.do_apply/6
    (elixir 1.11.0) lib/kernel/parallel_compiler.ex:314: anonymous fn/4 in Kernel.ParallelCompiler.spawn_workers/7
```
