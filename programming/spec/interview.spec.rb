$:.unshift(File.dirname(__FILE__) + '/..')
require 'pow'
require 'polindrome'
require 'email'

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

describe 'Email method in String class' do
	it 'String class should contain email? method' do
		(String.method_defined? :email?).should be_true
	end

	it 'should be true for email address' do
		'maIl@zone.example.com'.email?.should be_true
	end

	it 'should be false for not email address' do
		'It is not@email. string'.email?.should be_false
	end
end

describe 'Power test' do
	it 'result of X^0, where n=0 should be OK' do
		test_x.each do |x|
			(pow(x,0) == 1).should be_true
		end
	end

	it 'result of X^n, where n<0 should be OK' do
		test_x.each do |x|
			test_neg_n.each do |n|
				(pow(x, n) == (x**n)).should be_true
			end
		end

		(pow(4, -0.5) ==  0.5).should be_true
	end

	it 'result of X^n, where n>0 should be OK' do
		test_x.each do |x|
			test_pos_n.each do |n|
				(pow(x, n) ==  x**n).should be_true
			end
		end

		(pow(4, 0.5) ==  2.0).should be_true
	end
end

