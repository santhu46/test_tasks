class Evaluation
 def initialize (pattern)
  @data = pattern.split('')  unless pattern.nil?
	@operators = [ '*','+','-','/']
	@container = Array.new
 end

 def pattern_evaluation
 	 if @data
 		 @data.each_with_index do|operand,index|
			 if !@operators.include? operand
			  @container << operand
			 else
				 return -1  if (index == 0 || index == 1 || @container.size < 2)
				 container_manipulation(operand)
			 end
		 end
	   @container.pop
	 else
		"Please provide pattern"
	 end 
 end
private
 def container_manipulation(operand)
	 value = @container[-2].to_i.method(operand).(@container[-1].to_i)
	 @container[-2] = value
	 @container.pop
 end
end

def sample_patterns
	pattern1 = "13+62*7+*"
	pattern2 = "13+62*+*"
	evaluation = Evaluation.new(pattern1)
  puts "Value of pattern(13+62*7+*):#{evaluation.pattern_evaluation}"
  evaluation = Evaluation.new(pattern2)
  puts "Value of pattern(13+62*+*):#{evaluation.pattern_evaluation}"
end
sample_patterns

