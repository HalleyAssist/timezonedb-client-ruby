
require_relative '../spec_helper'

describe Timezonedb::Client do
  describe '#execute' do
    let(:url) { 'http://api.timezonedb.com' }
    let(:api_key) { 'api_key_92834' }
    let(:latitude) { 40.91331 }
    let(:longitude) { 24.61922 }
    let(:query) do
      {
        key: api_key,
        lat: latitude,
        lng: longitude,
        format: 'json'
      }
    end

    let(:status) { 'OK' }
    let(:message) { 'an OK message' }
    let(:country_code) { 'GR' }
    let(:zone_name) { 'Europe\/Athens' }
    let(:abbreviation) { 'EEST' }
    let(:gmt_offset) { '10800' }
    let(:dst) { '1' }
    let(:timestamp) { 1_429_107_488 }
    let(:correct_response_body) do
      {
        'status' => status,
        'message' => message,
        'countryCode' => country_code,
        'zoneName' => zone_name,
        'abbreviation' => abbreviation,
        'gmtOffset' => gmt_offset,
        'dst' => dst,
        'timestamp' => timestamp
      }
    end

    subject { Timezonedb::Client.new(api_key).search_by_coords(latitude, longitude) }

    context 'when successful request' do
      let(:response_body) { correct_response_body.to_json }

      before(:each) do
        stub_request(:get, url)
          .with(query: query)
          .to_return(status: 200,
                     body: response_body)
      end

      it 'should return response with correct message' do
        expect(subject.message).to eq message
      end

      it 'should return response with correct country_code' do
        expect(subject.country_code).to eq country_code
      end

      it 'should return response with correct zone_name' do
        expect(subject.zone_name).to eq zone_name
      end

      it 'should return response with correct abbreviation' do
        expect(subject.abbreviation).to eq abbreviation
      end

      it 'should return response with correct gmt_offset' do
        expect(subject.gmt_offset).to eq gmt_offset
      end

      it 'should return response with correct dst' do
        expect(subject.dst).to eq dst
      end

      it 'should return response with correct timestamp' do
        expect(subject.timestamp).to eq timestamp
      end
    end

    context 'when unsuccessful requests' do
      shared_examples 'an error raiser' do
        it 'raises an Error' do
          expect { subject }.to raise_error(Timezonedb::Client::Error)
        end
      end

      context 'when successful response code' do
        let(:response_body) do
          correct_response_body['status'] = 'NOT_OK'
          correct_response_body.to_json
        end

        before(:each) do
          stub_request(:get, url)
            .with(query: query)
            .to_return(status: 200,
                       body: response_body)
        end

        it_behaves_like 'an error raiser'
      end

      context 'when failure response code' do
        let(:response_body) { 'unsuccessful request body :(' }

        context 'when 400 responses' do
          before(:each) do
            stub_request(:get, url)
              .with(query: query)
              .to_return(status: 400,
                         body: response_body)
          end

          it_behaves_like 'an error raiser'
        end

        context 'when 500 responses' do
          before(:each) do
            stub_request(:get, url)
              .with(query: query)
              .to_return(status: 500,
                         body: response_body)
          end

          it_behaves_like 'an error raiser'
        end
      end
    end
  end
end
