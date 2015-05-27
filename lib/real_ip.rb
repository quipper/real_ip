# http://hemal.kuntawa.la/post/3958107290/client-ip-addresses-on-heroku
class RealIp
  def initialize(app)
    @app = app
  end

  def call(env)
    set_remote_addr env
    @app.call env
  end

  def set_remote_addr(env)
    fwd = env['HTTP_X_FORWARDED_FOR']
    if fwd
      ip = fwd.strip.split(/[,\s]+/)[0] # stolen from Rack::Request#split_ip_addresses
    else
      ip = env['HTTP_X_REAL_IP'] || env['REMOTE_ADDR']
    end
    env['QUIPPER_REMOTE_ADDR'] = ip
  end
end
