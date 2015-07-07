require 'spec_helper'

describe Organizer do
  describe '.process' do
    context 'when none tracks number was given' do
      it { expect { Organizer.process({}, 0) }.to raise_error(Exceptions::OrganizerTalksException) }
    end

    context 'when talks fit on tracks given' do
      let(:talks) { {"talk1"=>60, "talk2"=>45, "talk3"=>30} }

      before { Organizer.process(talks, 1) }

      it { expect(talks).to be_empty }
    end

    context 'when talks does not fit on tracks given' do
      let(:talks) { {"talk1"=>260, "talk2"=>245, "talk3"=>230} }

      it { expect { Organizer.process(talks, 1) }.to raise_error(Exceptions::OrganizerTalksException) }
    end
  end
end
