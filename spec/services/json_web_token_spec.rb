describe JsonWebToken do
    let(:exp_time) { double('Time', to_i: 'exp_time') }

    before do
        stub_const('JsonWebToken::SECRET_KEY', 'secret-key')
    end

    describe '.encode' do
        it 'calls JWT.encode with passed arguments' do
            JWT.stub(:encode).with({exp: exp_time.to_i, user_id: :user_id}, 'secret-key').and_return('jwt-token')

            token = JsonWebToken.encode({ user_id: :user_id }, exp_time)

            expect(token).to eq('jwt-token')
        end
    end

    describe '.decode' do
        it 'calls JWT.decode and passes token' do
            JWT.stub(:decode).with('jwt-token', 'secret-key').and_return([{ decoded: :payload }, nil])

            decoded_payload = JsonWebToken.decode('jwt-token')

            expect(decoded_payload).to eq(HashWithIndifferentAccess.new({ decoded: :payload }))
        end
    end
end