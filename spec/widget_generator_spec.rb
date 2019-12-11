require_relative 'spec_helper'

describe 'WidgetGenerator#WidgetManager#generate_widgets ' do

    before(:each) do
        @WidgetManager = WidgetGenerator::WidgetManager
    end

    it 'generates 100 widgets for tooling around with' do
        expected = 100
        expect(@WidgetManager.generate_widgets.count).to eq(expected)
    end

    it 'generates 100 widgets for tooling around with' do
        @WidgetManager.generate_widgets.each { |w|
            expect(w.should be_an_instance_of(WidgetGenerator::Widget.class))
        }
    end

end