defmodule Echo do

  def start(_type, _args) do
    # http://ninenines.eu/docs/en/cowboy/1.0/manual/cowboy_router/index.html
    dispatch = :cowboy_router.compile([
      { :_, [                                # match on all hostnames
          {"/", Echo.Handler, []} ]}         # use our handler at root path
    ])
    { :ok, _ } = :cowboy.start_http(
        :http,
        10,                                  # number of acceptors
        [{:port, 8080}],                     # transport opts
        [{ :env, [{:dispatch, dispatch}]}])  # protocol opts
  end
end

defmodule Echo.Handler do
  # http://ninenines.eu/docs/en/cowboy/HEAD/guide/ws_handlers/
  @behaviour :cowboy_websocket_handler

  def init({ _transport, _http }, _req, _opts) do
    { :upgrade, :protocol, :cowboy_websocket }
  end

  def websocket_init(_transport, req, _opts) do
    {:ok, req, :undefined_state }
  end

  def websocket_terminate(_reason, _req, _state) do
    :ok
  end

  def websocket_handle(msg, req, state) do
    { :reply, msg, req, state }
  end

  def websocket_info(_info, _req, _state) do
  end
end
