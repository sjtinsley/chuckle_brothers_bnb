require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chuckle_hotel_test')
      DatabaseConnection.setup
    end
  end

  describe '.connection' do
    it 'checks that it keeps the same connection throughout' do
      connect = DatabaseConnection.setup
      expect(DatabaseConnection.connection).to eq connect
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup
  
      expect(connection).to receive(:exec_params).with("SELECT * FROM spaces;", [])
  
      DatabaseConnection.query("SELECT * FROM spaces;")
    end
  end

end