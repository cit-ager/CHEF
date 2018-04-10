
# Intiger
x=1
puts x

# In case if you want to access this variable inside quotes then use #{x}

puts "Value of X = #{x}"

## Define Array, Array is the one wto store multiple values.

x=[1,2,3]

puts x[0] # but index starts from 0 - n

## Define Hash, Hash is one which allows to give own keys instead of index like in array

x={
    'name' => 'DevOps',
    'time' => '6am',
    'location' => 'online'
}

puts x['name']

## Interpolation means the using of When you want to access a hash inside quotes.

puts "Course Name = #{x['name']}"

puts 'Course Name = #{x["name"]}'

#
x={
    'y'  => {
        'course' => 'DevOps'
    }
}

puts x['y']['course'] 

#  White Space Array

x=%w(one two)

puts x[0]