# frozen_string_literal: true

class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(real, imaginary = 0)
    @real = real
    @imaginary = imaginary
  end

  def ==(other)
    (self - other).abs < 1e-15
  end

  def +(other)
    ComplexNumber.new((real + other.real), (imaginary + other.imaginary))
  end

  def -(other)
    ComplexNumber.new((real - other.real), (imaginary - other.imaginary))
  end

  def *(other)
    ComplexNumber.new(
      (real * other.real - imaginary * other.imaginary),
      (real * other.imaginary + imaginary * other.real)
    )
  end

  def /(other)
    ComplexNumber.new(
      (real * other.real + imaginary * other.imaginary).to_f /
        (other.real**2 + other.imaginary**2),
      (imaginary * other.real - real * other.imaginary).to_f /
        (other.real**2 + other.imaginary**2)
    )
  end

  def abs
    Math.sqrt(real**2 + imaginary**2)
  end

  def conjugate
    ComplexNumber.new(real, -imaginary)
  end

  def exp
    ComplexNumber.new(
      Math.exp(real) * Math.cos(imaginary),
      Math.exp(real) * Math.sin(imaginary)
    )
  end
end
