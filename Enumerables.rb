# require 'Byebug'

class Array


    def my_each(&blk)

        idx = 0

        while idx < (self.length)
            blk.call(self[idx])
            idx += 1
        end

        self
    end

    def my_select(&blk)
        new_arr = []

        self.my_each { |ele| new_arr << ele if blk.call(ele) }

        new_arr
    end

    def my_reject(&blk)
        new_arr = []

        self.my_each { |ele| new_arr << ele if !blk.call(ele) }

        new_arr
    end

    def my_any?(&blk)
        self.my_each {|ele| return true if blk.call(ele)}
        false
    end

    def my_all?(&blk)
        count = 0
        self.my_each {|ele| count += 1 if blk.call(ele)}

        if count == self.length
            return true
        else
            false
        end
    end

    def my_flatten
        flatten_arr = []
        return [self] if !self.is_a?(Array) 
        self.my_each do |ele|
            if ele.is_a?(Array)
                flatten_arr += ele.my_flatten
            else
                flatten_arr << ele
            end
        end
        flatten_arr
    end

#     def my_zip(*arr)
#         new_arr = Array.new(self.length) { Array.new((arr.length+1),nil) }
#         arr.push(self)

#         # [ [1,2] , [1,2,3] , [4,5,6] , [7,8,9] , [10,11,12] , [13,14,15] ]
#         # [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
#         debugger
#         self.my_each.with_index do |ele, idx1|

#             arr.my_each.with_index do |sub_arr, idx2|

#                 new_arr[idx2][idx1] == arr[idx2][idx1]

#             end
#         end

#         new_arr
        
#     end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


end

