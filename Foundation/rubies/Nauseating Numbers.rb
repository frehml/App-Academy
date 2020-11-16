def strange_sums(numbers)
    count = 0
    numbers.each.with_index do |num1, idx1|
        numbers.each.with_index do |num2, idx2|
            if idx2 > idx1
            count += 1 if num1 + num2 == 0
            end
        end
    end
    return count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(numbers, product)
    count = 0
    numbers.each.with_index do |num1, idx1|
        numbers.each.with_index do |num2, idx2|
            if idx2 > idx1
            count += 1 if num1 * num2 == product
            end
        end
    end
    return count > 0 
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(word, hash)
    new_word = ""
    word.each_char do |char|
        if hash.has_key?(char)
            hash[char].times {new_word += char}
        else
            new_word += char
        end
    end
    return new_word
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})               # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3})   # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})            # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})              # 'faaaarm'

def perfect_square(number)
    (0...number+1).each do |num|
        return true if num * num == number
    end
    return false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def anti_prime?(number)
    div1 = 0
    div2 = 0
    div3 = 0
    (1..number).each do |num1|
        div1 += 1 if number % num1 == 0
    end

    (1...number).each do |num2|
        (1..num2).each do |num3|
            div3 += 1 if num2 % num3 == 0
        end
        div2 = div3 if div3 > div2
        div3 = 0
    end
    div1 > div2
end

# p anti_prime?(24)     # true
# p anti_prime?(36)     # true
# p anti_prime?(48)     # true
# p anti_prime?(360)    # true
# p anti_prime?(1260)   # true
# p anti_prime?(27)     # false
# p anti_prime?(5)      # false
# p anti_prime?(100)    # false
# p anti_prime?(136)    # false
# p anti_prime?(1024)   # false

def matrix_addition(matrix1, matrix2)
matrix = Array.new(matrix1.length) { |index| []}
    matrix1.each.with_index do |row, idx1|
        row.each.with_index do |ele, idx2|
            matrix[idx1] << matrix1[idx1][idx2] + matrix2[idx1][idx2]
        end
    end
    return matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]
# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*numbers)
temp_array = []
array = []
    numbers.each do |number|
        (0..number).each do |num|
            temp_array << num if number % num == 0
        end
    end
    return temp_array
end

# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(number)
    return 1 if number == 1
    return 1 if number == 2
    return 2 if number == 3

    tribonacci_number(number-3) + tribonacci_number(number-2) + tribonacci_number(number-1)
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
    new_matrix = []
    return matrices if matrices.length < 2
    matrices.each.with_index do |matrix, idx|
        return nil if !matrices[idx+1].nil? && matrix.length != matrices[idx+1].length
    end

    matrices.inject do |cum, fact|
    new_matrix = matrix_addition(cum, fact)
    end
    return new_matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]
# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squaragonal?(array)
n = 0
down_eles = []
while n < array.length
  down_eles << array[n][n]
  n += 1
end

up_eles = []
x = 0
y = array.length - 1
while up_eles.length < array.length 
  up_eles << array[y][x]
  x += 1
  y -= 1
end

# p squarocol?([
#     [:o, :x , :o],
#     [:o, :x , :o],
#     [:o, :x , :o],
# ]) # true
# p squarocol?([
#     [:o, :o, :o],
#     [:o, :o, :o],
#     [:x, :x, :x],
# ]) # true
# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false
# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true
# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false


return down_eles.uniq.length == 1 || up_eles.uniq.length == 1
end

def pascals_triangle(num)
  triangle = [[1]]
  array = []
  x = 0
  while triangle.length < num + 1
    (triangle[-1].length + 1).times do
      if x - 1 == -1
        array << 0 + triangle[-1][x]
      elsif triangle[-1][x].nil?
        array << triangle[-1][x - 1] + 0
      else
        array << triangle[-1][x - 1] + triangle[-1][x]
      end
      x += 1
    end
    triangle << array
    array = []
    x = 0
  end
  return triangle
end

# p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]
#
# p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

def prime?(num)
(2...num).each do |fact|
  return false if num % fact == 0
end
return true
end

def has_power?(num)
(1..num/4 + 2).each do |num1|
  (1..num/2 + 1).each do |num2|
    return true if num1 ** num2 - 1 == num 
  end
end
return false
end

def mersenne_prime(num)
array = []
x = 2
until array.length == num
  array << x if prime?(x) && has_power?(x)
  x += 1
end
return array[-1]
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_num?(number)
  (1..number).each do |i|
    return true if (i * (i + 1)) / 2 == number
  end
  false
end

def triangular_word?(word)
alphabet = ("a".."z").to_a
count = 0
word.each_char do |char|
  count += alphabet.index(char) + 1
end
return triangular_num?(count)
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(array)
n = 0
const = false
  while n < array.length - 1
    if !array[n + 1].nil?
      if array[n] == array[n + 1] + 1 || array[n] == array[n + 1] - 1
        array.delete_at(n)
        array.delete_at(n)
        const = true
      else
        const = false
      end
    else
      const = false
    end
    if const
      n = 0
    else
      n += 1
  end
end
  return array
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def prime?(num)
(2...num).each do |fact|
  return false if num % fact == 0
end
return true
end

def prime?(num)
(2...num).each do |fact|
  return false if num % fact == 0
end
return true
end

def prime?(num)
(2...num).each do |fact|
  return false if num % fact == 0
end
return true
end

def pretentious_primes(array, n)
  primes_array = []
  new_array = []
  x = 2
  array.each do |number|
    primes_array << number
    if n > 0
      while number != primes_array[-n - 1]
        primes_array << x if prime?(x) && x != number
        x += 1
        primes_array.sort!
      end
      new_array << primes_array[-1]
      primes_array = []
      x = 2
    end

    if n < 0
      while primes_array[-2] != number
        primes_array << x if prime?(x) && x != number
        x += 1
        primes_array.sort!
      end
        new_array << primes_array[-2 + n] 
      primes_array = []
      x = 2
    end

    
  end
  return new_array
end

#p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
#p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
#p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
#p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
#p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
#p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
#p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
#p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
#p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
#p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]