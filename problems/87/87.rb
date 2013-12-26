#!/usr/bin/env ruby

def is_prime (x)

  i   = 2
  max = x - 1

  # check previously calculated values
  if $primes[x] == 1 then
    #puts "\tnabbed cache for #{x} (true)"
    prime = true
    return(prime)
  elsif $composites[x] == 1 then
    #puts "\tnabbed cache for #{x} (false)"
    prime = false
    return(prime)
  end

  # default true until proven otherwise
  prime = true

  # < 2 is not prime
  if x < i then
    prime = false
    return(prime)
  end

  (i..max).each do |j|
    #puts "\ttesting #{x} as divisible by #{j}"
    if x % j == 0 then
      #puts "\tnot prime (#{j})"
      prime = false
      $composites[x] = 1
      return(prime)
    end
  end

  #puts "\tis prime"
  $primes[x] = 1
  return(prime)

end

def find_root (i, depth)

  root = i ** (1.0/depth)
  root = root.floor

  #puts "returning root #{root} (depth #{depth}) for #{i}"

  return(root)

end
  
def check_sum (max, x, y, z)

  if sum = (x + y + z) then
    if sum <= max then
      $sums[sum] = 1
      #puts "found sum! #{sum}"
    end
  end

end

puts "running problem 87..."

max         = 50000000
#max          = 50
power_min    = 2
power_depth  = 4
prime_min    = 2

$primes      = Hash.new
$composites  = Hash.new
$sums        = Hash.new

prime_powers = []
k            = []

# enumerate possible elements
(power_min..power_depth).each do |i|
  #puts "testing for root #{i}..."
  r = find_root max, i
  k.clear
  (prime_min..r).each do |j|
    if true == is_prime(j) then
      #puts "going to include #{j} for power depth #{i}"
      k.push(j ** i)
    end
  end
  #puts k.inspect
  prime_powers[i] = Array.new(k)
end

#puts prime_powers.inspect

prime_powers[power_depth].each do |i|
  prime_powers[power_depth-1].each do |j|
    prime_powers[power_depth-2].each do |k|
      check_sum(max, i, j, k)
    end
  end
end

puts "found #{$sums.length} sums for a given maximum of #{max}"
exit
