class Array

    def

    def my_each(arr)

        idx = 0

        while idx < (self.length -1)
            puts self[idx]
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

#comment



end

