require 'spec_helper'

describe Conference do
  let(:file) { File.readlines(File.join("spec", "fixtures","input.txt")) }

  let(:parsed_file) { {"talk1"=>60, "talk2"=>45, "talk3"=>30, "talk4"=>45, "talk5"=>45, "talk6"=>5, "talk7"=>60, "talk8"=>45, "talk9"=>30, "talk10"=>30, "talk11"=>45, "talk12"=>60, "talk13"=>60, "talk14"=>45, "talk15"=>30, "talk16"=>30, "talk17"=>60, "talk18"=>30, "talk19"=>30} }

  let(:organized_talks) { {0=>{:morning=>{"talk1"=>60, "talk2"=>45, "talk3"=>30, "talk4"=>45}, :afternoon=>{"talk5"=>45, "talk6"=>5, "talk7"=>60, "talk8"=>45, "talk9"=>30, "talk10"=>30}}, 1=>{:morning=>{"talk11"=>45, "talk12"=>60, "talk13"=>60}, :afternoon=>{"talk14"=>45, "talk15"=>30, "talk16"=>30, "talk17"=>60, "talk18"=>30, "talk19"=>30}}} }

  subject { described_class.new(file) }

  describe '.new' do
    it { is_expected.to have_attributes(talks: parsed_file, tracks_number: 2) }
  end

  describe '#organize' do
    before do
      expect(subject).to receive(:shuffled_talks).and_return(parsed_file)
      expect(Organizer).to receive(:process).with(parsed_file, 2).and_return(organized_talks)
    end

    it { expect(subject.organize).to eq organized_talks }
  end

  describe '#shuffled_talks' do
    it { expect(subject.shuffled_talks).not_to contain_exactly parsed_file }
    it { expect(subject.shuffled_talks).to match_array parsed_file }
  end
end
