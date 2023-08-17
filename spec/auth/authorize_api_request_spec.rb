# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  # create test user
  # Valid request subject
  subject(:request_obj) { described_class.new(header) }

  let(:user) { create(:user) }
  # mock `Authorization` header
  let(:header) { { 'Authorization' => token_generator(user.id) } }

  # Invalid request subject
  let(:invalid_request_obj) { described_class.new({}) }

  # Test Suite for AuthorizeApiRequest#call
  # This is our entry point into the service class
  describe '#call' do
    # returns user object when request is valid
    context 'when valid request' do
      it 'returns user object' do
        result = request_obj.call
        expect(result[:user]).to eq(user)
      end
    end

    # returns error message when invalid request
    context 'when invalid request' do
      context 'when missing token' do
        it 'raises a MissingToken error' do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::MissingToken, 'Missing token')
        end
      end

      context 'when invalid token' do
        subject(:invalid_request_obj) do
          # custom helper method `token_generator`
          described_class.new('Authorization' => token_generator(5))
        end

        it 'raises an InvalidToken error' do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
        end
      end

      context 'when token is expired' do
        subject(:request_obj) { described_class.new(header) }

        let(:header) { { 'Authorization' => expired_token_generator(user.id) } }

        it 'raises ExceptionHandler::ExpiredSignature error' do
          expect { request_obj.call }
            .to raise_error(
              ExceptionHandler::InvalidToken,
              /Signature has expired/
            )
        end
      end

      context 'fake token' do
        subject(:invalid_request_obj) { described_class.new(header) }

        let(:header) { { 'Authorization' => 'foobar' } }

        it 'handles JWT::DecodeError' do
          expect { invalid_request_obj.call }
            .to raise_error(
              ExceptionHandler::InvalidToken,
              /Not enough or too many segments/
            )
        end
      end
    end
  end
end
