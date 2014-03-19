$:.unshift(File.dirname(__FILE__) + '/..')
require 'pow'
require 'polindrome'

test_x = (1..11).to_a
test_neg_n = (-11..-1).to_a
test_pos_n = (1..11).to_a

describe 'Polindrome test' do
	it 'polindrome function should be OK' do
		polindrome('foo').should be_false
		polindrome('foof').should be_true
		polindrome('Foof').should be_true
	end
end

describe 'Power test' do
	it 'result of X^0, where n=0 should be OK' do
		test_x.each do |x|
			pow(x,0).should be_equal 1
		end
	end

	it 'result of X^n, where n<0 should be OK' do
		test_x.each do |x|
			test_neg_n.each do |n|
				pow(x, n).to_f.should be_equal (x**n).to_f
			end
		end

		pow(4, -0.5).to_f.should be_equal 0.5
	end

	it 'result of X^n, where n>0 should be OK' do
		test_x.each do |x|
			test_pos_n.each do |n|
				pow(x, n).should be_equal x**n
			end
		end

		pow(4, 0.5).should be_equal 2.0
	end
end

