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

   p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten





end

