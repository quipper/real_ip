require 'spec_helper'

describe RealIp do
  let(:app) { ->(env) {  } }
  let(:mid) { RealIp.new app }

  describe '#set_remote_addr' do
    context 'have HTTP_X_FORWARDED_FOR' do
      it 'set first ip addr to QUIPPER_REMOTE_ADDR' do
        env = { 'HTTP_X_FORWARDED_FOR' => '9.9.9.9, 3.3.3.3' }
        mid.set_remote_addr env
        expect(env['QUIPPER_REMOTE_ADDR']).to eq '9.9.9.9'
      end

      it 'ignore other keys' do
        env = { 'HTTP_X_FORWARDED_FOR' => '9.9.9.9', 'REMOTE_ADDR' => '3.3.3.3' }
        mid.set_remote_addr env
        expect(env['QUIPPER_REMOTE_ADDR']).to eq '9.9.9.9'
      end
    end

    it 'set HTTP_X_REAL_IP or REMOTE_ADDR' do
      env = { 'HTTP_X_REAL_IP' => '9.9.9.9', 'REMOTE_ADDR' => '3.3.3.3' }
      mid.set_remote_addr env
      expect(env['QUIPPER_REMOTE_ADDR']).to eq '9.9.9.9'
    end

    it 'set REMOTE_ADDR' do
      env = { 'REMOTE_ADDR' => '3.3.3.3' }
      mid.set_remote_addr env
      expect(env['QUIPPER_REMOTE_ADDR']).to eq '3.3.3.3'
    end
  end

  describe '#call' do
    let(:env) { { 'REMOTE_ADDR' => '9.9.9.9' } }

    it 'invoke set_remote_addr' do
      expect(mid).to receive(:set_remote_addr).with(env)
      mid.call env
    end

    it 'invoke app.call' do
      expect(app).to receive(:call).with('QUIPPER_REMOTE_ADDR' => '9.9.9.9', 'REMOTE_ADDR' => '9.9.9.9')
      mid.call env
    end
  end
end
