require 'spec_helper'

describe Parser do
  describe '.resolve' do
    context 'when there is a hour has parameter in file' do
      let(:file) { ["talk4 45hour\n"] }

      it { expect { described_class.resolve(file) }.to raise_error(Exceptions::OrganizerTalksException) }
    end

    context 'when there is no time' do
      let(:file) { ["talk4\n"] }

      it { expect { described_class.resolve(file) }.to raise_error(Exceptions::OrganizerTalksException) }
    end

    context 'when there is no talk' do
      let(:file) { ["10min\n"] }

      it { expect { described_class.resolve(file) }.to raise_error(Exceptions::OrganizerTalksException) }
    end

    context 'when there is a blank line' do
      let(:file) { ["talk1 10min\n", "\n", "talk2 20min\n"] }

      it { expect { described_class.resolve(file) }.to raise_error(Exceptions::OrganizerTalksException) }
    end

    context 'when there is repeated talk' do
      let(:file) { ["talk1 10min\n", "talk1 10min\n"] }

      it { expect { described_class.resolve(file) }.to raise_error(Exceptions::OrganizerTalksException) }
    end

    context 'when there is a blank line' do
      let(:file) { ["talk1 10min\n", "talk2 20min\n"] }

      it { expect(described_class.resolve(file)).to eq({"talk1"=>10, "talk2"=>20}) }
    end
  end
end
