module Cryptoexchange::Exchanges
  module Vb
    module Services
      class Pairs < Cryptoexchange::Services::Pairs

        def fetch
          adapt(super)
        end

        def adapt(output)
          output.map do |pair|
            Cryptoexchange::Models::MarketPair.new(
              base: pair[:base],
              target: pair[:target],
              inst_id: pair[:inst_id],
              market: Vb::Market::NAME
            )
          end
        end
      end
    end
  end
end
